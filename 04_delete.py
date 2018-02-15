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
        rows = cursor.execute("delete from dictcursor where name = 'bob'")
        print(rows)
        connection.commit()
finally:
    connection.close()