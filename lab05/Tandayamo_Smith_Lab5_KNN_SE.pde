/*
                Universidad Tecnica Del Norte
        Facultad de Ingenieria en Ciencias Aplicadas
              Ingenieria en Ciencias Aplicadas

                       Laboratorio 05
                     
Integrantes:Almeida Katherine
            Tandayamo Smith
            Torres Erika


Fecha: 04/02/2022

*/
// PRIMERA GRAFICA 
int ancho1 = 1000;
int alto1 = 1000;
int anchoFig = 0;          //Ancho del gráfico
int altoFig = 0;        //Altura del gráfico
int figX = 200;            //Coordenada X de el cuadro principal de la gráfica
int figY = 50;            //Coordenada Y de el cuadro principal de la gráfica
int j=0;
int fil_m = 120, col_m = 5;      //Filas y columnas de la BDD
int divV = 6, divH = 6; //Divisiones horizontales y verticales
float datoX_max=0, datoY_max=0;
float datoX_min=1000, datoY_min=1000;
float ejeX_min, ejeY_min;
float ejeX_max, ejeY_max;
float absX, absY;
int [] x = new int[fil_m];
int [] y = new int[fil_m];
color label1 = color(107,4,253);
color label2 = color(253,106,4);
color label3 = color(4,254,18);
float [] instancia ={6.2,2.8,4.8,1.8,}; // datos de nueva instancia {46.0,86.0,49.0,10,3},

//SEGUNDA GRAFICA 

int ancho2 = 1500;
int alto2 = 1500;
int anchoFig2 = 0;          //Ancho del gráfico
int altoFig2 = 0;        //Altura del gráfico
int figX2 =200;            //Coordenada X de el cuadro principal de la gráfica
int figY2 =300;            //Coordenada Y de el cuadro principal de la gráfica
int j2=0;
int fil_m2 = 120, col_m2 = 5;      //Filas y columnas de la BDD
int divV2 = 6, divH2= 6; //Divisiones horizontales y verticales
float datoX_max2=0, datoY_max2=0;
float datoX_min2=1000, datoY_min2=1000;
float ejeX_min2, ejeY_min2;
float ejeX_max2, ejeY_max2;
float absX2, absY2;
int [] x2 = new int[fil_m2];
int [] y2 = new int[fil_m2];
color label4 = color(107,4,253);
color label5 = color(253,106,4);
color label6 = color(4,254,18);
float [] instancia2 ={23.0,53.0,45.0,1.0, }; // datos de nueva instancia {46.0,86.0,49.0,10,3},

//LOGOS UNIVERSIDAD
PImage fondo2;
PImage utn;

void setup() {
  //port=new Serial(this, "COM10", 9600);
  size (1400, 550);
  background(52, 152, 219);
  fill(0);
  textAlign(CENTER);
  textSize(45);
  //text("APRENDIZAJE DE MÁQUINA",width/2, 50);
  textAlign(LEFT);
  text("Algoritmo k-nn simple",520,40);
  text("LABORATORIO 05",700, 100);
//  text("SISTEMAS EMBEBIDOS",635, 50);
  textSize(20);
    text("BASE ANTIGUA",220, 40);
  text("BASE NUEVA",220, 295);
  text("Almeida Katherine",5,480);
  text("Tandayamo Smith",5, 510);
  text("Torres Erika",5, 540);
   textSize(25);
  // En el eje X
  text("0",190, 270);
  text("2",360, 270);
  text("4",530, 270);
  text("6",690, 270);
  text("8",860, 270);
  text("10",1018, 270);
  text("12",1185, 270);
  
  
  text("0",190, 520);
  text("20",360, 520);
  text("40",530, 520);
  text("60",690, 520);
  text("80",860, 520);
  text("100",1018, 520);
  text("120",1185, 520);
  
  //En el eje Y
  
  text("2",185, 225);
  text("4",185, 190);
  text("6",185, 155);
  text("8",185, 120);
  text("10",175, 85);
  text("12",175, 55);
  
  text("20",170, 475);
  text("40",170, 440);
  text("60",170, 405);
  text("80",170, 375);
  text("100",160, 340);
  text("120",160, 305);
  
  ////////////////////////////////////////////////
  anchoFig = width-400;
  altoFig = height-350;
  
  
  anchoFig2 = width-400;
  altoFig2 = height-350;
  
  
  fondo2=loadImage("logo-citel-1-1024x427.png");
  image(fondo2,1220,30);

 utn=loadImage("descarga_ccexpress.png");
  image(utn,1,0);
}

