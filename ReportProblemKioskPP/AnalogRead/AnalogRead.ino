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
int potVal = 0;       // variable to store the potValue coming from the sensor
int mbdc = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  potVal = analogRead(potPin);    // read the potValue from the sensor
  delay(50);                  // stop the program for some time
  Serial.println(potVal);
  Serial.println("\n");
  
	if (potVal > 200 && potVal < 210) {mbdc=1;}
	else if (potVal > 221 && potVal < 231) {mbdc=2;}
	else if (potVal > 242 && potVal < 252) {mbdc=3;}
	else if (potVal > 263 && potVal < 273) {mbdc=4;}
	else if (potVal > 284 && potVal < 294) {mbdc=5;}
	else if (potVal > 305 && potVal < 315) {mbdc=6;}
	else if (potVal > 326 && potVal < 336) {mbdc=7;}
	else if (potVal > 347 && potVal < 357) {mbdc=8;}
	else if (potVal > 368 && potVal < 378) {mbdc=9;}
	else if (potVal > 389 && potVal < 399) {mbdc=10;}
	else if (potVal > 410 && potVal < 420) {mbdc=11;}
	else if (potVal > 431 && potVal < 441) {mbdc=12;}
	else if (potVal > 452 && potVal < 462) {mbdc=13;}
	else if (potVal > 473 && potVal < 483) {mbdc=14;}
	else if (potVal > 494 && potVal < 504) {mbdc=15;}
	else if (potVal > 515 && potVal < 525) {mbdc=16;}
	else if (potVal > 536 && potVal < 546) {mbdc=17;}
	else if (potVal > 557 && potVal < 567) {mbdc=18;}
	else if (potVal > 578 && potVal < 588) {mbdc=19;}
	else if (potVal > 599 && potVal < 609) {mbdc=20;}
	else if (potVal > 620 && potVal < 630) {mbdc=21;}
	else if (potVal > 641 && potVal < 651) {mbdc=22;}
	else if (potVal > 662 && potVal < 672) {mbdc=23;}
	else if (potVal > 683 && potVal < 693) {mbdc=24;}
	else if (potVal > 704 && potVal < 714) {mbdc=25;}
	else if (potVal > 725 && potVal < 735) {mbdc=26;}
	else if (potVal > 746 && potVal < 756) {mbdc=27;}
	else if (potVal > 767 && potVal < 777) {mbdc=28;}
	else if (potVal > 788 && potVal < 798) {mbdc=29;}
	else if (potVal > 809 && potVal < 819) {mbdc=30;}
	else if (potVal > 830 && potVal < 840) {mbdc=31;}
	else if (potVal > 851 && potVal < 861) {mbdc=32;}
	else if (potVal > 872 && potVal < 882) {mbdc=33;}
	else if (potVal > 893 && potVal < 903) {mbdc=34;}
	else if (potVal > 914 && potVal < 924) {mbdc=35;}
	else if (potVal > 935 && potVal < 945) {mbdc=36;}

	
	Serial.print("P");
	Serial.print(mbdc);
	Serial.println("\n");
	yield();

}