#!/usr/bin/env python

import time
#import RPi.GPIO as GPIO
#from mfrc522 import SimpleMFRC522
import datetime
import requests
import json

URL = "http://localhost:4000/api"

# GPIO.setwarnings(False)

# GPIO.setmode(GPIO.BCM)

# buzzer = 26

# GPIO.setup(buzzer, GPIO.OUT)

uid = int(input("Uid: "))

def main():
    # GPIO.output(buzzer, GPIO.HIGH)
	# time.sleep(0.5)
	# GPIO.output(buzzer, GPIO.LOW)

    # reader = SimpleMFRC522()

    try:
        while True:
            uid, name = reader.read()

            # uid = 123456789

            r = requests.post(url=f"{URL}/attendances", headers={"Content-Type": "application/json"}, json={
                'rfid_uid': uid
            })
            
            if r.status_code==404:
                print(f'User not found')
                name = input("Give me your name: ")
                rc = requests.post(url=f"{URL}/users", headers={"Content-Type": "application/json"}, json={
                	'user': {
                		'name': name,
                		'rfid_uid': uid
                	}
            	})
                if rc.status_code == 200:
                    r = requests.post(url=f"{URL}/attendances", headers={"Content-Type": "application/json"}, json={
                        'rfid_uid': uid
                        })
                    print(f"Attendance checked on uid: {uid}")
                else:
                    print("WE ARE LOST!")
                break
            else:
                print(f'Attendance checked on uid: {uid}')
                break
            
    finally:
        #GPIO.cleanup()
        print("finished")


if __name__ == '__main__':
    main()
