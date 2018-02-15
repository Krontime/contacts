import pymysql
import os

username = os.environ.get("C9_USER")


# Connect to the database
connection = pymysql.connect(host='localhost',
                             user=username,
                             password='',
                             db='Chinook')

try:
    with connection.cursor(pymysql.cursors.DictCursor) as cursor:
        # Read a single record
        sql = "SELECT * FROM dictcursor"
        cursor.execute(sql)
        rows = cursor.fetchall()

        for row in rows:
            print(row)
finally:
    connection.close()