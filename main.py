#!/usr/bin/env python

import psycopg2
from config import config
import time
import RPi.GPIO as GPIO
from mfrc522 import SimpleMFRC522


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

        reader = SimpleMFRC522()

        try:
            while True:
                id, text = reader.read()
                currentDT = datetime.datetime.now()
                cursor.execute("SELECT id FROM users WHERE rfid_uid="+str(id))
                cursor.fetchone()

                if cursor.rowcount >= 1:
                    print("Overwrite\nexisting user?")
                    overwrite = input("Overwrite (Y/N)? ")
                    if overwrite[0] == "y" or overwrite[0] == 'y':
                        print("Overwriting user.")
                        time.sleep(1)
                        sql_insert = "UPDATE users SET name = %s WHERE rfid_uid=%s"
                    else:
                        continue
                else:
                    sql_insert = "INSERT INTO users (name, rfid_uid) VALUES (%s, %s, %s, %s)"
                    print("Enter new name")
                    new_name = input("Name: ")

                    cursor.execute(sql_insert, (new_name, id, currentDT, currentDT))

                    conn.commit()

                    print("User" + new_name + "\nSaved")
                    time.sleep(2)
        finally:
            GPIO.cleanup()

        print('Inserting user')
        cur.execute("INSERT INTO users (id, name) VALUES (%s, %s, %s, %s)", (new_name, id, currentDT, currentDT))

        cur.execute("SELECT id, name from users")

        row = cur.fetchall()

        for r in row:
            print(f"id: {r[0]} name: {r[1]}")
        
        conn.commit()

    finally:
        if conn is not None:
            conn.commit()
            conn.close()
            print('Database connection closed.')


if __name__ == '__main__':
    connect()
