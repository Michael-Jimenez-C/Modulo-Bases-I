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