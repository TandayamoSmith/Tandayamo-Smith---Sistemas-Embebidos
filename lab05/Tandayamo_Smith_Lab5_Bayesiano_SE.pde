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
int figX = 200;            //Coordenada X de el cuadro principal de la gráfica
int figY = 50;            //Coordenada Y de el cuadro principal de la gráfica
int j=0;
int fil_m = 120;
int col_m = 5;      //Filas y columnas de la BDD
int divV = 6;
int divH = 6;         //Divisiones horizontales y verticales
int [] x = new int[fil_m];
int [] y = new int[fil_m];

///////////////////////segunda grafica//////////////////////////////

float datoX_max2=0;
float datoY_max2=0;
float datoX_min2=1000;
float datoY_min2=1000;
float ejeX_min2;
float ejeY_min2;
float ejeX_max2;
float ejeY_max2;
float absX2;
float absY2;
int ancho2= 1500;     //ventana celeste
int alto2 = 1500;
int anchoFig2 = 0;          //Ancho del gráfico
int altoFig2= 0;        //Altura del gráfico
int figX2= 200;            //Coordenada X de el cuadro principal de la gráfica
int figY2= 300;            //Coordenada Y de el cuadro principal de la gráfica
int j2=0;
int fil_m2 = 120;
int col_m2 = 5;      //Filas y columnas de la BDD
int divV2 = 6;
int divH2 = 6;         //Divisiones horizontales y verticales
int [] x2 = new int[fil_m];
int [] y2 = new int[fil_m];
PImage fondo2;
PImage utn;



IntList list;
color label1 = color(107, 4, 253);
color label2 = color(255, 255, 0);
color label3 = color(4, 254, 18);


IntList list2;
color label4= color(107, 4, 253);
color label5 = color(255, 255, 0);
color label6 = color(4, 254, 18);



////////////////reemplazo de datos///////////////////////
float []instancia={5.5, 2.4, 4.6, 1.5, };

float []instancia2={24.0,42.0,46.0,6.0, };


