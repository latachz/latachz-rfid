#!/usr/bin/env python

import psycopg2
from config import config
import time
import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522
import datetime

GPIO.setwarnings(False)

GPIO.setmode(GPIO.BCM)

buzzer = 26

GPIO.setup(buzzer, GPIO.OUT)

def connect():
    GPIO.output(buzzer, GPIO.HIGH)
	time.sleep(0.5)
	GPIO.output(buzzer, GPIO.LOW)

    reader = SimpleMFRC522()

    try:
        while True:
            id, text = reader.read()
            currentDT = datetime.datetime.now()
   
    finally:
        GPIO.cleanup()


if __name__ == '__main__':
    connect()
