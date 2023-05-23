from flask import Flask,jsonify,render_template,request
import command.Comandos
app=Flask(__name__,static_folder="./static",template_folder="./templates")

#Rutas
@app.route("/estudiantes")
def home():
    return render_template("estudiantes.html")


@app.route("/registro")
def home():
    return render_template("registro.html")