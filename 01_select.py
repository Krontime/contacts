# import pymysql.cursors
import pymysql
import os

username = os.environ.get("C9_USER")

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user=username,
                             password='',
                             db='Chinook')

try:
    with connection.cursor() as cursor:
        # Read a single record
        sql = "SELECT * FROM dictcursor"
        cursor.execute(sql)
        result = cursor.fetchall()
        
        print(result)
finally:
    connection.close()