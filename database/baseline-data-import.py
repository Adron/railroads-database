# Module Imports
import mariadb
import sys
import os

# This code file imports the data in the various failes in the data directory into the railroads database.

input("Data import process will begin one you press any key to continue...")
print("Starting, hope you meant to press that! 🤣 🎉")

# The following imports the data from the class-1-railroads.txt file into a table called class-1-railroads.

user = os.environ['DB_USER']
password = os.environ['DB_PASSWORD']
host = os.environ['DB_HOST']

if user == "":
    print("No user set for authentication, existing script.")
    exit()
if password == "":
    print("No password set for authentication, exiting script.")
    exit()
if host == "":
    print("No database host set to connect to, existing script.")
    exit()

print("Configuration validated.")

# Database configuration
# db_config = {
#     'user': 'your_username',
#     'password': 'your_password',
#     'host': '127.0.0.1',
# }
#
# try:
#     conn = mariadb.connect(
#         user="db_user",
#         password="db_user_passwd",
#         host="192.0.2.1",
#         port=3306,
#         database="employees"
#
#     )
# except mariadb.Error as e:
#     print(f"Error connecting to MariaDB Platform: {e}")
#     sys.exit(1)
#
# # Get Cursor
# cur = conn.cursor()
#
# cur.execute(
#     "CREATE DATABASE railroads;",
#     (some_name,))