///////////////visualizacion/////////////////////////////
void setup() {

  size (1400, 550);
  background(52, 152, 219);//fondo celeste
  fill(0);
    textAlign(CENTER);
  textSize(45);
  //text("APRENDIZAJE DE MÁQUINA",width/2, 50);
  textAlign(LEFT);
  text("CLASIFICADOR BAYESIANO",500,40);
  textSize(20);
  text("BASE ANTIGUA",220, 40);
  text("BASE NUEVA",220, 295);
  textSize(20);
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
  fill(192, 192, 192);//color de fondo para cuadricula
  rect(figX, figY, anchoFig, altoFig);
  rect(figX2, figY2, anchoFig2, altoFig2);

  //Separar máximos y mínimos de la base de datos
  for (int i=0; i<fil_m; i++) {
    if (matriz[i][0]>datoX_max) datoX_max = matriz[i][0];
    if (matriz[i][0]<datoX_min) datoX_min = matriz[i][0];
    if (matriz[i][1]>datoY_max) datoY_max = matriz[i][1];
    if (matriz[i][1]<datoY_min) datoY_min = matriz[i][1];
  }
  
  for (int k=0; k<fil_m2; k++) {
    if (matriz2[k][0]>datoX_max2) datoX_max2 = matriz2[k][0];
    if (matriz2[k][0]<datoX_min2) datoX_min2= matriz2[k][0];
    if (matriz2[k][1]>datoY_max2) datoY_max2 = matriz2[k][1];
    if (matriz2[k][1]<datoY_min2) datoY_min2 = matriz2[k][1];
  }
  //Definir los ejes máximos de representación
  ejeX_max = datoX_max*1.25;
  ejeY_max = datoY_max*1.25;
  ejeX_min = datoX_min/1.25;
  ejeY_min = datoY_min/1.25;

  ejeX_max2 = datoX_max2*1.25;
  ejeY_max2 = datoY_max2*1.25;
  ejeX_min2 = datoX_min2/1.25;
  ejeY_min2 = datoY_min2/1.25;

  for (j=0; j<divV+1; j++) {
    stroke(1);

    //Lineas horizontales
    line(figX, figY+(j*altoFig/divV), width-figX, figY+(j*altoFig/divV));
    //Lineas verticales
    line(figX+(j*anchoFig/divH), figY, figX+(j*anchoFig/divH), altoFig+figY);
    //Valores en los ejes
    fill(1);
    //Eje ordenadas
    textSize(15);
    //absY = (ejeY_max - ejeY_min)/divV;
   // text((ejeY_max-(j*absY)), 20, figY+(j*altoFig/divV));
  }

  for (j2=0; j2<divV2+1; j2++) {

      line(figX2, figY2+(j2*altoFig2/divV2), width-figX2, figY2+(j2*altoFig2/divV2));
      //Lineas verticales
      line(figX2+(j2*anchoFig2/divH2), figY2, figX2+(j2*anchoFig2/divH2), altoFig2+figY2);
      fill(1);
      //Eje ordenadas
      textSize(15);
    }

  //Graficar base de datos
  for (j=0; j<fil_m; j++) {
    fill(0, 0, 255);
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
  bayesiano(3, 5, 120, 0.2, instancia);////////establecer dato///////////////

///////////////////////////////// DOS //////////////////////////////////

//Graficar base de datos 2
for (j2=0; j2<fil_m2; j2++) {
  fill(0, 0, 255);
  x2[j2]=int(map(matriz2[j2][0], ejeX_min2, ejeX_max2, figX2, width-figX2));
  y2[j2]=int(map(matriz2[j2][1], ejeY_min2, ejeY_max2, figY2+altoFig2, figY2));

  switch(int(matriz2[j2][4])) {
  case 1:
    fill(label4);
    ellipse(x2[j2], y2[j2], 14, 14);
    break;
  case 2:
    fill(label5);
    ellipse(x2[j2], y2[j2], 14, 14);
    break;
  case 3:
    fill(label6);
    ellipse(x2[j2], y2[j2], 14, 14);
    break;
  }
}
bayesiano2(3, 5, 120, 0.2, instancia2);////////establecer dato///////////////
}
/////////////////metodo 1//////////////////////////////////////////////////

void bayesiano(int etiquetas, int columnas, int filas, float r, float [] datos_prueba) {
  list = new IntList();
  int i=0; // variable de recorrido en matriz
  int j=0; // variable de recorrido en matriz
  int k=0; // variable de recorrido en matriz
  int t=0; // variable de recorrido en matriz
  float p_x=0.0; // probabilidad marginal, en numero decimal con float

  float distancia=0.0; 
  float sumatoria=0.0;
  float normalizador=0.0;
  float dist_mayor=0.0001;
  int resultado=0; // resultado de etiqueta
  float aux=0; // auxiliar de cambio de variable


  //creación del modelo 
  float [][]prob=new float[4][etiquetas];
  for (i=0; i<4; i++) {
    for (j=0; j<etiquetas; j++) {   // |    1   |   2    |    3   |
      prob[i][j]=0;                 // |    0   |   0    |    0   |
      if (i==0)                     // |    0   |   0    |    0   |
        prob[i][j]=j+1;             // |    0   |   0    |    0   |
    }
  }
  // sumar el valor del total por etiqueta en la matriz
  for (i=0; i<etiquetas; i++) {             // |    1   |   2    |    3   |
    for (j=0; j<filas; j++) {               // |   40   |   40   |   40   |
      if (matriz[j][columnas-1]==i+1)       // |    0   |   0    |    0   |
        prob[1][i]++;                       // |    0   |   0    |    0   |
    }
  }

  //encontrar la distancia mayor 
  for (i=0; i<filas; i++) {
    for (j=0; j<columnas-1; j++) {
      sumatoria=sumatoria+pow(matriz[i][j]-datos_prueba[j], 2); // realizar la sumatoria de potencia
    }
    distancia=sqrt(sumatoria); // raiz cuadrada para distancia entre dos puntos
    sumatoria=0;
    if (distancia>dist_mayor)
      dist_mayor=distancia; // encuentro distancia mayor
  }
  distancia=0; 
  // normalizar la distancia en toda la matriz 
  for (i=0; i<filas; i++) {
    for (j=0; j<columnas-1; j++) {
      sumatoria=sumatoria+pow(matriz[i][j]-datos_prueba[j], 2);// realizar la sumatoria de potencia
    }
    distancia=sqrt(sumatoria); // raiz cuadrada para distancia entre dos puntos
    sumatoria=0;
    normalizador=distancia/dist_mayor; // distancias entre 0 y 1
    if (normalizador<r)
      list.append(i); // almancenar la fila de los datos que son parte de la circunferencia
  }
  // sumar por etiqueta a todos los datos que se encuentran en la circuferencia
  for (i=0; i<list.size(); i++) {                          // |    1   |   2    |    3   |
    for (j=0; j<etiquetas; j++) {                          // |   40   |   40   |   40   |
      if (matriz[list.get(i)][columnas-1]==prob[0][j])     // |    4   |   1    |    0   |
        prob[2][j]++;                                      // |    0   |   0    |    0   |
    }
  }
  // probabilidades por cada etiqueta
  p_x=float(list.size())/float(filas); 
  for (k=0; k<etiquetas; k++) {  // encontrar la probabilidad por etiqueta
    prob[3][k]=((prob[1][k]/filas)*(prob[2][k]/prob[1][k]))/p_x;
  }
  // |    1   |   2    |    3   |
  // |   40   |   40   |   40   |
  // |    4   |   1    |    0   |
  // |  0.80  |  0.20  |    0   |

  // busqueda de probabilidad por etiqueta
  for (k=0; k<etiquetas; k++) {
    if (prob[3][k]>aux) {
      resultado=int(prob[0][k]);
      aux=prob[3][k];
    }
  }

  //println(respuesta);
    fill(145, 25, 154);
  //fill(255,0,0);
  int xi=int(map(datos_prueba[0], ejeX_min, ejeX_max, figX, width-figX));
  int yi=int(map(datos_prueba[1], ejeY_min, ejeY_max, figY+altoFig, figY));

  //int d=int(map(r, 0, ejeX_max, figX, width-figX)); //radio de la circunferencia

  
  strokeWeight(25);
 // fill(#91199A);
  stroke(255,0,0);//contorno rojo dato seleccionado
  switch(resultado){
  case 1:
    fill(label1);
    ellipse(xi, yi, 14, 14);
    break;
  case 2:
    fill(label2);
    ellipse(xi, yi, 14, 14);
    break;
  case 3:
    fill(label3);
    ellipse(xi, yi, 14, 14);
    ;
    break;
  }
  strokeWeight(3);
  noFill();
  stroke(3);
 // ellipse(xi, yi, d/3, d/3); //circunferencia a la redonda de los datos
}
  /////////////////metodo 2//////////////////////////////////////////////////
 
void bayesiano2(int etiquetas2, int columnas2, int filas2, float r2, float [] datos_prueba2) {
  list2 = new IntList();
  int i2=0; // variable de recorrido en matriz
  int j2=0; // variable de recorrido en matriz
  int k2=0; // variable de recorrido en matriz
  int t2=0; // variable de recorrido en matriz
  float p_x2=0.0; // probabilidad marginal, en numero decimal con float

  float distancia2=0.0; 
  float sumatoria2=0.0;
  float normalizador2=0.0;
  float dist_mayor2=0.0001;
  int resultado2=0; // resultado de etiqueta
  float aux2=0; // auxiliar de cambio de variable


  //creación del modelo 
  float [][]prob2=new float[4][etiquetas2];
  for (i2=0; i2<4; i2++) {
    for (j2=0; j2<etiquetas2; j2++) {   // |    1   |   2    |    3   |
      prob2[i2][j2]=0;                 // |    0   |   0    |    0   |
      if (i2==0)                     // |    0   |   0    |    0   |
        prob2[i2][j2]=j2+1;             // |    0   |   0    |    0   |
    }
  }
  // sumar el valor del total por etiqueta en la matriz
  for (i2=0; i2<etiquetas2; i2++) {             // |    1   |   2    |    3   |
    for (j2=0; j2<filas2; j2++) {               // |   40   |   40   |   40   |
      if (matriz2[j2][columnas2-1]==i2+1)       // |    0   |   0    |    0   |
        prob2[1][i2]++;                       // |    0   |   0    |    0   |
    }
  }

  //encontrar la distancia mayor 
  for (i2=0; i2<filas2; i2++) {
    for (j2=0; j2<columnas2-1; j2++) {
      sumatoria2=sumatoria2+pow(matriz2[i2][j2]-datos_prueba2[j2], 2); // realizar la sumatoria de potencia
    }
    distancia2=sqrt(sumatoria2); // raiz cuadrada para distancia entre dos puntos
    sumatoria2=0;
    if (distancia2>dist_mayor2)
      dist_mayor2=distancia2; // encuentro distancia mayor
  }
  distancia2=0; 
  // normalizar la distancia en toda la matriz 
  for (i2=0; i2<filas2; i2++) {
    for (j2=0; j2<columnas2-1; j2++) {
      sumatoria2=sumatoria2+pow(matriz2[i2][j2]-datos_prueba2[j2], 2);// realizar la sumatoria de potencia
    }
    distancia2=sqrt(sumatoria2); // raiz cuadrada para distancia entre dos puntos
    sumatoria2=0;
    normalizador2=distancia2/dist_mayor2; // distancias entre 0 y 1
    if (normalizador2<r2)
      list2.append(i2); // almancenar la fila de los datos que son parte de la circunferencia
  }
  // sumar por etiqueta a todos los datos que se encuentran en la circuferencia
  for (i2=0; i2<list2.size(); i2++) {                          // |    1   |   2    |    3   |
    for (j2=0; j2<etiquetas2; j2++) {                          // |   40   |   40   |   40   |
      if (matriz2[list2.get(i2)][columnas2-1]==prob2[0][j2])     // |    4   |   1    |    0   |
        prob2[2][j2]++;                                      // |    0   |   0    |    0   |
    }
  }
  // probabilidades por cada etiqueta
  p_x2=float(list2.size())/float(filas2); 
  for (k2=0; k2<etiquetas2; k2++) {  // encontrar la probabilidad por etiqueta
    prob2[3][k2]=((prob2[1][k2]/filas2)*(prob2[2][k2]/prob2[1][k2]))/p_x2;
  }
  // |    1   |   2    |    3   |
  // |   40   |   40   |   40   |
  // |    4   |   1    |    0   |
  // |  0.80  |  0.20  |    0   |

  // busqueda de probabilidad por etiqueta
  for (k2=0; k2<etiquetas2; k2++) {
    if (prob2[3][k2]>aux2) {
      resultado2=int(prob2[0][k2]);
      aux2=prob2[3][k2];
    }
  }

  //println(respuesta);
  fill(255,0,0);
  int xi2=int(map(datos_prueba2[0], ejeX_min2, ejeX_max2, figX2, width-figX2));
  int yi2=int(map(datos_prueba2[1], ejeY_min2, ejeY_max2, figY2+altoFig2, figY2));

 // int d2=int(map(r2, 0, ejeX_max2, figX2, width-figX2)); //radio de la circunferencia

  strokeWeight(26);
  stroke(255, 0, 0);//contorno rojo dato seleccionado
  switch(resultado2) {
  case 1:
    fill(label4);
    ellipse(xi2, yi2, 14, 14);
    break;
  case 2:
    fill(label5);
    ellipse(xi2, yi2, 14, 14);
    break;
  case 3:
    fill(label6);
    ellipse(xi2, yi2, 14, 14);
    
    break;
  }
  strokeWeight(3);
  noFill();
  stroke(3);
  
}
