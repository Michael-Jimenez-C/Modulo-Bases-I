import {actualizar,agregar,consulta} from './consultas.js'

const e = React.createElement;

/*
#######################################################################################################
#                                                                                                     #
#                           INTERFACES                                                                #
#                                                                                                     #
#######################################################################################################
*/

async function acceder(){
    let correo=document.getElementsByClassName('acceder correo')[0].value;
    
    let c=await fetch(`http://localhost:5000/verificarUsuario`,{
    method:"POST",
    headers: {
        'Content-Type': 'application/json'
    },
    body:JSON.stringify({"correo":correo})
    })

    if(c.ok){
        let data=await c.json();
        if (data['ok']){
            iniciarmodulo(data)
        }else{
            alert('Correo o codigo equivocado')
        }
    }
}

let panel=null;
let panel2=null;

function iniciarmodulo(data){
    let nombre=data['data'][0];
    let apellido=data['data'][1];
    let modroot=ReactDOM.createRoot(document.getElementById("modulo"));
    let d=e('div',{className:'moduloIn'},[
        e('h1',null,'Bienvenido '+nombre+' '+apellido),
        e('h2',{id:'time'},(new Date()).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})),
        e('div',{id:'pest'},[
            e('ul',null,[
                e('li',null,e('a',{onClick:calendario},'Calendario')),
                e('li',null,e('a',{onClick:seleccion},'Seleccion')),
                e('li',null,e('a',{onClick:asistencia},'Asistencia')),
                e('li',null,e('a',{onClick:liquidacion},'Liquidacion'))
            ]),
            e('div',{id:'ventana'},null)
        ]),
        e('div',{id:'panel'},null)
    ])
    modroot.render([d,e('div',{id:'panel2'})])
    setInterval(()=>{
        let it=document.getElementById('time');
        it.innerHTML=(new Date()).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})
    }, 1000*30);
}

function definepanel(){
    if (panel==null){
        panel=ReactDOM.createRoot(document.getElementById('panel'))
    }
    if (panel2==null){
        panel2=ReactDOM.createRoot(document.getElementById('panel2'))
    }
}



//---------------------------------------Calendario
async function calendario(){
    definepanel()
    let dat=await consulta("O.titulo, C.fechainicio, C.fechafin, C.conseccalendario", "calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen join obra O on C.idobra=O.idobra where C.idestado='Activo' and C.fechainicio<=sysdate and C.fechafin>=sysdate and T.DESCTIPOCALENDARIO='Planeacion'")

    let paneles=[]
    for(let i=0;i<dat['data'].length;i++){
        paneles.push(e('div',{className:"cuadro", id:"recuadro"+i},[
            e('h3',null,dat['data'][i][0]),
            e('h3',null,(new Date(dat['data'][i][1])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})+"---"+(new Date(dat['data'][i][2])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})),
            e('a',{className:"boton",onClick:()=>{
                actualizar("calendario","idestado","'Inactivo'","WHERE conseccalendario ="+dat['data'][i][3])
                document.getElementById("recuadro"+i).remove()
            }},'Terminar calendario')
        ]))
    }
    panel.render([
        e('div',null,paneles),
        e('a',{className:"boton"},'Crear calendario')
    ])
    panel2.render(e('div'))
}


//--------------------------------Seleccion
async function seleccion(){
    async function seleccionEv(obra){
        let res=await consulta("E.nombre, E.apellido, C.codestudiante, O.proyecto, O.facultad, T.nominstrumento, T.maxCal", "estudiante E, (select I.nominstrumento nominstrumento, max(C.calificacion) maxCal from convocatoriaestudiante C  join instrumento I ON I.idinstrumento=C.idinstrumento group by I.nominstrumento) T, convocatoriaestudiante C, instrumento I, (select U.codunidad c1, U.nomunidad proyecto, U1.nomunidad facultad  from unidad U, unidad U1  where U.uni_codunidad=U1.codunidad) O where T.maxCal=C.calificacion  and C.idinstrumento=I.idinstrumento  and T.nominstrumento=I.nominstrumento  and O.c1=E.codunidad and C.codestudiante=E.codestudiante");
        let tab=[]
        var fila=[]
        for (let i of ['Nombre','Apellido','Codigo','Proyecto','Facultad','Instrumento','Calificacion']){
            fila.push(e('th', {className:"ContenidoCelda"}, i))
        }
        tab.push(e('tr',{className:"ContenidoFila"},fila))

        for(let i of res['data']){
            let cale=await consulta("C.idtipocalen,C.idobra,C.conseccalendario","calendario C, tipocalendario T where fechainicio<=sysdate and fechafin>=sysdate and C.idtipocalen=T.idtipocalen and C.idestado='Activo' and T.DESCTIPOCALENDARIO='Seleccion'")
            
            for(let w of cale['data']){
                console.log("insert into participacionEstudiante values ((select coalesce(v,0)+1 from (select max(consecasis) v from participacionEstudiante)),"+i[2]+","+w[0]+","+w[1]+","+w[2]+")")
                agregar("participacionEstudiante", "((select coalesce(v,0)+1 from (select max(consecasis) v from participacionEstudiante)),'"+i[2]+"','"+w[0]+"','"+w[1]+"',"+w[2]+")")
            }
            var fila=[]
            for(let j of i){
                fila.push(e('td', {className:"ContenidoCelda"}, j))
            }
            tab.push(e('tr',{className:"ContenidoFila"},fila))
        }
        panel2.render(e('table',{className:"Tabla"},tab))

    }
    definepanel()
    let dat=await consulta("O.titulo, C.fechainicio, C.fechafin, C.conseccalendario","calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen join obra O on C.idobra=O.idobra where C.idestado='Activo' and C.fechainicio<=sysdate and C.fechafin>=sysdate and T.DESCTIPOCALENDARIO='Seleccion'");
    if (dat['data'].length!=0){
        paneles=[]
        for(let i=0;i<dat['data'].length;i++){
            paneles.push(e('div',{className:"cuadro", id:"recuadro"+i},[
                e('h3',null,dat['data'][i][0]),
                e('h3',null,(new Date(dat['data'][i][1])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})+"---"+(new Date(dat['data'][i][2])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})),
                e('a',{className:"boton",onClick:()=>{
                    seleccionEv(dat['data'][i][0]);
                    actualizar("calendario","idestado","'Inactivo'","WHERE conseccalendario ="+dat['data'][i][3])
                    document.getElementById("recuadro"+i).remove()
                }},'Seleccionar'),
            ]))
        }

        panel.render(paneles)
        panel2.render(e('div'))
    }
}

