/*
  Simple POST client for ArduinoHttpClient library
  Connects to server once every five seconds, sends a POST request
  and a request body
  note: WiFi SSID and password are stored in config.h file.
  If it is not present, add a new tab, call it "config.h" 
  and add the following variables:
  char ssid[] = "ssid";     //  your network SSID (name)
  char pass[] = "password"; // your network password
  created 14 Feb 2016
  by Tom Igoe
  
  this example is in the public domain
 */
#include <ArduinoHttpClient.h>
#include <WiFi.h>
#include "config.h"
#include <Wire.h>
#include <Keypad.h>

#include <LiquidCrystal_I2C.h>
//https://www.elecrow.com/wiki/index.php?title=Crowtail-_I2C_LCD

//#include "LiquidCrystal.h"
//LiquidCrystal lcd(0);
LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

//membrane keyboard settings
#define Input_Length 2 
#define QAInput_Length 3 
char Data[Input_Length]; 
char QAData[QAInput_Length]; 
char Master[Input_Length] = "1"; 
byte data_count = 0, master_count = 0, input_count = 0;
bool Pass_is_good;
char customKey;
char QAcustomKey;
const byte ROWS = 4;
const byte COLS = 3;

char hexaKeys[ROWS][COLS] = {
  {'1', '2', '3'},
  {'4', '5', '6'},
  {'7', '8', '9'},
  {'*', '0', '#'}
};

byte rowPins[ROWS] = {5, 17, 16, 4};
byte colPins[COLS] = {0, 2, 15};

Keypad customKeypad = Keypad(makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS);

//char serverAddress[] = "192.168.143.220";  // server address
char serverAddress[] = "192.168.102.4";  // server address
int port = 80;

WiFiClient wifi;
HttpClient client = HttpClient(wifi, serverAddress, port);
int status = WL_IDLE_STATUS;
String response;
int statusCode = 0;

//static deviceID that will be default per device.
int deviceID = 1;

//button
const int incButton = 12;

const int LedLight = 13;

int buttonState1 = 1; //incButton

int swState1 = 1;

//ElapsedTime = time elpsed since start
int ElapsedTime = 0;

//neopixel stuffs
int BlinkState = 0;
int countToSec = 0;

String contentType = "application/x-www-form-urlencoded";
String taskID = "";
String cellLocation = "";
String Status = "";
String EmpNo = "";

//wifi strength
int tempWifiStr = 0;

#define uS_TO_S_FACTOR 1000000  /* Conversion factor for micro seconds to seconds */
#define TIME_TO_SLEEP  60        /* Time ESP32 will go to sleep (in seconds) */

RTC_DATA_ATTR int bootCount = 0;

//buzzer

int freq = 2000;
int channel = 0;
int resolution = 8;
int buzzerPin = 14;

//loop state
int loopState = 0;
int QCOloopState = 0;
int firstCheck = 0;
int TNLeaveLoop = 0;

//wifi strength details
int bars = 0;
int oldBars = 0;

void setup() {
	
	//watchdog timer
	//ESP.wdtDisable();

	WiFi.mode(WIFI_STA);

	buzzerFunction(1);

	Serial.begin(115200);
	wifiConnect();
	
	//lcd.begin(16, 2); //crowtail LCD
	//lcd.setBacklight(HIGH); //crowtail LCD
	//lcd.setCursor(0,0);
	lcd.init(); 
	lcd.backlight();

	// print the SSID of the network you're attached to:
	Serial.print("SSID: ");
	Serial.println(WiFi.SSID());

	// print your WiFi shield's IP address:
	IPAddress ip = WiFi.localIP();
	Serial.print("IP Address: ");
	Serial.println(ip);

	String wfms = WiFi.macAddress();
	Serial.print("MAC address : ");
	Serial.println(wfms);
	
	pinMode(incButton, INPUT_PULLUP);
	
	pinMode(LedLight, OUTPUT);

	attachInterrupt(incButton, incButtonChange, CHANGE);
	
	//buzzer init
	ledcSetup(channel, freq, resolution);
	ledcAttachPin(buzzerPin, channel);
	
	ClearLCD();

	WifiStrength ();
	lcd.setCursor(0,0);
	lcd.print("Device ID: ");
	lcd.setCursor(0,1);
	lcd.print(deviceID);
	delayer(1);
	
	Serial.println("WiFi connected");
	Serial.println("IP address: ");
	Serial.println(WiFi.localIP());

	ClearLCD();
	lcd.setCursor(0,0);
	lcd.print("WiFi connected");
	lcd.setCursor(0,1);
	lcd.print(WiFi.localIP());
	delayer(1);

}

