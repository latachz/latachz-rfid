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
GPIO.output(buzzer, GPIO.LOW)

reader = SimpleMFRC522()

def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()
 
        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
      
        # create a cursor
        cursor = conn.cursor()
        
        try:
          while True:
            print('Place Card to\nrecord attendances')
            id, text = reader.read()
            GPIO.output(buzzer, GPIO.HIGH)
            time.sleep(0.1)
            GPIO.output(buzzer, GPIO.LOW)

            currentDT = datetime.datetime.now()

            cursor.execute("Select id, name FROM users WHERE rfid_uid="+str(id))
            result = cursor.fetchone()

            if cursor.rowcount >= 1:
              print("Welcome " + result[1])
              cursor.execute("INSERT INTO attendances (user_id, inserted_at, updated_at) VALUES (%s, %s, %s)", (result[0], currentDT, currentDT) )
              conn.commit()
            else:
              print("User does not exist.")
            time.sleep(2)
        finally:
          GPIO.cleanup()

        conn.commit()
       
       # close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
 
 
if __name__ == '__main__':
    connect()
