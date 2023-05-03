from __future__ import annotations
from abc import ABC, abstractmethod
from command.Conexion import Conexion

class CMD(ABC):
    @abstractmethod
    def execute(self,params:dict)->None:
        pass        

class GenericCMD(CMD):
    def execute(self,params:dict):
        '''
            params debe tener
                Comando
            ejemplo:
            params={
                "comando":"SELECT * FROM estudiantes",
                "commit": False
            }
        '''
        conexion=Conexion.getConexion()
        cur=conexion.cursor()
        cur.execute(params["comando"])
        if params["commit"]:
            conexion.commit()
        try:
            return cur.fetchall()
        except:
            try:
                return cur
            except:
                return None

class Consulta(CMD):
    def execute(self,params:dict):
        '''
            params debe tener
                tabla
                tupla de nombres a obtener de la tabla o * para toda la tabla
            ejemplo:
            params={
                "tabla":"estudiantes",
                "columnas":("Nombre","Apellido")
            }
        '''
        conexion=Conexion.getConexion()
        cur=conexion.cursor()
        try:
            cur.execute("SELECT "+str(params["columnas"]).replace("(","").replace(")","").replace("'","")+" FROM "+params["tabla"])
            return cur.fetchall()
        except:
            return None

class Insertar(CMD):
    def execute(self,params:dict):
        '''
            params debe tener
                tabla
                tupla de nombres a obtener de la tabla o * para toda la tabla
            ejemplo:
            params={
                "tabla":"estudiantes",
                "columnas":("Nombre","Apellido")
                "valores": ("","")
            }
        '''
        conexion=Conexion.getConexion()
        cur=conexion.cursor()
        try:
            cur.execute("INSERT INTO "+params["tabla"]+" "+str(params["columnas"]).replace("'","")+" VALUES "+str(params["valores"])+";")
            conexion.commit()
            return True
        except:
            return False

class Borrar(CMD):
    def execute(self,params:dict):
        '''
            params debe tener
                tabla
                condicion
            ejemplo:
            params={
                "tabla":"estudiantes",
                "condicion": "edad>18"
            }
        '''
        conexion=Conexion.getConexion()
        cur=conexion.cursor()
        try:
            cur.execute("DELETE FROM "+params["tabla"]+" WHERE "+params["condicion"]+";")
            conexion.commit()
            return True
        except:
            return False

class Actualizar(CMD):
    def execute(self,params:dict):
        '''
            params debe tener
                tabla
                act /actualizacion
            ejemplo:
            params={
                "tabla":"estudiantes",
                "act":"edad=edad+1"
            }
        '''
        conexion=Conexion.getConexion()
        cur=conexion.cursor()
        try:
            cur.execute("UPDATE "+params["tabla"]+" SET "+params["act"]+";")
            conexion.commit()
            return True
        except:
            return False