#!/usr/bin/python
import psycopg2
from config import config
 
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
        cur = conn.cursor()

        print('Inserting user')
        cur.execute("INSERT INTO users (id, name) VALUES (%s, %s)", (id, name))

        cur.execute("SELECT id, name from users")

        row = cur.fetchall()

        for r in row:
                print(f"id: {r[0]} name: {r[1]}")

    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
 
if __name__ == '__main__':
    connect()