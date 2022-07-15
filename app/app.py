import os
count = 0

from flask import Flask, flash, request, redirect, url_for, render_template, Response
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = 'uploads'

def createApp():
    app = Flask(__name__)
    app.config.from_mapping(
        # https://flask.palletsprojects.com/en/2.1.x/config/ for Configuration Options
        UPLOAD_FOLDER = UPLOAD_FOLDER,
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

    @app.route('/', methods = ['GET', 'POST'])
    def home():
        if request.method == 'POST':
            if 'file' not in request.files:
                flash('No file part')
                return redirect(request.url)
            file = request.files['file']
            # If the user does not select a file, the browser submits an
            # empty file without a filename.
            if file.filename == '':
                flash('No selected file')
                return redirect(request.url)
            if file:
                filename = secure_filename(file.filename)
                file.save(filename)
                return redirect(url_for('download_file', name=filename))
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