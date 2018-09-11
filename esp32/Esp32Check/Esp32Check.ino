#include <WiFi.h>
#include "SSD1306.h" // alias for `#include "SSD1306Wire.h"`
// Initialize the OLED display using brzo_i2c
// D3 -> SDA
// D5 -> SCL
SSD1306 display(0x3c, 21, 22);
// or
// SH1106Brzo  display(0x3c, D3, D5);

int ledPin = 16;

//const int buzzer = 2;
//const int buzzer2 = 15;

//button
const int startButton = 12;
const int cancelButton = 13;
const int LockButton = 14;

int buttonState = 1;
int tempWifiStr = 0;

//wifi
char ssid[] = "kpi4mech"; // your SSID
char pass[] = "kpi4mech1"; // your SSID Password
//char ssid[] = "HanesSucat"; // your SSID
//char pass[] = "alabang1"; // your SSID Password
//char ssid[] = "outsourcing1.25"; // your SSID
//char pass[] = "dbafe54321!"; // your SSID Password
//char ssid[] = "outsourcing2.5"; // your SSID
//char pass[] = "alabang1"; // your SSID Password

#define uS_TO_S_FACTOR 1000000  /* Conversion factor for micro seconds to seconds */
#define TIME_TO_SLEEP  60        /* Time ESP32 will go to sleep (in seconds) */

RTC_DATA_ATTR int bootCount = 0;

//buzzer

int freq = 2000;
int channel = 4;
int resolution = 8;
int buzzerPin = 15;

//button debounce

long lastDebounceTime = 0;  // the last time the output pin was toggled
long debounceDelay = 50;    // the debounce time; increase if the output flickers

int displayUpdateCounter = 0;
 
void setup() {
	//ledcWriteTone(channel, 0);
	
	pinMode(ledPin, OUTPUT);
	
	Serial.begin(115200);
	Serial.println();
		
	// We start by connecting to a WiFi network
	Serial.print("Connecting to ");
	Serial.println(ssid);
	WiFi.begin(ssid, pass);
	
	int ResetCounter = 0;
	while (WiFi.status() != WL_CONNECTED) {
		delay(300);
		Serial.print(".");
		Serial.print(ResetCounter);
		ResetCounter++;
		yield();
		if (ResetCounter >= 30) {
			Serial.print("ESP8266 reset!");
			
			display.init();

			display.flipScreenVertically();
			display.setFont(ArialMT_Plain_16);
			
			displayClear();
			display.setTextAlignment(TEXT_ALIGN_CENTER);
			display.drawString(64, 22, "ESP8266 reset!");
			display.display();
			delayer(1);
			ESP.restart();
		  }
	}
	
	// Initialising the UI will init the display too.
	display.init();

	display.flipScreenVertically();
	display.setFont(ArialMT_Plain_10);
		
	pinMode(startButton, INPUT_PULLUP);
	pinMode(cancelButton, INPUT_PULLUP);
	pinMode(LockButton, INPUT_PULLUP);
	
	ledcSetup(channel, freq, resolution);
	ledcAttachPin(buzzerPin, channel);
}

void loop(void) {
	
	buzzerFunction(1);
	
	//Increment boot number and print it every reboot
	++bootCount;
	Serial.println("Boot number: " + String(bootCount));

	//Print the wakeup reason for ESP32
	print_wakeup_reason();
		
	displayClear();
	display.setTextAlignment(TEXT_ALIGN_LEFT);
	
	tempWifiStr = WifiStrength();
	
	display.drawString(30, 0, "WiFi: " + String(tempWifiStr));
	
	display.drawString(64, 22, "button test - Press Start");
	display.print("\n"); 
	display.display();

	Serial.println("NotifHuzzah circuit tests");
	Serial.println("button test - Press Start");
	do {
		//start
		//https://programmingelectronics.com/tutorial-19-debouncing-a-button-with-arduino-old-version/
		buttonState = digitalRead(startButton);
 
		//filter out any noise by setting a time buffer
		if ( (millis() - lastDebounceTime) > debounceDelay) {
			
			//if the button has been pressed, lets toggle the LED from "off to on" or "on to off"
			if (buttonState == HIGH) {
				lastDebounceTime = millis(); //set the current time
			}
			
			if (displayUpdateCounter >= 20) {
				//
				digitalWrite(ledPin, HIGH);
				displayClear();
				Serial.print(".");
				
				tempWifiStr = WifiStrength();
				//tempWifiStr = 1;
				int tempBatt = battery_level();
				//int tempBatt = 1;
				display.drawString(0, 0, "WiFi: " + String(tempWifiStr) + "BT: " + String(tempBatt));
				display.drawString(34, 22, "button test - Press Start");
				display.display();
				battery_level();
				//yield();
				digitalWrite(ledPin, LOW);
				displayUpdateCounter=0;
			}
			
			displayUpdateCounter++;

		}//close if(time buffer)
		
		//end
		
	} while (buttonState == HIGH); 
	
	displayClear();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
	
	tempWifiStr = WifiStrength();
	display.drawString(20, 0, "WiFi: " + String(tempWifiStr));
	
	display.drawString(64, 22, "button test - Press Cancel");
	display.print("\n");
	display.display();
	
	buttonState = 1;
	Serial.println("Start Ok");
	Serial.println("button test - Press Cancel");
	
	do {
		buttonState = digitalRead(cancelButton);  
		Serial.print(".");
		Serial.print(buttonState);
		yield();
		delay(100);
	} while (buttonState == HIGH); 
	
	displayClear();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
	
	tempWifiStr = WifiStrength();
	display.drawString(20, 0, "WiFi: " + String(tempWifiStr));
	
	
	display.drawString(64, 22, "button test - Press LockButton");
	display.print("\n");
	display.display();

	Serial.println("Cancel Ok");
	Serial.println("button test - Press LockButton");

	buttonState = 1;
	do {
		buttonState = digitalRead(LockButton);  
		Serial.print(".");
		yield();
		delay(100);
	} while (buttonState == HIGH); 
	
	Serial.println("Lock Ok");
	Serial.println("Testing Graphics");
	

displayClear();
display.setTextAlignment(TEXT_ALIGN_CENTER);

tempWifiStr = WifiStrength();
display.drawString(20, 0, "WiFi: " + String(tempWifiStr));
	

display.drawString(64, 22, "Screen OK!");
display.print("\n");
display.display();

 Serial.println("Graphics Ok");
 buzzerFunction(1);
 
 displayClear();
display.setTextAlignment(TEXT_ALIGN_CENTER);

tempWifiStr = WifiStrength();
display.drawString(20, 0, "WiFi: " + String(tempWifiStr));
	

display.drawString(64, 22, "Sleeping!");
display.print("\n");
display.display();
	
	Serial.println("Sleeping!");
	esp_deep_sleep_enable_timer_wakeup(TIME_TO_SLEEP * uS_TO_S_FACTOR);
	Serial.println("Setup ESP32 to sleep for every " + String(TIME_TO_SLEEP) + " Seconds");
	esp_deep_sleep_start();
	//ESP.deepSleep(60000000*1);
	//sleep esp8266 for 1mins
	 buzzerFunction(3);
	 Serial.println("Good Morning!!");
	ESP.restart();
 
}

