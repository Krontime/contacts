from flask import Flask, render_template, request
import pymysql
import os

app = Flask(__name__)

username = os.environ.get("C9_USER")

def do_select(sql):
    # Connect to the database
    connection = pymysql.connect(host='localhost',
                                 user=username,
                                 password='',
                                 db='Chinook')

    try:
        with connection.cursor(pymysql.cursors.DictCursor) as cursor:
            cursor.execute(sql)
            return cursor.fetchall()
                
    finally:
        connection.close()
        
        

@app.route('/')
def get_artists():
    return render_template("artists.html", artists=do_select("select * from Artist"))
    
@app.route('/albums')
def get_albums():
    return render_template("albums.html", albums=do_select("select * from Album"))

@app.route("/artistsearch", methods = ["GET"])
def search_page():
    search = request.args.get("search")
    command = "select * from Artist where Name like '%{0}%'".format(search)
    return render_template("artist_search.html", artists=do_select(command))
    
    
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)