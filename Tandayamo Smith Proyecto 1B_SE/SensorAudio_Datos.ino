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

   DATOS | SENSOR DE AUDIO
*/


int  sensorAnalogPin = A0;    // Select the Arduino input pin to accept the Sound Sensor's analog output 
int  sensorDigitalPin = 7;    // Select the Arduino input pin to accept the Sound Sensor's digital output
int  analogValue = 0;         // Define variable to store the analog value coming from the Sound Sensor
int  digitalValue;            // Define variable to store the digital value coming from the Sound Sensor
int  Led13 = 13;              // Define LED port; this is the LED built in to the Arduino (labled L)
         
                      
void setup()
{
  Serial.begin(9600);               // The IDE settings for Serial Monitor/Plotter (preferred) must match this speed
  pinMode(sensorDigitalPin,INPUT);  // Define pin 7 as an input port, to accept digital input
  pinMode(Led13,OUTPUT);            // Define LED13 as an output port, to indicate digital trigger reached
}

void loop(){
  analogValue = analogRead(sensorAnalogPin); // Read the value of the analog interface A0 assigned to digitalValue 
  digitalValue=digitalRead(sensorDigitalPin); // Read the value of the digital interface 7 assigned to digitalValue 
  Serial.println(analogValue); // Send the analog value to the serial transmit interface
  
  if(digitalValue==HIGH)      // When the Sound Sensor sends signla, via voltage present, light LED13 (L)
  {
    digitalWrite(Led13,HIGH);
  }
  else
  {
    digitalWrite(Led13,LOW);
  }
  
  delay(50);                  // Slight pause so that we don't overwhelm the serial interface
}
