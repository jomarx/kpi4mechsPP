

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

void setup(void) {
	Serial.begin(9600);
	
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
	display.drawString(64, 22, "button test - Press Start");
	display.print("\n");
	display.display();

	Serial.println("NotifHuzzah circuit tests");
	Serial.println("button test - Press Start");
	do {
		buttonState = digitalRead(startButton);  
		Serial.print(".");
		yield();
		delay(100);
	} while (buttonState == HIGH); 
	
	displayClear();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
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
display.drawString(64, 22, "Screen OK!");
display.print("\n");
display.display();

 Serial.println("Graphics Ok");
 buzzerFunction(1);
 
 displayClear();
display.setTextAlignment(TEXT_ALIGN_CENTER);
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