import os
from typing import Mapping

from flask import Flask, render_template, Response
from werkzeug.utils import secure_filename
from werkzeug.datastructures import  FileStorage


def createApp():
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        # https://flask.palletsprojects.com/en/2.1.x/config/ for Configuration Options
        SECRET_KEY="dev",
        DATABASE=os.path.join(app.instance_path, "flaskr.sqlite"),
    )

    @app.route("/submit")
    def hello():
        return Response("hello", mimetype="text/plain")

    @app.route("/cwd")
    def cwd():
        return Response(os.getcwd(), mimetype="text/plain")

    @app.route("/life")
    def life():
        return Response("\n".join(os.listdir(".")), mimetype="text/plain")

    @app.route('/')
    def home():
        return render_template('index.html')
	
    @app.route('/uploader', methods = ['GET', 'POST'])
    def upload_file():
        if request.method == 'POST':
            f = request.files['file']
            f.save(secure_filename(f.filename))
            return 'file uploaded successfully'

    return app

if __name__ == '__main__':
    app = createApp()
    app.run()