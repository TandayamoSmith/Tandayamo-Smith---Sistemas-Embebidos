/*         Universidad Tecnica del Norte
     Facultad de Ingenieria en Ciencias Aplicadas 
     Carrera de Ingenieria en Telecomunicaciones 
                Sistemas Embebidos

Integrantes: Almeida Katherine
             Tandayamo Smith
             Torres Erika
             
Curso: 5to Citel 
Fecha: 26/01/2022

                Laboratorio 04*/
import processing.serial.*;
import ddf.minim.*;

int matriz[][][] =
{
  //lvl1
  {
{1,0,1,0,0,0,1,1,1,1},
{1,0,0,0,1,0,0,0,0,1},
{0,0,1,1,1,1,1,1,0,0},
{1,0,1,0,1,0,1,1,1,0},
{1,0,0,0,0,0,0,0,1,0},
{1,1,1,1,0,0,1,1,0,0},
  },
 //lvl2
 {
{1,1,1,0,0,0,1,1,0,0},
{0,0,0,0,1,0,0,0,0,0},
{0,1,1,0,0,2,1,0,2,1},
{0,1,0,1,1,0,1,0,0,1},
{0,0,0,0,1,1,0,2,0,1},
{1,1,1,0,0,0,0,1,0,0},
 },
//lvl 3
{
{1,0,1,0,0,0,0,1,1,1},
{1,0,0,0,1,2,0,0,0,0},
{0,0,1,0,1,0,1,2,2,0},
{1,0,2,1,0,0,1,2,0,0},
{0,0,0,2,1,0,2,1,0,2},
{1,2,0,0,0,0,0,1,0,0},
},
//lvl4
{
{1,0,1,0,0,0,1,1,0,0},
{1,0,0,0,1,0,0,0,0,0},
{0,0,1,0,1,0,1,1,0,1},
{1,0,1,0,0,0,1,1,1,1},
{0,0,0,0,0,0,0,0,0,1},
{0,0,1,1,0,0,1,1,0,0},
},
};
Serial port;
PFont fuente;

//Corbel-Bold-48.vlw
int levels=0;
int x,y;
int y1=2;
int x1=0;
int y2=2;
int x2=0;
int fil=0;
int col=0;
PImage img; 
PImage fondo;
PImage bandera;
PImage enemigo;
PImage fondo2;
PImage utn;
PImage portada;
PImage mando;

int px,py;
int estado=0;
String dato;
int posx;
int posy;
float enemigox=700.0;
float enemigoy=200.0;
float vel=3.0;

int fil1=0,col1=0;
 
 void setup(){
 size(1000,600);
 port= new Serial(this, "COM1",9600);
 fuente=loadFont("Corbel-Bold-48.vlw");
 textFont(fuente);
 
 
 }
 void draw(){

 switch(estado){
 
 case 0:
 
  portada=loadImage("cielo.png");
image(portada,0,0);
 //background(#7CF5EC);
 textSize(70);
 fill(#248eff);
 text("ASTEROID ADVENTURE",160,250);
 textSize(50);
 text("PRESIONA X PARA INICIAR",200,560);


fondo2=loadImage("logo-citel-1-1024x427.png");
image(fondo2,720,25);

utn=loadImage("descarga_ccexpress.png");
image(utn,5,5);

mando=loadImage("mando.png");
image(mando,350,250);


 
 
 estado++;
 
 break;
 
 case 1:
 if(key==' '){
 img=loadImage("ast3_ccexpress.png");
 fondo=loadImage("nebula.png");
 bandera=loadImage("agujero.png");
 enemigo=loadImage("marcianonave_ccexpress.png");
 background(fondo);
 
 //image(bandera,900,500,100,100);
 fill(255);
 //fill(0);
 //rect(0,0,900,600);
for(;fil<6;fil++){
    y=fil*100;
    for(col=0;col<10;col++){
      x=col*100;
      if(matriz[levels][fil][col]==1){
       imageMode(CENTER);
       image(img,x+50,y+50,100,100); // ubicar la imagen en la interfaz
      }
    }
  }
 image(bandera,950,550,100,100);
 estado++;

 }
 break;
 case 2:
 if(levels==3){
 background(fondo);
 fill(255);
 textSize(40);
 text("FELICIDADES GANASTE",300,275);
 text("PRESIONA X PARA VOLVER A JUGAR",200,325);
 
 if(key=='x'){
   
 estado=0;
 levels=0;
 //
 x2=0;
 y2=2;
 fil=0;
 col=0;
 x1=0;
 y1=2;
 col1=0;
 fil1=0;
 }
 }
 break;
 }

 move();//LLAMO A LA FUNCION QUE LE DA MOVIMIENTO AL OBJETO
 
 
 
 if(estado==2 && levels==3){
 fill(0);
 stroke(0);
 ellipse(50,250,56,56);
 
 
 }
 
 }  

 void move(){ 
   
 posx=50+(x2*100);
 posy=50+(y2*100);
  fill(#00ff0d);
  stroke(#00ff0d);
  ellipse(posx,posy,50,50);
 
  

   
  while (port.available() > 0) {
  
  dato=port.readString();

  
  fill(0);
  stroke(0);
  ellipse(posx,posy,56,56);
 switch(dato){
   case "A":
    if(x1>0){
       x1--;
       if(matriz[levels][y1][x1]!=1){
        x2--;
       }
       else
       x1=x2;
    }
    //println(str(x2)+str(y2));
   println(str(posx)+" "+str(posy));
   break;
   case "B":
        if(x1<9){
         x1++;
         if(matriz[levels][y1][x1]!=1){
          x2++;
        }
        else
        x1=x2;
    }
      //println(str(x2)+str(y2));
   println(str(posx)+" "+str(posy));
   break;
      case "C":
        if(y1>0){
         y1--;
         if(matriz[levels][y1][x1]!=1){
          y2--;
        }
        else
        y1=y2; 
    }
     // println(str(x2)+str(y2));
      println(str(posx)+" "+str(posy));
   break;
       case "D":
        if(y1<5){
         y1++;
         if(matriz[levels][y1][x1]!=1){
          y2++;
        }
        else
        y1=y2;
    }
      println(str(posx)+" "+str(posy));
   break;
 }

if(matriz[levels][y1][x1]==2){
y1=2;
x2=0;
y2=2;
x1=0;
//levels=0;
}

 impresionNiveles();
 }

  }
  
  
  void impresionNiveles(){
   if(posx==850 && posy==550 || posx==950 && posy==450){
    // enemigox=650;
     //enemigoy=150;
     levels++; 
     println(str(levels));
     background(fondo);
     
     fill(255);
       x2=0;
       y2=2;
       fil=0;
       col=0;
       x1=0;
       y1=2;
       fil1=0;
       col1=0;

    for(;fil<6;fil++){
    y=fil*100;
     for(col=0;col<10;col++){
      x=col*100;
      if(matriz[levels][fil][col]==1){
       imageMode(CENTER);
       image(img,x+50,y+50,100,100); // ubicar la imagen en la interfaz
        
      }
    }
  }
  //imagen del enemigo
   for(;fil1<6;fil1++){
    y=fil1*100;
     for(col1=0;col1<10;col1++){
      x=col1*100;
      if(matriz[levels][fil1][col1]==2){
       imageMode(CENTER);
       image(enemigo,x+50,y+50,100,100); // ubicar la imagen en la interfaz
        
      }
    }
  }
  image(bandera,950,550,100,100);
 
  }
  }