int buzzerFunction(int counter){
	for (int buzzerTimer = 1; buzzerTimer <= counter; buzzerTimer++){
		
		/*
		ledcWriteTone(channel, 2000);
		for (int dutyCycle = 0; dutyCycle <= 255; dutyCycle=dutyCycle+10){
			Serial.println(dutyCycle);
			ledcWrite(channel, dutyCycle);
			delay(1000);
		}	
		
		ledcWrite(channel, 125);
 
		for (int freq = 255; freq < 10000; freq = freq + 250){
			Serial.println(freq);
			ledcWriteTone(channel, freq);
			delay(1000);
		}
		*/	Serial.println("Buzz!!");
			ledcWriteTone(channel, 2755);
			delay(1000);
			ledcWriteTone(channel, 0);
		
	}
}

int displayClear() {
display.clear();
display.display();
}

int delayer(int dly){
	Serial.print("Delaying : ");
	for (int DelayDaw = 0; DelayDaw <= dly; DelayDaw++){
		delay(1000);
		Serial.print(DelayDaw);
		Serial.print(".");
	}
}

int WifiStrength () {
	long RSSI = WiFi.RSSI();
	Serial.print("RSSI: ");
	Serial.println(RSSI);
	
	int bars = 0;
	
	if (RSSI > -55) {
		bars = 100;
	} else if (RSSI < -55 & RSSI > -65) {
		bars = 75;
	} else if (RSSI < -65 & RSSI > -70) {
		bars = 50;
	} else if (RSSI < -70 & RSSI > -78) {
		bars = 25;
	} else if (RSSI < -78 & RSSI > -82) {
		bars = 10;
	} else {
		bars = 0;
	}
	return bars;
}

int battery_level() {
 
  // read the battery level from the ESP8266 analog in pin.
  // analog read level is 10 bit 0-1023 (0V-1V).
  // our 1M & 220K voltage divider takes the max
  // lipo value of 4.2V and drops it to 0.758V max.
  // this means our min analog read value should be 580 (3.14V)
  // and the max analog read value should be 774 (4.2V).
  int level = analogRead(34);
  Serial.print("analog level: ");
  Serial.print(level);
 
  // convert battery level to percent
 level = map(level, 2900, 4000, 1, 100);
  Serial.print("Battery level: "); Serial.print(level); Serial.println("%");
  // turn on wifi if we aren't connected

	float VBAT = (127.0f/100.0f) * 3.30f * float(analogRead(34)) / 4096.0f;  // LiPo battery
	Serial.print("Battery Voltage = ");
	Serial.print(VBAT, 2);
	Serial.println(" V");
    float level1 = map(VBAT, 3, 4.2, 1, 100);
	Serial.print("battery percentage level: ");
	Serial.print(level1);
	
	return level1;
}

void print_wakeup_reason(){
  esp_deep_sleep_wakeup_cause_t wakeup_reason;

  wakeup_reason = esp_deep_sleep_get_wakeup_cause();

  switch(wakeup_reason)
  {
    case 1  : Serial.println("Wakeup caused by external signal using RTC_IO"); break;
    case 2  : Serial.println("Wakeup caused by external signal using RTC_CNTL"); break;
    case 3  : Serial.println("Wakeup caused by timer"); break;
    case 4  : Serial.println("Wakeup caused by touchpad"); break;
    case 5  : Serial.println("Wakeup caused by ULP program"); break;
    default : Serial.println("Wakeup was not caused by deep sleep"); break;
  }
}