//-----------------------Asistencia

async function asistencia(){
    async function enviarAsistencia(codigos,vectorverdades,calendario){
        for(let i of calendario){
            for(let j=0; j<codigos.length;j++){
                if (vectorverdades[j]){
                    console.log("insert into participacionEstudiante values ((select coalesce(v,0)+1 from (select max(consecasis) v from participacionEstudiante)),'"+codigos[j]+"','"+i[0]+"','"+i[1]+"',"+i[2]+")")
                    agregar("participacionEstudiante","((select coalesce(v,0)+1 from (select max(consecasis) v from participacionEstudiante)),'"+codigos[j]+"','"+i[0]+"','"+i[1]+"',"+i[2]+")")
                }
                
            }
            
        }
    }
    definepanel()
    let dat=await consulta("C.IDTIPOCALEN,C.IDOBRA,C.conseccalendario","calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen where C.idestado='Activo' and C.fechainicio<=sysdate and C.fechafin>=sysdate and (T.DESCTIPOCALENDARIO='Ensayo' or T.DESCTIPOCALENDARIO='Funcion')");
    if (dat['data'].length!=0){
        let res=await consulta("E.nombre||' '||E.apellido, C.codestudiante","estudiante E, (select I.nominstrumento nominstrumento, max(C.calificacion) maxCal from convocatoriaestudiante C  join instrumento I ON I.idinstrumento=C.idinstrumento group by I.nominstrumento) T, convocatoriaestudiante C, instrumento I where T.maxCal=C.calificacion and C.idinstrumento=I.idinstrumento  and T.nominstrumento=I.nominstrumento and C.codestudiante=E.codestudiante");
        let tab=[]
        var fila=[]

        let codigos=[]

        for (let i of ['Nombre','Codigo','Asistencia']){
            fila.push(e('th', {className:"ContenidoCelda"}, i))
        }
        tab.push(e('tr',{className:"ContenidoFila"},fila))
        let longit=res['data'].length
        for(let i=0;i<longit;i++){
            var fila=[]
            codigos.push(res['data'][i][1])
            for(let j of res['data'][i]){
                fila.push(e('td', {className:"ContenidoCelda"}, j))
            }
            fila.push(e('input',{type:'checkbox', id:'asistencia'+i}))
            tab.push(e('tr',{className:"ContenidoFila"},fila))
        }
        panel.render([e('table',{className:"Tabla"},tab),e('a',{className:"boton",onClick:()=>{
            var vv=[]
            for(let k=0; k<longit;k++){
                vv.push(document.getElementById('asistencia'+k).checked)
            }
            console.log(codigos)
            console.log(vv)
            enviarAsistencia(codigos,vv,dat['data'])
        }},"Enviar")])
        panel2.render(e('div'))
    }
}

//-----------------------Liquidación.

async function liquidacion(){
    definepanel()
    let f1=await consulta("count(C.conseccalendario)","calendario C where C.idestado='Activado' and C.fechainicio<=sysdate and C.fechafin<=sysdate")
    let f2=await consulta("count(C.conseccalendario)","calendario C, tipocalendario T where C.idestado='Activo' and C.fechafin<=sysdate and C.idtipocalen=T.idtipocalen and (T.DESCTIPOCALENDARIO='Ensayo' or T.DESCTIPOCALENDARIO='Funcion')")
    if (f1['data'][0][0]==0 && f2['data'][0][0]==0){
        panel.render(e('div',{className:"cuadro"},[
            e('a',{className:"boton", onClick:()=>{
                window.open("/descargar_pdf")
            }},"Viaticos"),
            e('a',{className:"boton",onClick:()=>{
                window.open("/enviar_correo")
            }},"Electivas")]))
    
    }
    panel2.render()
}


/*
#######################################################################################################
#                                                                                                     #
#                           LOGIN                                                                     #
#                                                                                                     #
#######################################################################################################
*/

const logindiv=document.getElementById('logreg')

const loginroot=ReactDOM.createRoot(logindiv)

let login=e('div',{id:'login', className:'form centrado'},[
    e('h1',null,"Ingresar"),
    e('label',null,"correo"),
    e('input',{type:"email",maxLength:"40", className:"acceder correo",defaultValue:"sanf@gmail.com"},null),
    e('div',null,[
        e('a',{onClick:()=>{
            acceder()
            loginroot.render()
        }},'Aceptar')
    ])
])

loginroot.render(login);