void loop() {
	
	//Increment boot number and print it every reboot
	//++bootCount;
	Serial.println("Boot number: " + String(bootCount));
	
	print_wakeup_reason();
	
	Serial.println();
	Serial.println("Start Main loop");	
	
	//reset button values	
	//buttonState1 = 1;
	
	OffNeoPixel();
	
	int typer=0;
	
	//delayer(2);
	//ClearLCD();
	WifiStrength();
	
	lcd.setCursor(0,1);
	lcd.print("Standby Mode    ");
	Serial.println("Standby\n Mode");
	
	//getting tasks
	//check location variable, if empty, get from PHP
	if (cellLocation=="") {
		Serial.println("TypePhp(6): ");
		typePhp(6);
	}
	
	Serial.print("current cellLocation: ");
	Serial.println(cellLocation);
	
	if (firstCheck==0) {
		
		//delayer(2);
		ClearLCD();
		WifiStrength ();
		lcd.setCursor(0,1);
		lcd.print("Getting Status");

		typer=1;
		statusCode = 0;
		response = "";
		Serial.println("[1]making POST request");
		//String contentType = "application/x-www-form-urlencoded";
		String postData = "deviceID=";
		postData += deviceID;
		postData += "&typer=";
		postData += typer;

		Serial.print("postData: ");
		Serial.println(postData);

		Serial.println();
		Serial.println("Start sending loop");
		
		
		while ( statusCode != 200) {
			
			Serial.print(".");
			//client.post("/android2/qcotasker.php", contentType, postData);
			client.post("/qcotasker.php", contentType, postData);
			// read the status code and body of the response
			statusCode = client.responseStatusCode();
			response = client.responseBody();
			Serial.print("Status code: ");
			Serial.println(statusCode);
			//200 = data sent successfully
			//-1 =
			//Response is the data the PHP server sents back
			Serial.print("Response: ");
			Serial.println(response);
			delay(100);
			//disconnect client
			client.stop();
		}
	firstCheck=1;
	}
	//reset status code
	statusCode = 0;
  
	if ((response != "")&&(typer == 1)) {
	  
		
		Serial.println();
		Serial.println("not empty, means task available!");
		
		loopState=1;

		//crunch response to get data
		int firstCommaIndex = response.indexOf(',');
		int secondCommaIndex = response.indexOf(',', firstCommaIndex+1);
		int thirdCommaIndex = response.indexOf(',', secondCommaIndex+1);
		taskID = response.substring(0, firstCommaIndex);

		Serial.print("ID: ");
		Serial.println(taskID);

		Serial.println();
		
		client.stop();

		//task found starting
	  
		TNLeaveLoop = 0;
		int countToFive = 0;
		int countToOne = 0;
		long countToFiveAgain = 0;
		int MinLeft = 15;
		int printOnce = 1;
		
		//set LED to ON
		digitalWrite(LedLight, HIGH);   // turn the LED on (HIGH is the voltage level)
		delay(10);

		ClearLCD();
		
		//get WIFI strength data
		WifiStrength ();
		lcd.setCursor(0,1);
		lcd.print("ChangeOver Start");

		buzzerFunction(2);
		
		//delayer(1);
		
		while (TNLeaveLoop < 1) {
			
			if (printOnce == 1) {
				WifiStrength ();
				lcd.setCursor(0,1);
				lcd.print("ChangOvr Ongoing");
				printOnce=0;
			}
			
			if (countToSec > 15) {
				BlinkNeoPixel();
				countToSec = 0;
			}
				
			if (buttonState1 == LOW) {
				checkButtonContents();
				//OptionOne();
				buttonState1 = HIGH;
				
			}
			/*
			if (buttonState2 == LOW){
				OptionTwo();
				buttonState2 = HIGH;	
				TNLeaveLoop=2;
			}*/

			if (countToOne > 240 && TNLeaveLoop < 1){
				ClearLCD();

				//get WIFI strength data
				WifiStrength ();
				lcd.setCursor(0,1);
				lcd.print("ChangOvr Ongoing");
				countToOne = 0;
			}
			
			if (countToFive > 2400 && TNLeaveLoop < 1){
				//beep every 5mins
				buzzerFunction(1);
				countToFive = 0;
			}

			Serial.print("countToFive: ");
			Serial.print(countToFive);
			Serial.print(" countToOne: ");
			Serial.print(countToOne);
			Serial.print("  TNLeaveLoop: ");
			Serial.println(TNLeaveLoop);
			countToFive++;
			countToOne++;
			countToSec++;
			delay(50);

		}
		
		Serial.println("out of loop");
		//ClearLCD();
			
		//reset button state
		buttonState1 = 1;
	
	//if no current task found
	} else {
		OnNeoPixel();
		//ClearLCD();
		WifiStrength ();
		lcd.setCursor(0,1);
		lcd.print("Standby Mode    ");
		Serial.println("Standby Mode");
		
		if (buttonState1 == LOW) {
			checkButtonContents();
			//OptionOne();
			buttonState1 = HIGH;
		}
		
	}
  
	Serial.println("End of Void Loop");
	delay(1000);
	
	
}

