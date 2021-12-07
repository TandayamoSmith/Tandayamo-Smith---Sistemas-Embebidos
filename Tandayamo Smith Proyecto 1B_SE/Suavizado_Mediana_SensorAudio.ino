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

   SUAVIZADO| MEDIANA | SENSOR DE AUDIO
*/


#define tamano_se 100 //definir tamano de la señal 

//importar la senal desde otro archivo (senales)
extern double audio_sensor[tamano_se];

double SNR[tamano_se];
double salida_senal[tamano_se];

void mediana (double *se_in, double *salida_senal, int se_tamano, int filter);  //Definir la funcion
void plot_senal(void);

void setup() {
  Serial.begin(9600);     //Inicializar la comunicacion serial
}

void loop() {
  mediana ((double *)&audio_sensor[0], (double *)&salida_senal[0], (int) tamano_se, 5);
  SNRsensor();
  plot_senial();
  delay(100);
}

//////////////////////////////// S U A V I Z A D O | M E D I A N A /////////////////////////////////////////////////

void mediana (double *se_in, double *salida_senal, int se_tamano, int filter) {
  int i, j, l, k, med;
  double filtrado[filter];
  for (l = 0; l < se_tamano; l++) {
    for (k = 0; k < filter; k++) {
      filtrado[k] = se_in[l + k];
    }
    for (i = 0; i < (filter - 2); i++) {
      for (j = i + 1; j < filter - 1 - i; j++) {
        if (filtrado[j] < filtrado[i]) {
          med = filtrado[j];
          filtrado[j] = filtrado[i];
          filtrado[i] = med;
        }
      }
    }
    salida_senal[l] = filtrado[1];
  }
}


//////////////////////////M E T R I C A |S N R ///////////////////////////////////////////

void SNRsensor() {
  double snr[tamano_se];
  double snr2[tamano_se];
  for (int i = 0; i < tamano_se; i++) {
    snr[i] = pow(audio_sensor[i], 2);
    snr2[i] = pow((audio_sensor[i] - salida_senal[i]), 2);
    SNR[i] = 10 * log(snr[i] / snr2[i]);
  }
}

/////////////////////////G R A F I C A R /////////////////////////////////////////////

void plot_senial(void) {      //el segundo void no necesita ningun parametro de entrada
  int i;
  for (i = 0; i < tamano_se; i++) {
    Serial.print(audio_sensor[i] + 600);
    Serial.print(",");
    Serial.print(salida_senal[i] + 10);
    Serial.print(",");
    Serial.println(SNR[i] - 400);
    delay(5);
  }
}
