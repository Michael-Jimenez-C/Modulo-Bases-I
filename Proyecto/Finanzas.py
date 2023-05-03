from tkinter import *
from tkinter import ttk
from turtle import width
from command.Comandos import *

class GUI:
    def __init__(self, master):
        self.master=master
        self.bg="#ADADAD"
        self.master.geometry("900x500")
        self.master.title("")
        self.master.resizable(False,False)
        self.master.config(bg=self.bg)
        self.__widgets()
    def __widgets(self):
        #---------------------menubar----------------------------
        menu=Menu(self.master)
        menudesplegable=Menu(self.master)
        menudesplegable.add_command(label="Exportar", command=lambda :self.__exportar())
        menudesplegable.add_command(label="Verificar Integridad", command=lambda :self.__verificar())
        menudesplegable.add_command(label="Subir", command=lambda :self.__subir())
        menu.add_cascade(label="Archivo",menu=menudesplegable)
        self.master.config(menu=menu)
        #--------------------parametros de seleccion-------------
        Label(self.master,text="Desde",bg=self.bg,fg="#FFF").place(x=40,y=100)
        self.fecha1=Entry(self.master,width=10)
        self.fecha1.place(x=40,y=120)

        Label(self.master,text="Hasta",bg=self.bg,fg="#FFF").place(x=140,y=100)
        self.fecha2=Entry(self.master,width=10)
        self.fecha2.place(x=140,y=120)

        Label(self.master,text="consulta",bg=self.bg,fg="#FFF").place(x=40,y=160)
        self.consult=ttk.Combobox(self.master,values=["estudiante"],state="readonly")
        self.consult.current(newindex=0)
        self.consult.place(x=40,y=180,width=170)

        Button(self.master,text="Actualizar",command=lambda: self.__actualizar()).place(x=40,y=240,width=170)
        Button(self.master,text="Aceptar",command=lambda: self.__aceptar()).place(x=40,y=280,width=170)
        #--------------------tabla-------------------------------
        tcontainer=Frame(self.master)
        tcontainer.place(x=250,y=40,width=600,height=400)
        self.tabla=ttk.Treeview(tcontainer)
        self.tabla.pack(side="top",fill="both",expand=True)
        scv=ttk.Scrollbar(self.master)
        scv.place(x=850,y=40,height=400)
        sch=ttk.Scrollbar(tcontainer,orient="horizontal")
        sch.pack(side="bottom",fill="x")
        self.tabla.config(yscrollcommand=scv.set,xscrollcommand=sch.set)
        scv.config(command=self.tabla.yview)
        sch.config(command=self.tabla.xview)

    def __exportar(self):
        file=open("./tabla.csv","w")
        
        for i in self.tabla.get_children(item=""):
            s=""
            for j in i:
                s+=j+";"
            file.write(s+"\n")
        file.close()
    def __verificar(self):
        pass
    def __subir(self):
        pass
    def __actualizar(self):
        pass
    def __aceptar(self):
        for i in self.tabla.get_children(item=""):
            self.tabla.delete(i)

        cons=GenericCMD()
               
        if(self.consult.get()=="estudiante"):
            headers='CODIGO,NOMBRE,APELLIDO,FECHAINGRESO'
            s=cons.execute(params={"comando":"SELECT * FROM estudiante","commit":True})

        headers=headers.split(",")
        self.tabla.config(columns=headers[1:])

        self.tabla.heading("#0",text=headers[0],anchor=CENTER)
        self.tabla.column("#0",width=80,anchor=CENTER)
        for i in headers[1:]:
            self.tabla.heading(i,text=i,anchor=CENTER)
            self.tabla.column(i,width=80,anchor=CENTER)
        for i in range(len(s)):
            self.tabla.insert("",END,text=s[i][0],values=s[i][1:])

root=Tk()
gui=GUI(root)
root.mainloop()