void draw() {
  fill(192, 192, 192); //FONDO DE LA CUADRICULA
  rect(figX, figY, anchoFig, altoFig); //BASE DE DATOS 1
  rect(figX2, figY2, anchoFig2, altoFig2);//BASE DE DATOS 2
  
  
  
  //Hallar máximos y mínimos de la BDD1
  for (int i=0; i<fil_m; i++) {
    if (matriz[i][0]>datoX_max) datoX_max = matriz[i][0];
    if (matriz[i][0]<datoX_min) datoX_min = matriz[i][0];
    if (matriz[i][1]>datoY_max) datoY_max = matriz[i][1];
    if (matriz[i][1]<datoY_min) datoY_min = matriz[i][1];
  }
  
  //Hallar máximos y mínimos de la BDD2
  for (int k=0; k<fil_m2; k++) {
    if (matriz2[k][0]>datoX_max2) datoX_max2 = matriz2[k][0];
    if (matriz2[k][0]<datoX_min2) datoX_min2= matriz2[k][0];
    if (matriz2[k][1]>datoY_max2) datoY_max2 = matriz2[k][1];
    if (matriz2[k][1]<datoY_min2) datoY_min2 = matriz2[k][1];
  }
 

  //Definir los ejes máximos de representación  BASE DE DATOS 1
  //con un 25% de los mínimos y máximos
  ejeX_max = datoX_max*1.25;
  ejeY_max = datoY_max*1.25;
  ejeX_min = datoX_min/1.25;
  ejeY_min = datoY_min/1.25;

  //Definir los ejes máximos de representación  BASE DE DATOS 2
  //con un 25% de los mínimos y máximos
  ejeX_max2 = datoX_max2*1.25;
  ejeY_max2 = datoY_max2*1.25;
  ejeX_min2 = datoX_min2/1.25;
  ejeY_min2 = datoY_min2/1.25;

//////////////////////////////////////////////////////////////BASE 1
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
    //absY = (ejeY_max - ejeY_min)/divV;
    //text((ejeY_max-(j*absY)), 20, figY+(j*altoFig/divV));
  }

  
  //Graficar base de datos
  for (j=0; j<fil_m; j++) {
    fill(0,0,255);
    x[j]=int(map(matriz[j][0], ejeX_min, ejeX_max, figX, width-figX));
    y[j]=int(map(matriz[j][1], ejeY_min, ejeY_max, figY+altoFig, figY));
    

    switch(int(matriz[j][4])) {
    case 1:
      fill(label1);
      ellipse(x[j], y[j], 14, 14);
      break;
    case 2:
      fill(label2);
      ellipse(x[j], y[j], 14, 14);
      break;
    case 3:
      fill(label3);
      ellipse(x[j], y[j], 14, 14);
      break;
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////BASE 2
  for (j2=0; j2<divV+1; j2++) {
    stroke(2);
    //Lineas horizontales
    line(figX2, figY2+(j2*altoFig2/divV2), width-figX2, figY2+(j2*altoFig2/divV2));
    //Lineas verticales
    line(figX2+(j2*anchoFig2/divH2), figY2, figX2+(j2*anchoFig2/divH2), altoFig2+figY2);
    //Valores en los ejes
    fill(1);
    //Eje ordenadas
    textSize(15);
    //absY = (ejeY_max - ejeY_min)/divV;
    //text((ejeY_max-(j*absY)), 20, figY+(j*altoFig/divV));
  }

  //for (int g=0; g<divH+1; g++) {

  //  //Eje abscisas
  //  textSize(15);
  //  absX = (ejeX_max - ejeX_min)/divH;
  //  text(ejeX_min+(g*absX), figX-10+(g*anchoFig/divH), altoFig+figY+20);
  //}
  
  //Graficar base de datos
  for (j2=0; j2<fil_m2; j2++) {
    fill(0,0,255);
    x[j2]=int(map(matriz2[j2][0], ejeX_min2, ejeX_max2, figX2, width-figX2));
    y[j2]=int(map(matriz2[j2][1], ejeY_min2, ejeY_max2, figY2+altoFig2, figY2));
    

    switch(int(matriz2[j2][4])) {
    case 1:
      fill(label4);
      ellipse(x[j2], y[j2], 14, 14);
      break;
    case 2:
      fill(label5);
      ellipse(x[j2], y[j2], 14, 14);
      break;
    case 3:
      fill(label6);
      ellipse(x[j2], y[j2], 14, 14);
      break;
    }
  }
  //////////////////////////////////////////////////////////
  
  
  //Aplicar el método KNN BASE DE DATOS 1
  
  knn(fil_m, col_m, instancia);
}

void knn(int fil, int col, float [] datos_prueba) {
  int j=0; // moverse en filas
  int i=0; //moverse en columnas
  float potencia=1; // potencia de atributos
  float raiz;  // distancia de dos puntos
  float dist_menor=3000; // almacenar la menor distancia
  float etiqueta = 0;
  for (j=0; j<fil; j++) { // moverse en filas
    for (i=0; i<col-1; i++) { // moverse en columnas
      potencia=potencia+pow(matriz[j][i]-datos_prueba[i], 2); // potencia entre columnas
    }
    raiz=sqrt(potencia); // raiz de potencias (distancia entre dos puntos)
    //Serial.println(raiz);
    potencia=0; //reinicio variable
    if (raiz<dist_menor) { //comparo a distancia menor
      dist_menor=raiz; // cambio de valor
      etiqueta=matriz[j][4]; // asigno predicción de etiqueta
    }
  }
  

  //Un color para cada etiqueta 
  
  int xi=int(map(datos_prueba[0], ejeX_min, ejeX_max, figX, width-figX));
  int yi=int(map(datos_prueba[1], ejeY_min, ejeY_max, figY+altoFig, figY));
  strokeWeight(10);
  stroke(255,0,0);
    switch(int(etiqueta)){
    case 1:
      fill(label1);
      ellipse(xi,yi,14,14);
      break;
    case 2:
      fill(label2);
      ellipse(xi,yi,14,14);
      break;
    case 3:
      fill(label3);
      ellipse(xi,yi,14,14);
      break;
  }
  strokeWeight(1);
  //if (label1==1) {    
  //  fill(label1);
  //  ellipse(xi, yi, 14, 14);
  //} else if (label2==2) {
  //  fill(label2);
  //  ellipse(xi, yi, 14, 14);
  //} else if (label2==3) {
  //  fill(label3);
  //  ellipse(xi, yi, 14, 14);
  //}



////////////////////////////////////////////////////////////

//Aplicar el método KNN BASE DE DATOS 2
  
  knn2(fil_m2, col_m2, instancia2);
}

void knn2(int fil2, int col2, float [] datos_prueba2) {
  int j2=0; // moverse en filas
  int i2=0; //moverse en columnas
  float potencia2=1; // potencia de atributos
  float raiz2;  // distancia de dos puntos
  float dist_menor2=3000; // almacenar la menor distancia
  float etiqueta2 = 0;
  for (j2=0; j2<fil2; j2++) { // moverse en filas
    for (i2=0; i2<col2-1; i2++) { // moverse en columnas
      potencia2=potencia2+pow(matriz2[j2][i2]-datos_prueba2[i2], 2); // potencia entre columnas
    }
    raiz2=sqrt(potencia2); // raiz de potencias (distancia entre dos puntos)
    //Serial.println(raiz);
    potencia2=0; //reinicio variable
    if (raiz2<dist_menor2) { //comparo a distancia menor
      dist_menor2=raiz2; // cambio de valor
      etiqueta2=matriz2[j2][3]; // asigno predicción de etiqueta
    }
  }
  

  //Un color para cada etiqueta 
  
  int xi2=int(map(datos_prueba2[0], ejeX_min2, ejeX_max2, figX2, width-figX2));
  int yi2=int(map(datos_prueba2[1], ejeY_min2, ejeY_max2, figY2+altoFig2, figY2));
  strokeWeight(10);
  stroke(255,0,0);
    switch(int(etiqueta2)){
    case 1:
      fill(label1);
      ellipse(xi2,yi2,7,7);
      break;
    case 2:
      fill(label2);
      ellipse(xi2,yi2,7,7);
      break;
    case 3:
      fill(label3);
      ellipse(xi2,yi2,7,7);
      break;
  }
  strokeWeight(1);

  //if (label4==1) {    
  //  fill(label4);
  //  ellipse(xi2, yi2, 14, 14);
  //} else if (label5==2) {
  //  fill(label5);
  //  ellipse(xi2, yi2, 14, 14);
  //} else if (label6==3) {
  //  fill(label6);
  //  ellipse(xi2, yi2, 14, 14);
  //}

}
