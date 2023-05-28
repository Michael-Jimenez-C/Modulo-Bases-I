const e = React.createElement;

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






function iniciarmodulo(data){
    let nombre=data['data'][0];
    let apellido=data['data'][1];
    let modroot=ReactDOM.createRoot(document.getElementById("modulo"));
    let d=e('div',{className:'moduloIn'},[
        e('h1',null,'Bienvenido '+nombre+' '+apellido),
        e('h2',{id:'time'},(new Date()).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})),
        e('div',{id:'pest'},[
            e('ul',null,[
                e('li',null,e('a',null,'Calendario')),
                e('li',null,e('a',null,'Seleccion')),
                e('li',null,e('a',null,'Asistencia')),
                e('li',null,e('a',null,'Liquidacion'))
            ]),
            e('div',{id:'ventana'},null)
        ])
    ])
    modroot.render(d)
    setInterval(()=>{
        let it=document.getElementById('time');
        it.innerHTML=(new Date()).toLocaleString('es-co',{daysStyle:'short',dateStyle:'long',timeStyle: 'short'})
    }, 1000*30);
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
