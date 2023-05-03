import numpy as np

nombres =['juan','alberto','diego','pedro','Miguel']
apellidos=['rodriguez','zapata','rojas','pinilla','jimenez','santos']


nombr=[]
for i in nombres:
    for j in nombres:
        for k in apellidos:
            for w in apellidos:
                nombr.append(f"insert into estudiante values('{np.random.randint(5000,20000)}', '{i} {j}','{k} {w}','01/01/2021');")

print(len(nombr))