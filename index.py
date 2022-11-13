from flask import redirect
from flask import Flask
from flask import url_for
from flask import request
from flask import render_template
from flask import send_file



app = Flask(__name__, template_folder='./template')

@app.route('/', methods=["GET", "POST"])
def index():
    if request.method == 'POST':
        f = open('./sh-files/script.sh', 'w')
        checked =  request.form.getlist('check')
        for item in checked:
            if item in checked:
                scripts = open(f'scripts/{item}.txt', 'r')
                f.write(''.join(scripts))
                f.write('\n')
            
        return redirect(url_for('download'))
    return render_template('index.html')

@app.route('/download', methods=['GET', 'POST'])
def download():
    path = './sh-files/script.sh'
    return send_file(path, as_attachment=True)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
