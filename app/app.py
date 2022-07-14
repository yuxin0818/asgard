import os
from typing import Mapping

from flask import Flask, render_template, Response


def createApp():
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
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

    @app.route("/")
    def root():
        return render_template("index.html")


    return app

if __name__ == '__main__':
    app = createApp()
    app.run()
