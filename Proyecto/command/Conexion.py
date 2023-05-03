import getpass
import oracledb
oracledb.init_oracle_client(config_dir='/opt/myconfigdir')
import json
class Conexion:
    __conexion=None
    def getConexion():
        if Conexion.__conexion==None:
            Conexion.__conexion= oracledb.connect(
                                        user="BD12023",
                                        password='BD12023',
                                        dsn='localhost')
        return Conexion.__conexion
        
    def close():
        if Conexion.__conexion!=None:
            Conexion.__conexion.close()
            Conexion.__conexion=None