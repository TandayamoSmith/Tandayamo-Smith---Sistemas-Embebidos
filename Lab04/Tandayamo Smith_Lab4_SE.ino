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
int dato;

void setup() {
  Serial.begin(9600);
pinMode(7,INPUT);
pinMode(6,INPUT);
pinMode(5,INPUT);
pinMode(4,INPUT);
}

void loop() {
if(digitalRead(7)==LOW){
  delay(250);
  Serial.print("A");
}
if(digitalRead(6)==LOW){
  delay(250);
  Serial.print("B");
}
if(digitalRead(5)==LOW){
  delay(250);
  Serial.print("C");
}

if(digitalRead(4)==LOW){
  delay(250);
  Serial.print("D");
}

}
