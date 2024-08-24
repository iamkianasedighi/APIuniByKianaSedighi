from fastapi import FastAPI, HTTPException, Depends
from fastapi import Request
from pydantic import BaseModel
import mysql.connector
from typing import Optional

# Create an instance of FastAPI
app = FastAPI()

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="uni"
)
###############################
#task1
#function of showing the chosen table

def fetch_table_data(table_name: str):
    allowed_tables = {"STDinfo", "PROFinfo", "CLASSinfo", "ENROLLinfo"}
    
    if table_name not in allowed_tables:
        raise HTTPException(status_code=400, detail="Invalid table name")
    else:
        try:
            mycursor = mydb.cursor(dictionary=True)  # Using dictionary=True for JSON-like results
            mycursor.execute(f"SELECT * FROM {table_name}")
            results = mycursor.fetchall()
            return results
        except mysql.connector.Error as e:
            raise HTTPException(status_code=500, detail=f"Database error: {e}")
        except Exception as e:
            raise HTTPException(status_code=500, detail=f"An unexpected error occurred: {e}")

@app.get("/fetch_table/")
async def fetch_table(table_name: str):
    data = fetch_table_data(table_name)
    return {"data": data}
###############################
#task2
# Function to insert data into the database
def insert_function(newName: str, newPhone: int):
    try:
        newcursor = mydb.cursor()
        # Check if the phone number already exists in the database
        newcursor.execute(f"SELECT * FROM STDinfo WHERE phone = {newPhone}")
        existing_row = newcursor.fetchone()
        
        # If the phone number is new, insert a new row
        if not existing_row:
            newcursor.execute(f"INSERT INTO STDinfo (name, phone) VALUES ({newName}, {newPhone})")
            # Commit the transaction to save changes
            mydb.commit()
            return {"message": "Data inserted successfully!"}
        else:
            # If the phone number already exists, return an error message
            return {"error": "This person is already in the database"}
    except Exception as e:
        # Raise an HTTPException if there's an error during the database operation
        raise HTTPException(status_code=500, detail=f"An error occurred: {e}")
# Define a Pydantic model for the request body
class DataModel(BaseModel):
    name: str   # Name field
    phone: int  # Phone field


# Define a POST endpoint to insert data into the database
@app.post("/insert/")
async def insert_data(request: Request, data: DataModel):
    try:
        # Call the insert_function with the data from the request body
        result = insert_function(data.name, data.phone)
        return result
    except HTTPException as e:
        # Propagate any HTTPException that occurs
        raise HTTPException(status_code=e.status_code, detail=e.detail)
###############################
#task3
#finding the given name's student name of the classes this person has enrolled
#we aim to tell the user name of the class this person enrolled
def get_student_names():
    try:
        cursor = mydb.cursor(dictionary=True)
        cursor.execute("SELECT id, name FROM STDinfo")
        results = cursor.fetchall()
        return results
    except mysql.connector.Error as e:
        raise HTTPException(status_code=500, detail=f"Database error to fetch students name: {e}")

def get_enrolled_class(student_id: int):
    try:
        cursor = mydb.cursor(dictionary=True)
        cursor.execute("SELECT CLASSid FROM ENROLLinfo WHERE STDid = %s", (student_id,))
        class_id_result = cursor.fetchone()
        if class_id_result: #explanation behind
            class_id = class_id_result['CLASSid'] #explanation behind
            cursor.execute("SELECT name FROM CLASSinfo WHERE id = %s", (class_id,))
            class_name_result = cursor.fetchone()
            return class_name_result['name'] if class_name_result else None #explanation behind
        return None
    except mysql.connector.Error as e:
        raise HTTPException(status_code=500, detail=f"Database error: {e}")
@app.get("/students/")
async def get_students():
    students = get_student_names()
    return {"students": students}

@app.get("/enrolled_class/")
async def get_enrolled_class_name(student_id: int):
    class_name = get_enrolled_class(student_id)
    if class_name:
        return {"enrolled_class_name": class_name}
    else:
        raise HTTPException(status_code=404, detail=f"No class found for Student ID {student_id}.")