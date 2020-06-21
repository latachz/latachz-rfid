#!/usr/bin/env python

import requests
import time
# import RPi.GPIO as GPIO
# from mfrc522 import SimpleMFRC522

# GPIO.setwarnings(False)

# GPIO.setmode(GPIO.BCM)

# buzzer = 26

# GPIO.setup(buzzer, GPIO.OUT)

URL = "http://localhost:4000/api/users"

def main():
    try:
        # GPIO.output(buzzer, GPIO.HIGH)
        # time.sleep(0.5)
        # GPIO.output(buzzer, GPIO.LOW)

        #reader = SimpleMFRC522()

        while True:
            #uid, name = reader.read()

            uid = 987654321
            name = "Adam"

            r = requests.post(url=URL, headers={"Content-Type": "application/json"}, json={
                'user': {
                    'rfid_uid': uid,
                    'name': name
                }
            })

            if (r.status_code == 500):
                print(f'User not not created')
                break
            else:
                print(f'User created with uid: {uid} and name: {name}')
                break

                # GPIO.cleanup())
    finally:
        #GPIO.cleanup()
        print("finished")


if __name__ == '__main__':
    main()
