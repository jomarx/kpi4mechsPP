/* Analog Read to LED
 * ------------------ 
 *
 * turns on and off a light emitting diode(LED) connected to digital  
 * pin 13. The amount of time the LED will be on and off depends on
 * the potValue obtained by analogRead(). In the easiest case we connect
 * a potentiometer to analog pin 2.
 *
 * Created 1 December 2005
 * copyleft 2005 DojoDave <http://www.0j0.org>
 * http://arduino.berlios.de
 *
 */

int potPin = A0;    // select the input pin for the potentiometer
int ledPin = 5;   // select the pin for the LED
int potVal = 0;       // variable to store the potValue coming from the sensor
int mbdc = 0;

void setup() {
  pinMode(ledPin, OUTPUT);  // declare the ledPin as an OUTPUT
  Serial.begin(9600);
}

void loop() {
  potVal = analogRead(potPin);    // read the potValue from the sensor
  digitalWrite(ledPin, HIGH);  // turn the ledPin on
  delay(50);                  // stop the program for some time
  digitalWrite(ledPin, LOW);   // turn the ledPin off
  delay(50);                  // stop the program for some time
  Serial.println(potVal);
  Serial.println("\n");
  
	if (potVal > 100 && potVal < 286) {mbdc=1;}
	else if (potVal > 297 && potVal < 323) {mbdc=2;}
	else if (potVal > 334 && potVal < 360) {mbdc=3;}
	else if (potVal > 371 && potVal < 397) {mbdc=4;}
	else if (potVal > 408 && potVal < 434) {mbdc=5;}
	else if (potVal > 445 && potVal < 471) {mbdc=6;}
	else if (potVal > 482 && potVal < 508) {mbdc=7;}
	else if (potVal > 519 && potVal < 545) {mbdc=8;}
	else if (potVal > 556 && potVal < 582) {mbdc=9;}
	else if (potVal > 593 && potVal < 619) {mbdc=10;}
	else if (potVal > 630 && potVal < 656) {mbdc=11;}
	else if (potVal > 667 && potVal < 693) {mbdc=12;}
	else if (potVal > 704 && potVal < 730) {mbdc=13;}
	else if (potVal > 741 && potVal < 767) {mbdc=14;}
	else if (potVal > 778 && potVal < 804) {mbdc=15;}
	else if (potVal > 815 && potVal < 841) {mbdc=16;}
	else if (potVal > 852 && potVal < 878) {mbdc=17;}
	else if (potVal > 889 && potVal < 915) {mbdc=18;}
	else if (potVal > 926 && potVal < 952) {mbdc=19;}
	else if (potVal > 963 && potVal < 989) {mbdc=20;}
	
	Serial.print("P");
	Serial.print(mbdc);
	Serial.println("\n");

}