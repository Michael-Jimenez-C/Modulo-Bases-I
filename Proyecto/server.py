
from flask import Flask,jsonify,render_template,request
from command.Comandos import GenericCMD

app=Flask(__name__,static_folder="./static",template_folder="./templates")
#Rutas
@app.route("/")
def home():
    return render_template("modulo.html")

@app.route("/verificarUsuario",methods=["POST","GET"])
def verusu():
    if request.method == 'POST':
        data=request.get_json()
        dat=GenericCMD.execute({"comando":f"select nombre, apellido, rol from empleado where lower(correo)=lower('{data['correo']}')","commit":False})
    return jsonify({"ok":True if len(dat)>0 else False,"data":list(dat[0])})

app.run()