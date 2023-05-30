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
                e('li',null,e('a',null,'Seleccion')),
                e('li',null,e('a',null,'Asistencia')),
                e('li',null,e('a',null,'Liquidacion'))
            ]),
            e('div',{id:'ventana'},null)
        ]),
        e('div',{id:'panel'},null)
    ])
    modroot.render(d)
    setInterval(()=>{
        let it=document.getElementById('time');
        it.innerHTML=(new Date()).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})
    }, 1000*30);
}

function definepanel(){
    if (panel==null){
        panel=ReactDOM.createRoot(document.getElementById('panel'))
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
}

async function seleccion(){
    definepanel()
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
