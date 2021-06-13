from flask import Flask, request
from subprocess import call
import threading

app = Flask(__name__)


def background_call(line):
    def inner():
        call(line, shell=True)
    threading.Thread(target=inner).start()


@app.route("/githook", methods=["GET"])
def githook():
    id = request.args.get("id")
    if not id:
        return "Must provide ID", 400

    try:
        id = int(id)
    except Exception:
        return "ID must be integer", 400

    if id == 1:
        background_call("bash /home/pi/github/GitAutoPull/pull.sh")
    elif id == 4:
        background_call("bash /home/pi/github/GitAutoPull/pullWishList.sh")
    elif id == 5:
        background_call("sudo bash /var/www/dimission/pull")
    return "Success"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8082, threaded=True)
