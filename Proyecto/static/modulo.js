async function acceder(){
    let correo=document.getElementsByClassName('acceder correo')[0].value;
    let codigo=document.getElementsByClassName('acceder codigo')[0].value;
    
    let c=await fetch(`http://localhost:5000/verificarUsuario`,{
    method:"POST",
    headers: {
        'Content-Type': 'application/json'
    },
    body:JSON.stringify({"correo":correo, "codigo":codigo})
    })

    if(c.ok){
        let data=await c.json();
        if (data['ok']){
            //window.location.href='in';
            document.getElementById('logreg').style.display='none';
            iniciarmodulo(data)
        }else{
            alert('Correo o codigo equivocado','Adv')
        }
    }
}


let estado=1;
function swtch(){
    if (estado==1){
        document.getElementById('login').style.display='none';
        document.getElementById('registro').style.display='';
        estado=0
    }else{
        document.getElementById('registro').style.display='none';
        document.getElementById('login').style.display='';
        estado=1
    }   
}


function iniciarmodulo(data){
    let d=document.getElementsByClassName('moduloIn')[0];
    let k=document.getElementById('modulo');
    k.style.display='';
    let nombre=data['data'][0];
    let apellido=data['data'][1];
    d.innerHTML='<h1>Bienvenido '+ nombre+' '+apellido+'</h1>';
    setInterval(actualizartiempo, 1000);
}

function actualizartiempo(){
    it=document.getElementById('time');
    it.innerHTML=(new Date()).toLocaleString();
}