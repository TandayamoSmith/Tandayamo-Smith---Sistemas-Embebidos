/*
 * UNIVERSIDAD TECNICA DEL NORTE 
 * FACULTAD DE INGENIERIA EN CIENCIAS APLICADAS
 * CARRERA DE INGENIERIA EN TELECOMUNICACIONES
 * 
 * SISTEMAS EMBEBIDOS 
 * PROYECTO BIMESTRAL 
 * 
 * GRUPO 4
 * ALMEIDA KATHERINE
 * TANDAYAMO SMITH 
 * TORRES ERIKA 
 * 
 * CONVOLUCION | | SENSOR DE CARDIOGRAMA 
 */
#define tam_sig 75 //tamaño de la señal
#define tam_imp 19 //tamaño del impulso

//Import signal to another .h file
extern double ecg[tam_sig];
extern double Impulse_response[tam_imp];
double output[tam_sig+tam_imp]; //vector de salida
//double output_signal[tam_sig];
double SNR[tam_sig];
void convolucion(double *sig_in,double *sig_out, double *imp, int sig_tam, int imp_tam);// definir funcion
void plot_signal(void);

void setup() {
  Serial.begin(9600);

}

void loop() {
  convolucion((double *)&ecg[0], (double *)&output[0], (double *)&Impulse_response[0],
                   (int) tam_sig, (int) tam_imp);
  SNRs();
  plot_signal();

}

//////////////////////FILTRADOS FIR//////////////////////////////////////////////////////////////////////////////////////

void convolucion(double *sig_in,double *sig_out, double *imp, int sig_tam, int imp_tam){
  int i,j;
  //poner ceros a vector de salida
  for(i=0;i<(sig_tam+imp_tam);i++){
    sig_out[i]=0;
  }
  for(i=0;i<sig_tam;i++){
    for(j=0;j<imp_tam;j++){
      sig_out[i+j]=sig_out[i+j]+sig_in[i]*imp[j];
    }
  }
}
void SNRs(){
  double snr[tam_sig];
  double snr2[tam_sig];
  for(int i=0;i<tam_sig;i++){
    snr[i]=pow(ecg[i],2);
    snr2[i]=pow((ecg[i]-output[i]),2);
    SNR[i]=10*log(snr[i]/snr2[i]);
    
  }
}

void plot_signal(void){ //puede ir sin void pero se pone para una manera mejor estrutura 
  int i;
  for(i=0;i<tam_sig;i++){
    Serial.print(ecg[i]+10);
    Serial.print(",");
    Serial.print(output[i]-100);
    Serial.print(",");
    Serial.println(SNR[i]-500);
    delay(5);
  }
}