int typePhp (int typer){
	
	ClearLCD();
	WifiStrength ();
	
	if (typer==1) {
		lcd.setCursor(0,1);
		lcd.print("Selecting Task");
	} else if (typer==2) {
		lcd.setCursor(0,1);
		lcd.print("Insert Task");
		firstCheck=0;
	} else if (typer==3) {
		lcd.setCursor(0,1);
		lcd.print("Ending C.Task");
	} else if (typer==4) {
		lcd.setCursor(0,1);
		lcd.print("Record QA Output");
	} else if (typer==5) {
		lcd.setCursor(0,1);
		lcd.print("Record PRB Dn");
	} else if (typer==6) {
		lcd.setCursor(0,1);
		lcd.print("Check LOC");
	} else if (typer==7) {
		lcd.setCursor(0,1);
		lcd.print("Incrmnt Outpt");
	} else if (typer==8) {
		lcd.setCursor(0,1);
		lcd.print("Task Voided");
	} else if (typer==9) {
		lcd.setCursor(0,1);
		lcd.print("Start QCO Layout");
	} else if (typer==10) {
		lcd.setCursor(0,1);
		lcd.print("End QCO Layout");
	}
	

	statusCode = 0;
	response = "";
	Serial.print("[typePhp] making POST request for: ");
	Serial.println(typer);
	String contentType = "application/x-www-form-urlencoded";
	String postData = "deviceID=";
	postData += deviceID;
	postData += "&typer=";
	postData += typer;
	postData += "&loc=";
	postData += cellLocation;
	
	/*
	if ((typer==2)||(typer==3)||(typer==4)||(typer==5)) {
		Serial.println("Posting and/or updating data");
		postData += "&taskID=";
		postData += taskID;
	}
	
	if ((typer==5)||(typer==4)) {
		Serial.println("For Cancel/Timeout data");
		postData += "&EmpNo=";
		postData += EmpNo;
	}*/

	Serial.print("postData: ");
	Serial.println(postData);

	Serial.println();
	Serial.println("Start sending loop");
	
	
	
	while ( statusCode != 200) {
		
		Serial.print(".");
		//client.post("/android2/qcotasker.php", contentType, postData);
		client.post("/qcotasker.php", contentType, postData);
		// read the status code and body of the response
		statusCode = client.responseStatusCode();
		response = client.responseBody();
		Serial.print("Status code: ");
		Serial.println(statusCode);
		//200 = data sent successfully
		//-1 =
		//Response is the data the PHP server sends back
		Serial.print("Response: ");
		Serial.println(response);
		delay(100);
		//disconnect client
		client.stop();
	}
	//reset status code
	statusCode = 0;
	

    if ((typer==2)||(typer==3)||(typer==4)||(typer==5)||(typer==5)||(typer==7)||(typer==8)||(typer==9)||(typer==10)) {
		Serial.print("Update ");
		Serial.print(typer);
		Serial.print(" successful! ");
		Serial.println();

	}
  
	if ((response != "")&&(typer == 6)) {

		//crunch response to get data
		int firstCommaIndex = response.indexOf(',');
		int secondCommaIndex = response.indexOf(',', firstCommaIndex+1);
		cellLocation = response.substring(0, firstCommaIndex);

		Serial.print("cellLocation: ");
		Serial.println(cellLocation);
		
		Serial.println();
	}
	//Serial.println("End typePhp, Wait 2 seconds");
	//delay(2000);
}

