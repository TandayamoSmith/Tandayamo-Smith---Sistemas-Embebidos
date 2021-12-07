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
 * TOMA DE MUESTRAS || SENSOR DE ELECTROCARDIOGRAMA 
 */
int SensorPin = 0;
int retraso = 100;
void setup (){
  Serial.begin (9600);
  }
void loop (){
    double valor = analogRead (SensorPin);
    Serial.println (valor); 
    delay (retraso);
  }
