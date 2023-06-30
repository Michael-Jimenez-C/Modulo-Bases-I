from command.Conexion import Conexion

class GenericCMD:
    def execute(params:dict):
        '''
            params debe tener
                Comando
            ejemplo:
            params={
                "comando":"SELECT * FROM estudiantes",
                "commit": False
            }
        '''
        assert type(params)==dict, 'El tipo de dato de params no es un diccionario'
        
        conexion=Conexion.getConexion()
        cur=conexion.cursor()
        cur.execute(params["comando"])

        if 'commit' in params:
            if params['commit']:
                conexion.commit()
        try:
            return cur.fetchall()
        except:
            try:
                return cur
            except:
                return ""
    def cerrar():
        Conexion.close()