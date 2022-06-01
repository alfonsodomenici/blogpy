
import mysql.connector

connection = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="db_its"
)


cur = connection.cursor()

cur.execute("INSERT INTO posts (title, content) VALUES (%s, %s)",
            ('First Post', 'Content for the first post')
            )

cur.execute("INSERT INTO posts (title, content) VALUES (%s, %s)",
            ('Second Post', 'Content for the second post')
            )

connection.commit()
connection.close()
