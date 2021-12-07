/*
   UNIVERSIDAD TECNICA DEL NORTE
   FACULTAD DE INGENIERIA EN CIENCIAS APLICADAS
   CARRERA DE INGENIERIA EN TELECOMUNICACIONES

   SISTEMAS EMBEBIDOS
   PROYECTO BIMESTRAL

   GRUPO 4
   ALMEIDA KATHERINE
   TANDAYAMO SMITH
   TORRES ERIKA

   SUAVIZADO| MEDIA | SENSOR DE AUDIO
*/

#define tamano_se 100 //definir tamano de la señal                               

//importar la senal desde otro archivo (senales)

extern double audio_sensor [tamano_se];
double SNR[tamano_se];
double salida_senal[tamano_se];

void suavizado(double *se_in, double *salida_senial, int se_tamano, int filter);        //Definir las senales
void plot_senal(void);

void setup() {
  Serial.begin(9600);     //Inicializar la comunicacion serial
}

void loop() {
  suavizado((double *)&audio_sensor[0], (double *)&salida_senal[0], (int)tamano_se, 9 ); //ventana de 11 el tiempo de cada una
  SNRsensor();
  plot_senal();
  delay(100);
}

//////////////////////////////// S U A V I Z A D O | M E D I A /////////////////////////////////////////////////

void suavizado(double *se_in, double *salida_senial, int se_tamano, int filter) {
  int i, j;
  for (i = 0; i < se_tamano; i++) {
    salida_senial[i];
    for (j = -floor(filter / 2); j < floor(filter / 2); j++) {    //
      salida_senial[i] = salida_senial[i] + se_in[i + j];
    }
    salida_senial[i] = salida_senial[i] / filter;
  }
}

//////////////////////////M E T R I C A |S N R ///////////////////////////////////////////

void SNRsensor() {
  double snr[tamano_se];
  double snr2[tamano_se];
  for (int i = 0; i < tamano_se; i++) {
    snr[i] = pow(audio_sensor[i], 2);                       // pow() Calcula el valor de un número elevado a una potencia. 
    snr2[i] = pow((audio_sensor[i] - salida_senal[i]), 2);  
    SNR[i] = 10 * log(snr[i] / snr2[i]);
  }
}

/////////////////////////G R A F I C A/////////////////////////////////////////////

void plot_senal(void) {      //el segundo void no necesita ningun parametro de entrada
  int i;
  for (i = 0; i < tamano_se; i++) {
    Serial.print(audio_sensor[i] + 600);  //Grafica senal
    Serial.print(",");
    Serial.print(salida_senal[i] + 10);   //Grafica suavizada
    Serial.print(",");
    Serial.println(SNR[i] - 400);         //Metrica SNR 
    delay(5);
  }
}
