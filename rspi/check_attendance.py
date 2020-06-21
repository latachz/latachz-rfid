#!/usr/bin/env python

from config import config
import time
#import RPi.GPIO as GPIO
#from mfrc522 import SimpleMFRC522
import datetime
import requests
import json

URL = "http://localhost:4000/api/attendances"

# GPIO.setwarnings(False)

# GPIO.setmode(GPIO.BCM)

# buzzer = 26

# GPIO.setup(buzzer, GPIO.OUT)

def main():
    # GPIO.output(buzzer, GPIO.HIGH)
	# time.sleep(0.5)
	# GPIO.output(buzzer, GPIO.LOW)

    # reader = SimpleMFRC522()


    try:
        while True:
            # uid, name = reader.read()

            uid = 123456789

            r = requests.post(url=URL, headers={"Content-Type": "application/json"}, json={
                'rfid_uid': uid
            })
            print(r.status_code)
            
            if (r.status_code==500):
                print(f'User not found')
                break
            else:
                print(f'Attendance checked on uid: {uid}')
                break
            
    finally:
        #GPIO.cleanup()
        print("finished")


if __name__ == '__main__':
    main()