void wifiConnect() {
	// Connect to WPA/WPA2 network:
	WiFi.begin(ssid, pass);
	int ResetCounter = 0;
	Serial.print("Attempting to connect to Network ");
	while ( WiFi.status() != WL_CONNECTED) {
		
		Serial.print(".");
		ResetCounter++;
		
		delay(300);
		if (ResetCounter >= 30) {
			Serial.print("ESP32 reset!");
			
			ClearLCD();
			WifiStrength ();
			lcd.setCursor(0,1);
			lcd.print("ESP32 reset!");
			ESP.restart();
		}
	}
}

void OffNeoPixel() {
	//set LED to off
		digitalWrite(LedLight, LOW);    // turn the LED off by making the voltage LOW
		delay(10);   
}

void OnNeoPixel () {
	//set LED to ON
		digitalWrite(LedLight, HIGH);    // turn the LED ON by making the voltage HIGH
		delay(10);   
}

int BlinkNeoPixel () {
	if (BlinkState == 0) {
		//set neopixel to red
		digitalWrite(LedLight, HIGH);   // turn the LED on (HIGH is the voltage level)
		delay(10); 
		BlinkState = 1;
	}
		else if (BlinkState == 1) {
		//set neopixel to 0
		OffNeoPixel();
		BlinkState = 0;
	}
	
}

void incButtonChange() {
	buttonState1 = 0;
}


int ClearLCD() {
	lcd.clear();
	lcd.setCursor(0,0);
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
	
	bars = 0;
	
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

	// prints WIFI / Battery on screen	
	lcd.setCursor(0,0);
	lcd.print("WiFi: ");
	lcd.setCursor(6,0);
	lcd.print(bars);
	lcd.setCursor(10,0);
	lcd.print("LC: ");
	lcd.setCursor(13,0);
	lcd.print(cellLocation);
}

void OptionOne() {
	/*
	Serial.println("Increment One output!");
	typePhp(7);
	*/
	Serial.println("Start QCO Layout bttn!");
	typePhp(9);
	
	delay(100);
	Serial.println("PHP query to Start QCO Layout");
	buzzerFunction(2);
	OnNeoPixel();
}

void OptionTwo() {
	Serial.println("Line End/Start!");
	
	if (loopState==1) {
		typePhp(3);
		loopState=0;
	} else {
		typePhp(2);
		loopState=1;
	}
	
	delay(100);
	Serial.println("PHP query for Line End/Start!");
	buzzerFunction(2);
	OnNeoPixel();
}

