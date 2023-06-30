export async function consulta(columnas, opciones){
    let c=await fetch(`http://localhost:5000/ObtenerRegistro`,{
        method:"POST",
        headers: {
            'Content-Type': 'application/json'
        },
        body:JSON.stringify({
            'columnas':columnas,
            'opciones':opciones
        })});
    if(c.ok){
        let data=await c.json();
        return data;
    }
}

export function agregar(tabla, valores){
    fetch(`http://localhost:5000/AgregarRegistro`,{
        method:"POST",
        headers:{
            'content-Type': 'application/json'
        },
        body:JSON.stringify({
            'tabla':tabla,
            'valores':valores
        })
    })
}

export function actualizar(tabla,columna,valor,opciones){
    fetch(`http://localhost:5000/ActualizarRegistro`,{
        method:"POST",
        headers:{
            'content-Type': 'application/json'
        },
        body:JSON.stringify({
            'tabla':tabla,
            'columna':columna,
            'valor':valor,
            'opciones':opciones
        })
    })
}