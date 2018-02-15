# import pymysql.cursors
import pymysql
import datetime
import os

username = os.environ.get("C9_USER")

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user=username,
                             password='',
                             db='Chinook')


try:
    with connection.cursor() as cursor:
        cursor.execute("drop table if exists dictcursor")
        cursor.execute("""CREATE TABLE dictcursor (name char(20), age int , DOB datetime)""")

        data = [("bob", 21, "1990-02-06 23:04:56"),
                ("jim", 56, "1955-05-09 13:12:45"),
                ("fred", 100, "1911-09-12 01:01:01")]
        cursor.executemany("insert into dictcursor values (%s,%s,%s)", data)
        
        connection.commit()

finally:
    connection.close()