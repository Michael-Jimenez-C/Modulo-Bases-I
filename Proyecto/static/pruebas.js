async function consulta(consulta){
    let c=await fetch(`http://localhost:5000/cons`,{
        method:"POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body:JSON.stringify({"comando":consulta})
        });
    if(c.ok){
        let data=await c.json();
        return data;
    }
}

const e = React.createElement;

const root=ReactDOM.createRoot(document.getElementById('root'))

let cal2=e('label',null,'Fecha de finalizacion')
let tim2=e('input',{id:'fin',type:'date'},null)
let cal1=e('input',{id:'inicio',type:'date'},null)
let tim1=e('input',{id:'inicioT',type:'Time'},null)

formulario=e('div',{className:'form'},[
    e('label',null,'Fecha de inicio'),
    cal1,
    tim1,
    cal2,
    tim2,
    e('input',{id:'finT',type:'Time'}),
    e('a',{className:'boton',onClick:()=>{
        let fi=document.getElementById('inicio').value+' '+document.getElementById('inicioT').value
        let fe=document.getElementById('fin').value+' '+document.getElementById('finT').value
        console.log(fi)
        console.log(fe)
        if ((new Date(fi))<(new Date(fe))){

        }else{
            alert('a ocurrido un error, la fecha final está antes que la fecha inicial')
        }
    }},'Aceptar')
])


root.render([e('h1',null,'Ingresar fecha y horas para las pruebas'), formulario])