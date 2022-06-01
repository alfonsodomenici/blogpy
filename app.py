import mysql.connector
from flask import Flask, render_template, request, url_for, flash, redirect,jsonify
from werkzeug.exceptions import abort

def get_db_connection():
    conn = mysql.connector.connect(host="localhost",   user="root",   password="telemedicina2123",   database="db_post" )
    return conn


def get_post(post_id):
    conn = get_db_connection()
    
    cur=conn.cursor(dictionary=True)
    cur.execute('SELECT * FROM posts WHERE id = %s',(post_id,))
    post = cur.fetchone()
    conn.close()
    if post is None:
        abort(404)
    return post


app = Flask(__name__)
app.config['SECRET_KEY'] = 'QWERTYUIOP1234567890'


@app.route('/')
def index():
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    cur.execute('SELECT * FROM posts order by created limit 12 ')
    posts = cur.fetchall()
    cur.execute('SELECT * FROM categories ')
    categories = cur.fetchall()
    conn.close()
    return render_template('index.html', posts=posts, cats=categories) 

@app.route('/jsonposts')
def jsonposts():
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    cur.execute('SELECT * FROM posts order by created desc')
    posts = cur.fetchall()
    conn.close()
    return jsonify(posts)

@app.route('/jsoncatstat')
def jsoncatstat():
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    frasesql='SELECT category , count(distinct p.id) as totpost, count( c.id) as totcomm FROM posts p inner join comments c on p.id= c.idpost group  by category'
    cur.execute(frasesql)
    stats = cur.fetchall()
    conn.close()
    return jsonify(stats)



@app.route('/allposts')
def allposts():
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    cur.execute('SELECT * FROM posts order by created desc')
    posts = cur.fetchall()
    conn.close()
    return render_template('allposts.html', posts=posts) 

@app.route('/postsjson')
def postsjson():
    return render_template('postsjson.html') 


@app.route('/<int:post_id>')
def post(post_id):
    post = get_post(post_id)
    return render_template('post.html', post=post)

@app.route('/<int:post_id>/jsoncomments')
def jsoncomments(post_id):
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    valori=(post_id,)
    cur.execute('SELECT * FROM comments where idpost = %s  order by created desc',valori)
    comments = cur.fetchall()
    conn.close()
    return jsonify(comments)

@app.route('/createjson')
def createjson():
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    cur.execute('SELECT * FROM categories ')
    cats = cur.fetchall()
    conn.close()


    return render_template('createjson.html',cats=cats)



@app.route('/create', methods=('GET', 'POST'))
def create():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            cur=conn.cursor(dictionary=True)
            cur.execute('INSERT INTO posts (title, content) VALUES (%s, %s)',
                         (title, content))
            conn.commit()
            conn.close()
            return redirect(url_for('index'))

    return render_template('create.html')

@app.route('/creabyjson', methods=('GET', 'POST'))
def creabyjson():
    if request.method == 'POST':
        title = request.json['title'] #recupero il title da oggetto json
        content = request.json['content']
        cat = request.json['category']
        #creo connessionecreo 
        conn = get_db_connection()
        cur=conn.cursor(dictionary=True)
        cur.execute('INSERT INTO posts (title, content,category) VALUES (%s, %s,%s)',
                        (title, content,cat))
        conn.commit()
        #eseguo query insert 
        #recupero id ultimo record inserito dal cursore
        lastid = cur.lastrowid;
        #creo oggetto dict python
        objson = { "msg": "post creato correttamente", "id":lastid}
        #lo trasformo in stringa json
        objson= jsonify(objson)
        #chiudo la connessione
        conn.close()
        # la mia chianata ritorna una strisciata di testo in formato json
        return objson
    else :
        return render_template("errore.html")        




@app.route('/<int:id>/edit', methods=('GET', 'POST'))
def edit(id):
    post = get_post(id)

    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        if not title:
            flash('Title is required!')
        else:
            conn = get_db_connection()
            cur=conn.cursor(dictionary=True)
            cur.execute('UPDATE posts SET title = %s, content = %s'
                         ' WHERE id = %s',
                         (title, content, id))
            conn.commit()
            conn.close()
            return redirect(url_for('index'))

    return render_template('edit.html', post=post)


@app.route('/<int:id>/delete', methods=('POST',))
def delete(id):
    post = get_post(id)
    conn = get_db_connection()
    cur=conn.cursor(dictionary=True)
    cur.execute('DELETE FROM posts WHERE id = %s', (id,))
    conn.commit()
    conn.close()
    flash('"{}" was successfully deleted!'.format(post['title']))
    return redirect(url_for('index'))
