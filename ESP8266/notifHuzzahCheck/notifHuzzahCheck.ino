
#include <ESP8266WiFi.h>
#include "SSD1306.h" // alias for `#include "SSD1306Wire.h"`
// Initialize the OLED display using brzo_i2c
// D3 -> SDA
// D5 -> SCL
SSD1306 display(0x3c, 4, 5);
// or
// SH1106Brzo  display(0x3c, D3, D5);

const int buzzer = 2;
const int buzzer2 = 15;

//button
const int startButton = 12;
const int cancelButton = 13;
const int LockButton = 14;

int buttonState = 1;
int tempWifiStr = 0;

//wifi
//char ssid[] = "kpi4mech"; // your SSID
//char pass[] = "kpi4mech1"; // your SSID Password
char ssid[] = "HanesSucat"; // your SSID
char pass[] = "alabang1"; // your SSID Password


void setup(void) {
	Serial.begin(9600);
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
}

void loop(void) {
	
	buzzerFunction(1);
		
	displayClear();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
	
	tempWifiStr = WifiStrength();
	display.drawString(20, 0, "WiFi: " + String(tempWifiStr));
	
	display.drawString(64, 22, "button test - Press Start");
	display.print("\n"); 
	display.display();

	Serial.println("NotifHuzzah circuit tests");
	Serial.println("button test - Press Start");
	do {
		displayClear();
		buttonState = digitalRead(startButton);  
		Serial.print(".");
		
		tempWifiStr = WifiStrength();
		display.drawString(20, 0, "WiFi: " + String(tempWifiStr));
		display.drawString(64, 22, "button test - Press Start");
		display.display();
		yield();
		delay(500);
		
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
	ESP.deepSleep(60000000*1);
	//sleep esp8266 for 1mins
	 buzzerFunction(3);
	 Serial.println("Good Morning!!");
	ESP.restart();
 
}

int buzzerFunction(int counter){
	for (int buzzerTimer = 1; buzzerTimer <= counter; buzzerTimer++){
		tone(buzzer, 4000); // Send 5KHz sound signal...
		delay(50);        // ...for .1 sec
		noTone(buzzer);     // Stop sound...
		delay(50); 
		tone(buzzer2, 4000); // Send 5KHz sound signal...
		delay(50);        // ...for .1 sec
		noTone(buzzer2);     // Stop sound...
		delay(50); 
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