const e = React.createElement;

async function consulta(consulta,returns=true){
    let c=await fetch(`http://localhost:5000/cons`,{
        method:"POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body:JSON.stringify({"comando":consulta})
        });
    if (!returns){
        return ""
    }
    if(c.ok){
        let data=await c.json();
        return data;
        
    }
}

//Funciones de la interfaz
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

async function calendario(){
    definepanel()
    let dat=await consulta("select O.titulo, C.fechainicio, C.fechafin, C.conseccalendario from calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen join obra O on C.idobra=O.idobra where C.idestado='Activo' and C.fechainicio<=sysdate and C.fechafin>=sysdate and T.DESCTIPOCALENDARIO='Planeacion'")

    paneles=[]
    for(let i=0;i<dat['data'].length;i++){
        paneles.push(e('div',{className:"cuadro", id:"recuadro"+i},[
            e('h3',null,dat['data'][i][0]),
            e('h3',null,(new Date(dat['data'][i][1])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})+"---"+(new Date(dat['data'][i][2])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})),
            e('a',{className:"boton",onClick:()=>{
                consulta("update calendario set idestado = 'Inactivo' WHERE conseccalendario ="+dat['data'][i][3]),
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

async function seleccion(){
    async function seleccionEv(obra){
        let res=await consulta("select E.nombre, E.apellido, C.codestudiante, O.proyecto, O.facultad, T.nominstrumento, T.maxCal from  estudiante E, (select I.nominstrumento nominstrumento, max(C.calificacion) maxCal from convocatoriaestudiante C  join instrumento I ON I.idinstrumento=C.idinstrumento group by I.nominstrumento) T, convocatoriaestudiante C, instrumento I, (select U.codunidad c1, U.nomunidad proyecto, U1.nomunidad facultad  from unidad U, unidad U1  where U.uni_codunidad=U1.codunidad) O where T.maxCal=C.calificacion  and C.idinstrumento=I.idinstrumento  and T.nominstrumento=I.nominstrumento  and O.c1=E.codunidad and C.codestudiante=E.codestudiante");
        let tab=[]
        var fila=[]
        for (let i of ['Nombre','Apellido','Codigo','Proyecto','Facultad','Instrumento','Calificacion']){
            fila.push(e('th', {className:"ContenidoCelda"}, i))
        }
        tab.push(e('tr',{className:"ContenidoFila"},fila))

        for(let i of res['data']){
            //consulta('insert into participacionEstudiante values ((select coalesce(v,0)+1 from (select max(consecasis) v from participacionEstudiante)),'+i[2]+',select codestudiante,idtipocalen,idobra,conseccalendario from calendario where fechainicio<=sysdate and fechafin>=sysdate)')
            var fila=[]
            for(let j of i){
                fila.push(e('td', {className:"ContenidoCelda"}, j))
            }
            tab.push(e('tr',{className:"ContenidoFila"},fila))
        }
        panel2.render(e('table',{className:"Tabla"},tab))

    }
    definepanel()
    let dat=await consulta("select O.titulo, C.fechainicio, C.fechafin, C.conseccalendario from calendario C join tipocalendario T on C.idtipocalen=T.idtipocalen join obra O on C.idobra=O.idobra where C.idestado='Inactivo' and C.fechainicio<=sysdate and C.fechafin>=sysdate");
    if (dat['data'].length!=0){
        paneles=[]
        for(let i=0;i<dat['data'].length;i++){
            paneles.push(e('div',{className:"cuadro", id:"recuadro"+i},[
                e('h3',null,dat['data'][i][0]),
                e('h3',null,(new Date(dat['data'][i][1])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})+"---"+(new Date(dat['data'][i][2])).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})),
                e('a',{className:"boton",onClick:()=>{
                    seleccionEv(dat['data'][i][0]);
                }},'Seleccionar'),
            ]))
        }

        panel.render(paneles)
        panel2.render(e('div'))
    }
}

async function asistencia(){
    definepanel()
}

async function liquidacion(){
    definepanel()
}


//React

const logindiv=document.getElementById('logreg')

const loginroot=ReactDOM.createRoot(logindiv)

login=e('div',{id:'login', className:'form centrado'},[
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
