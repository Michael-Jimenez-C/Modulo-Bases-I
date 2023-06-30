import {actualizar,agregar,consulta} from './consultas.js'

const e = React.createElement;

async function combobox(tabla,iD,selector="*"){
    let tcalv=await consulta(selector,tabla);
    console.log(tcalv)
    let options=[]
    for(let i of tcalv["data"]){
        options.push(e("option", { value: ""+i[0] }, ""+i[1]))
    }

    let tcal=e('select',{id:iD},options)
    return tcal;
}


async function init(){
    const root=ReactDOM.createRoot(document.getElementById('root'));

    let tcal=await combobox("tipocalendario","tipocalen");
    
    let obra=await combobox("obra","obr","idobra, titulo");

    let est=await combobox("estado","est","idestado,idestado");

    let formulario1=e('div',{className:'form centrado'},[
        e('label',null,'Fecha de inicio'),
        e('input',{id:'inicio',type:'date'},null),
        e('input',{id:'inicioT',type:'Time'},null),
        e('label',null,'Fecha de finalizacion'),
        e('input',{id:'fin',type:'date'},null),
        e('input',{id:'finT',type:'Time'},null),
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
                agregar("calendario","('"+tc+"','"+ob+"',(select coalesce(v,0)+1 from (select max(conseccalendario) v from calendario)),'"+est+"', timestamp '"+fi+":00', timestamp '"+fe+":00')")
            }else{
                alert('a ocurrido un error, la fecha final está antes que la fecha inicial')
            }
        }},'Aceptar')
    ])
    root.render([e('h1',null,'Ingresar fecha y horas para las pruebas'), formulario1])
}

init()