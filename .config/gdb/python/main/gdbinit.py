import os

startup = os.getenv("PYTHONSTARTUP")
if startup:
    with open(startup) as f:
        text = f.read()
    exec(text)
