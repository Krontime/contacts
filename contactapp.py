from flask import Flask, request, redirect, url_for
from flask import render_template
import json

app = Flask(__name__)

welcomes = "Hello World!"

contacts = {
    1: {"id": 1, "Name": "Krishen Rana", "Email": "krishenrana@me.com", "Mobile_Number": "720-903-0392"},
    2: {"id": 2, "Name": "Jennifer Aulsebrook", "Email": "jennifersue_12@yahoo.com", "Mobile_Number": "720-560-9775"},
    3: {"id": 3, "Name": "Paresh Rana", "Email": "pr@pareshrana@mac.com", "Mobile_Number": "303-669-9653"},
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
        unique_id_generator = Name + Email + Mobile_Number
        ids = id(unique_id_generator)
        contacts.update({ids: {"id": ids, "Name": Name, "Email": Email, "Mobile_Number": Mobile_Number}})
        
        return render_template("contacts.html", contacts = contacts.values())


@app.route("/delete", methods=["POST"])
def delete_contact():
        
    id_to_delete = int(request.form.get("contact_to_delete"))
    
    del(contacts[id_to_delete])
    
    return redirect(url_for("contact_page"))


@app.route("/api/contacts")
def all_contacts_json():
    s = json.dumps(contacts)
    return s


@app.route("/api/contacts/<int:id>")
def a_contact_json(id):
    id = int(id)
    return json.dumps(contacts[id])


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)