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
        
   # execute a statement
        #cur.execute("INSERT INTO users (rfid_uid, name) VALUES (%s, %s)", (165654642423, "latachz"))
        print('Users:')
        cur.execute('SELECT id, name, rfid_uid FROM users')
 
        row = cur.fetchall()

        for r in row:
            print(f"id: {r[0]} name: {r[1]}")

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