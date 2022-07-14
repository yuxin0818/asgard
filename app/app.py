import os
from typing import Mapping

from flask import Flask, render_template, Response


def createApp(test_config: Mapping = None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY="dev",
        DATABASE=os.path.join(app.instance_path, "flaskr.sqlite"),
    )

    if test_config is None:
        app.config.from_pyfile("config.py", silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route("/submit")
    def hello():
        return Response("hello", mimetype="text/plain")

    @app.route("/cwd")
    def test():
        return Response(os.getcwd(), mimetype="text/plain")

    @app.route("/")
    def root():
        return render_template("index.html")


    return app

if __name__ == '__main__':
    app = createApp()
    app.run()
