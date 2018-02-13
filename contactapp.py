from flask import Flask, request
from flask import render_template

app = Flask(__name__)

welcomes = "Hello World!"

contacts = {
    "Krishen Rana": {"Name": "Krishen Rana", "Email": "krishenrana@me.com", "Mobile_Number": "720-903-0392"},
    "Jennifer Aulsebrook": {"Name": "Jennifer Aulsebrook", "Email": "jennifersue_12@yahoo.com", "Mobile_Number": "720-560-9775"},
    "Paresh Rana": {"Name": "Paresh Rana", "Email": "pr@pareshrana@mac.com", "Mobile_Number": "303-669-9653"},
    }

@app.route("/")
def main_page():
    return render_template("index.html", welcomes = welcomes)


@app.route("/contacts")
def contact_page():
    return render_template("contacts.html", contacts = contacts.values())


@app.route("/submitcontact", methods = ["GET", "POST"])
def submit_contact():
    if request.method == "POST":
        Name = request.form.get("name")
        Email = request.form.get("email")
        Mobile_Number = request.form.get("mobile_number")
        contacts.update({Name: {"Name": Name, "Email": Email, "Mobile_Number": Mobile_Number}})
        
        return render_template("contacts.html", contacts = contacts.values())


@app.route("/delete", methods=["POST"])
def delete_contact():
    name_to_delete = request.form.get("contact_to_delete")

    del(contacts[name_to_delete])
    
    return render_template("contacts.html", contacts = contacts.values())


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)