void OptionThree() {
	Serial.println("QCO end!");
	
	typePhp(10);
	
	/*
	ClearLCD();
	lcd.setCursor(0,0);
	lcd.print("QA Output : ");
	lcd.setCursor(0,1);
	
	int xx=0;
	
	//either input data from device or from kiosk
	while (xx==0) {
		QAcustomKey = customKeypad.getKey();
		if (QAcustomKey){
			QAData[input_count] = QAcustomKey; 
			Serial.print(QAcustomKey);
			lcd.setCursor(input_count,1); 
			lcd.print(QAData[input_count]); 
			input_count++;
			delay(50);
			
			if(!strcmp(QAData, "00")){
				//
				Serial.println("Cancel");
				xx=1;
			}
			
			if(input_count == QAInput_Length-1){
				xx=1;
			}
			
			Serial.print("Value:");
			Serial.println(QAData.toInt());
		}
		buttonState1 = 1;
	}
	*/
	//typePhp(4);
	
	delay(100);
	Serial.println("PHP query to add QCO setup end");
	buzzerFunction(2);
	OnNeoPixel();
}

void OptionFour() {
	Serial.println("PRD Box done!");
	
	typePhp(5);
	
	delay(100);
	Serial.println("PHP query to add PRD Box");
	buzzerFunction(2);
	OnNeoPixel();
}

void OptionFive() {
	Serial.println("Task Void!");
	
	typePhp(8);
	
	delayer(2);
	Serial.println("PHP query to void");
	buzzerFunction(2);
	OnNeoPixel();
	loopState=0;
}

void OptionSix() {
	Serial.println("QA Defect detected!");
	
	typePhp(9);
	
	delay(100);
	Serial.println("PHP query to add QA Defect");
	buzzerFunction(2);
	OnNeoPixel();
}

void print_wakeup_reason(){
  esp_deep_sleep_wakeup_cause_t wakeup_reason;

  wakeup_reason = esp_deep_sleep_get_wakeup_cause();

  switch(wakeup_reason) {
    case 1  : Serial.println("Wakeup caused by external signal using RTC_IO"); break;
    case 2  : Serial.println("Wakeup caused by external signal using RTC_CNTL"); break;
    case 3  : Serial.println("Wakeup caused by timer"); break;
    case 4  : Serial.println("Wakeup caused by touchpad"); break;
    case 5  : Serial.println("Wakeup caused by ULP program"); break;
    default : Serial.println("Wakeup was not caused by deep sleep"); break;
  }
}

void checkButtonContents() {
	//
	ClearLCD();
	lcd.setCursor(0,0);
	lcd.print("Input Choice: ");

	lcd.setCursor(0,1);
	int xx=0;
	while (xx==0) {
		customKey = customKeypad.getKey();
		if (customKey){
			Data[data_count] = customKey; 
			Serial.print(customKey);
			lcd.setCursor(data_count,1); 
			lcd.print(Data[data_count]); 
			delay(50);
			
			if(!strcmp(Data, "1")){
				//
				Serial.println("OptionOne - Start QCO layout");
				OptionOne();
				xx=1;
			}

			if(!strcmp(Data, "2")){
				//
				Serial.println("OptionTwos - Line End/Start");
				OptionTwo();
				TNLeaveLoop=2;
				xx=1;
			}
			
			if(!strcmp(Data, "3")){
				//
				Serial.println("OptionThree - QCO Setup END");
				OptionThree();
				xx=1;
			}
			
			if(!strcmp(Data, "4")){
				//
				Serial.println("OptionFour - box done");
				OptionFour();
				xx=1;
			}
			
			if(!strcmp(Data, "9")){
				//
				Serial.println("OptionFive - void");
				TNLeaveLoop=2;
				OptionFive();
				xx=1;
			}
			
			if(!strcmp(Data, "0")){
				//
				Serial.println("Cancel");
				xx=1;
			}
			//
			buttonState1 = 1;
		}
	}
}