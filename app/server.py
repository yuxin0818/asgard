import os
from pathlib import PurePath
from time import time

from flask import (Flask, Response, flash, redirect, render_template, request,
                   url_for)
from werkzeug.utils import secure_filename

count = 0
UPLOAD_FOLDER = "uploads"

def createApp():
    app = Flask(__name__)
    app.config.from_mapping(
        # https://flask.palletsprojects.com/en/2.1.x/config/ for Configuration Options
        UPLOAD_FOLDER=UPLOAD_FOLDER,
        SECRET_KEY="dev",
        DATABASE=os.path.join(app.instance_path, "flaskr.sqlite"),
    )

    @app.route("/", methods=["GET", "POST"])
    def home():
        if request.method == "POST":
            if "file" not in request.files:
                flash("No file part")
                return redirect(request.url)
            file = request.files["file"]
            print(type(request))
            if file.filename == "":
                flash("No selected file")
                return redirect(request.url)
            if file:
                filename: str = secure_filename(f"{time()}_{file.filename}")

                if PurePath(filename).suffix == ".zip":
                    file.save(os.path.join(app.config["UPLOAD_FOLDER"], filename))
                    flash("File Uploaded Successfully")
                else:
                    flash("File Upload Failed. See File Specification for more information.")
        return render_template("index.html")

    @app.route("/status.html", methods=["GET", "POST"])
    def status():
        return render_template("status.html")

    @app.route("/reports.html", methods=["GET", "POST"])
    def reports():
        return render_template("reports.html")

    @app.route("/signin.html", methods=["GET", "POST"])
    def signIn():
        return render_template("signin.html")
    
    @app.route("/signup.html", methods=["GET", "POST"])
    def signUp():
        return render_template("signup.html")

    @app.route("/signout.html", methods=["GET", "POST"])
    def signOut():
        return render_template("signout.html")
    


    return app


if __name__ == "__main__":
    app = createApp()
    app.debug = True
    app.run()
