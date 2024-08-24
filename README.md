Overview
This API is designed to interact with a MySQL database for a university system. It provides endpoints to fetch data from various tables, insert new records, and retrieve class enrollment information for students. The API is built using FastAPI and interacts with a MySQL database.

Setup
Base URL: http://localhost:8000
Database: MySQL
Database Name: uni
Tables:
STDinfo (Student Information)
PROFinfo (Professor Information)
CLASSinfo (Class Information)
ENROLLinfo (Enrollment Information)
Endpoints
1. Fetch Table Data
Endpoint: GET /fetch_table/
Description: Retrieves all records from a specified table.
Query Parameters:
table_name (str): The name of the table to fetch data from. Valid values are "STDinfo", "PROFinfo", "CLASSinfo", "ENROLLinfo".
Responses:
200 OK: Returns the data from the specified table.
400 Bad Request: Returns an error if the table name is invalid.
500 Internal Server Error: Returns an error if a database error occurs.
2. Insert Data
Endpoint: POST /insert/
Description: Inserts a new student record into the STDinfo table.
Request Body:
name (str): The name of the student.
phone (int): The student's phone number.
Responses:
200 OK: Returns a success message if the data is inserted successfully.
400 Bad Request: Returns an error if the phone number already exists in the database.
500 Internal Server Error: Returns an error if an unexpected issue occurs.
3. Get Students
Endpoint: GET /students/
Description: Retrieves a list of all students with their IDs and names from the STDinfo table.
Responses:
200 OK: Returns a list of students with their IDs and names.
500 Internal Server Error: Returns an error if a database error occurs.
4. Get Enrolled Class
Endpoint: GET /enrolled_class/
Description: Retrieves the name of the class that a student is enrolled in based on the student ID.
Query Parameters:
student_id (int): The ID of the student whose class enrollment information is requested.
Responses:
200 OK: Returns the name of the class the student is enrolled in.
404 Not Found: Returns an error if no class is found for the given student ID.
500 Internal Server Error: Returns an error if a database error occurs.
Error Handling
400 Bad Request: Invalid request parameters or data.
404 Not Found: Requested resource or data not found.
500 Internal Server Error: Issues with the database or unexpected errors.
