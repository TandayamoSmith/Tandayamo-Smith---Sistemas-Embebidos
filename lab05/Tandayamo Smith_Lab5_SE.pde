/*
                Universidad Tecnica Del Norte
        Facultad de Ingenieria en Ciencias Aplicadas
              Ingenieria en Ciencias Aplicadas

                       Laboratorio 05
                     
Integrantes:Almeida Katherine
            Tandayamo Smith
            Torres Erika


Curso: 04/02/2022

*/

float datoX_max=0;
float datoY_max=0;
float datoX_min=1000;
float datoY_min=1000;
float ejeX_min;
float ejeY_min;
float ejeX_max;
float ejeY_max;
float absX;
float absY;
int ancho1 = 1000;     //ventana celeste
int alto1 = 1000;
int anchoFig = 0;          //Ancho del gráfico
int altoFig = 0;        //Altura del gráfico
int figX = 88;            //Coordenada X de el cuadro principal de la gráfica
int figY = 220;            //Coordenada Y de el cuadro principal de la gráfica
int j=0;
int fil_m = 120;
int col_m = 5;      //Filas y columnas de la BDD
int divV = 8;
int divH = 7;         //Divisiones horizontales y verticales
int [] x = new int[fil_m];
int [] y = new int[fil_m];
PImage fondo2;
PImage utn;


void setup() {

  size (1700, 700);
  background(52, 152, 219);//fondo celeste
  fill(0);
  textAlign(CENTER);
  textSize(50);
  //text("APRENDIZAJE DE MÁQUINA",width/2, 50);
  textAlign(LEFT);
  text("REGRESIÓN LINEAL",680,150);
  text("LABORATORIO 05",700, 100);
  text("SISTEMAS EMBEBIDOS",635, 50);
  textSize(25);
  text("Almeida Katherine",20, 620);
  text("Tandayamo Smith",20, 650);
  text("Torres Erika",20, 680);
  anchoFig = width-175;
  altoFig = height-350;
  
  fondo2=loadImage("logo-citel-1-1024x427.png");
  image(fondo2,1400,50);

 utn=loadImage("descarga_ccexpress.png");
  image(utn,0,0);
}

void draw(){
  fill(192, 192, 192);//color de fondo para cuadricula
  rect(figX, figY, anchoFig, altoFig);
  
  //Hallar máximos y mínimos de la BDD
  for (int i=0;i<fil_m;i++){
    if(matriz[i][0]>datoX_max) datoX_max = matriz[i][0];
    if(matriz[i][0]<datoX_min) datoX_min = matriz[i][0];
    if(matriz[i][1]>datoY_max) datoY_max = matriz[i][1];
    if(matriz[i][1]<datoY_min) datoY_min = matriz[i][1];
  }

  //Definir los ejes máximos de representación
  ejeX_max = datoX_max*1.25;
  ejeY_max = datoY_max*1.25;
  ejeX_min = datoX_min/1.25;
  ejeY_min = datoY_min/1.25;
  

  for (j=0; j<divV+1; j++) {
    stroke(2);
    
    //Lineas horizontales
    line(figX, figY+(j*altoFig/divV), width-figX, figY+(j*altoFig/divV));
    //Lineas verticales
    line(figX+(j*anchoFig/divH), figY, figX+(j*anchoFig/divH), altoFig+figY);
    //Valores en los ejes
    fill(1);
    //Eje ordenadas
    textSize(15);
    absY = (ejeY_max - ejeY_min)/divV;
    text((ejeY_max-(j*absY)), 20, figY+(j*altoFig/divV));
  }
  
  for(int g=0;g<divH+1;g++){
    
    //Eje abscisas
    textSize(15);
    absX = (ejeX_max - ejeX_min)/divH;
    text(ejeX_min+(g*absX), figX-10+(g*anchoFig/divH), altoFig+figY+20);
  }
  //Graficar base de datos
  for (j=0; j<fil_m; j++) {
    fill(#FA8072);
    x[j]=int(map(matriz[j][0],ejeX_min,ejeX_max,figX,width-figX));
    y[j]=int(map(matriz[j][1],ejeY_min,ejeY_max,figY+altoFig,figY));
    
    ellipse(x[j],y[j],14,14);
  }
  regresion(fil_m);
}

void regresion(int filas){
int col=0; // variable que se mueve en filas
int fil=0; // variable que se mueve en columnas
float Ex=0; // sumatoria de X
float Ey=0; // sumatoria de Y
float Exy=0; // sumatoria de xy
float Ex2=0; // sumatoria de x^2
float Ex_2=0; // sumatoria de (Ex)^2
long n=filas; // tamaño de datos
float Bo; // ordenada en el origen
float m; // pendiente
float m1; // auxiliar
String dato; // recibe datos por cx serial
float [] nuevaInstancia={28.0,55.0,28.0,18.0,2}; // conversión de datos
//4.8,3.4,1.6,0.2,1      Base Antigua
//19.0,60.0,8.0,38,2     Base 1
//28.0,55.0,28.0,18.0,2  Base 2
float respuesta; // responder 

//creación del modelo
 for(;fil<n;fil++){
    Ex=Ex+matriz[fil][0];
    Ey=Ey+matriz[fil][1];
    Exy=Exy+(matriz[fil][0]*matriz[fil][1]);
    Ex2=Ex2+pow(matriz[fil][0],2);     
  }
  Ex_2=pow(Ex,2);
 
  Bo=((Ex2*Ey)-(Ex*Exy))/(n*Ex2-Ex_2);

  m1=(n*Exy)-(Ex*Ey);
  m=(m1)/(n*Ex2-Ex_2);
  respuesta=Bo+m*nuevaInstancia[0]; // genera el pronóstico
  //println(respuesta);
  fill(#00FF00);
  int xi=int(map(nuevaInstancia[0],ejeX_min,ejeX_max,figX,width-figX));
  int yi=int(map(respuesta,ejeY_min,ejeY_max,figY+altoFig,figY));
  
  ellipse(xi,yi,20,20);
  //Grafica de la linea
  int Lx=int(map(ejeX_min,ejeX_min,ejeX_max,figX,width-figX));
  int Ly=int(map(Bo+m*ejeX_min,ejeY_min,ejeY_max,figY+altoFig,figY));
  int Lx_F=int(map(ejeX_max,ejeX_min,ejeX_max,figX,width-figX));
  int Ly_F=int(map(Bo+m*ejeX_max,ejeY_min,ejeY_max,figY+altoFig,figY));
  strokeWeight(2);
  stroke(#00FF00);
  line(Lx,Ly,Lx_F,Ly_F);
}
