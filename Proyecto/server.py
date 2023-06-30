
from flask import Flask,jsonify,render_template, request, send_file
from reportlab.pdfgen import canvas
from command.Comandos import GenericCMD

app=Flask(__name__,static_folder="./static",template_folder="./templates")

#Rutas
@app.route("/")
def home():
    return render_template("modulo.html")

@app.route("/pruebas")
def pruebas():
    return render_template("pruebas.html")




#Servicios
@app.route("/verificarUsuario",methods=["POST","GET"])
def verificarUsuario():
    if request.method == 'POST':
        data=request.get_json()
        dat=GenericCMD.execute(
            {"comando":f"select nombre, apellido, rol from empleado where lower(correo)=lower('{data['correo']}') and rol=3",
             "commit":False})
    return jsonify({"ok":True if len(dat)>0 else False,"data":list(dat[0])})


@app.route("/cons",methods=["POST","GET"])
def cons():
    if request.method=='POST':
        data=request.get_json()
        print(data["comando"])
        dat=GenericCMD.execute({"comando":data['comando'],"commit":True})
        print("ok")
    try:
        return jsonify({"data":dat})
    except:
        return ""

@app.route('/ObtenerRegistro',methods=['POST','GET'])
def obtenerRegistro():
    data=request.get_json()
    '''
    Se espera que data se componga de 
        columnas
        opciones (de seleccion)
    '''
    assert 'columnas' in data
    assert 'opciones' in data
    print(f"select {data['columnas']} from {data['opciones']}")
    dat=GenericCMD.execute({'comando': f"select {data['columnas']} from {data['opciones']}"})
    print(dat)
    try:
        return jsonify({'data':dat})
    except:
        return ""

@app.route('/AgregarRegistro', methods=['POST'])
def AgregarRegistro():
    data=request.get_json()
    '''
    Se espera que data se componga de 
        tabla
        valores
    '''
    GenericCMD.execute({
        'comando':f"insert into {data['tabla']} values {data['valores']}",
        'commit':True})
    return ''

@app.route('/ActualizarRegistro', methods=['POST'])
def actualizarRegistro():
    data=request.get_json()
    '''
    Se espera que data tenga
    tabla
    columna
    valor
    opciones (de seleccion)
    '''
    assert 'tabla' in data
    assert 'columna' in data
    assert 'valor' in data
    assert 'opciones' in data
    GenericCMD.execute({
        'comando':f"update {data['tabla']} set {data['columna']} = {data['valor']} {data['opciones']}",
        'commit':True})
    return ''






@app.route('/descargar_pdf', methods=['GET'])
def descargar_pdf():
    dat=GenericCMD.execute({"comando":"select P.periodo from calendario C, obra O, periodo P where C.fechafin<sysdate and C.idobra=O.idobra and O.idperiodo=P.idperiodo",
                        "commit":True})
    
    nombre_archivo = "docum.pdf"
    print('ok')
    # Crear un lienzo (canvas) para el PDF
    pdf = canvas.Canvas(nombre_archivo)
    # Agregar contenido al PDF
    pdf.setFont("Helvetica", 16)
    pdf.drawString(25, 750, "Liquidación de estudiantes periodo "+str(dat[0][0]))
    pdf.setFont("Helvetica", 9)
    dat=GenericCMD.execute({"comando":"select E.nombre||' '||E.apellido ,E.codestudiante, U.nomunidad ,sum(EXTRACT(HOUR FROM C.fechafin-C.fechainicio)+EXTRACT(Day FROM C.fechafin-C.fechainicio)*24+EXTRACT(HOUR FROM C.fechafin-C.fechainicio)*24*30) diferencia from calendario C, estudiante E, participacionEstudiante P, unidad U where C.conseccalendario=P.conseccalendario  and E.codestudiante=P.codestudiante and E.codunidad=U.codunidad group by E.correo, E.nombre||' '||E.apellido ,E.codestudiante, U.nomunidad",
                        "commit":True})
    for n,i in enumerate(dat):
        pdf.drawString(25,750-40*(n+1), f"Nombre: {i[0]:80} Codigo: {i[1]}")
        pdf.drawString(25,750-40*(n+1)-20, f"Facultad: {i[2]:80} Horas {i[3]}")

    # Finalizar el PDF
    print('ok')
    pdf.showPage()
    pdf.save()
    print('ok')
    ruta_archivo = '../' + nombre_archivo

    GenericCMD.execute({"comando":"update calendario set idestado='Inactivo' where fechafin<sysdate",
                        "commit":True})
    return send_file(ruta_archivo)



@app.route('/enviar_correo')
def enviar_correo():
    '''
    Se supone debería enviar un correo pero no quiero tener que poner credenciales ni contraseñas asi que pongo un remplazo.
    '''
    return f"<h1>{Message}</h1><p>destinatario {i[0]}</p><p>Asunto Electiva cursada en el grupo Sinfonica UD - periodo {periodo}</p><p>curricular 1 que el estudiante {i[1]} código {i[2]} curso la electiva participación sinfonicaUD durante el período {periodo}</p>"
    

app.run()
