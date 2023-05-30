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

const e = React.createElement;

async function combobox(tabla,iD,selector="*"){
    let tcalv=await consulta("select "+selector+" from "+tabla);
    let options=[]
    for(let i of tcalv["data"]){
        options.push(e("option", { value: ""+i[0] }, ""+i[1]))
    }

    let tcal=e('select',{id:iD},options)
    return tcal;
}


async function init(){
    const root=ReactDOM.createRoot(document.getElementById('root'));

    let cal2=e('input',{id:'fin',type:'date'},null);
    let tim2=e('input',{id:'finT',type:'Time'},null);
    let cal1=e('input',{id:'inicio',type:'date'},null);
    let tim1=e('input',{id:'inicioT',type:'Time'},null);

    let tcal=await combobox("tipocalendario","tipocalen");
    
    let obra=await combobox("obra","obr","idobra, titulo");

    let est=await combobox("estado","est","idestado,idestado");

    formulario=e('div',{className:'form centrado'},[
        e('label',null,'Fecha de inicio'),
        cal1,
        tim1,
        e('label',null,'Fecha de finalizacion'),
        cal2,
        tim2,
        e('label',null,'Tipo de calendario'),
        tcal,
        e('label',null,'Obra'),
        obra,
        e('label',null,'Estado'),
        est,
        e('a',{className:'boton',onClick:()=>{
            let fi=document.getElementById('inicio').value+' '+document.getElementById('inicioT').value
            let fe=document.getElementById('fin').value+' '+document.getElementById('finT').value
            if ((new Date(fi))<(new Date(fe))){
                let tc=document.getElementById('tipocalen').value
                let ob=document.getElementById('obr').value
                let est=document.getElementById('est').value
                let comando="insert into calendario values ('"+tc+"','"+ob+"',(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'"+est+"', timestamp '"+fi+":00', timestamp '"+fe+":00')"
                console.log(comando)
                consulta(comando,false)
            }else{
                alert('a ocurrido un error, la fecha final está antes que la fecha inicial')
            }
        }},'Aceptar')
    ])


    root.render([e('h1',null,'Ingresar fecha y horas para las pruebas'), formulario])
}

init()