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
#include <ESP8266WiFi.h>
#include "config.h"
#include <Wire.h>

#include "SSD1306.h" 
// alias for `#include "SSD1306Wire.h"`
// Initialize the OLED display using brzo_i2c
// D3 -> SDA
// D5 -> SCL
SSD1306 display(0x3c, 4, 5);
// or
// SH1106Brzo  display(0x3c, D3, D5);


char serverAddress[] = "192.168.143.220";  // server address
//char serverAddress[] = "10.37.10.149";  // server address
int port = 80;

WiFiClient wifi;
HttpClient client = HttpClient(wifi, serverAddress, port);
int status = WL_IDLE_STATUS;
String response;
int statusCode = 0;

//mechanic ID
//static NotifNo that will be default per device.
int mechanicID = 5;

//buzzer
const int buzzer = 2;
const int buzzer2 = 15;

//button
const int startButton = 12;
const int cancelButton = 13;
const int LockButton = 14;

const int LedLight = 0;

int buttonState1 = 1;
int buttonState2 = 1;

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

void setup() {
	
	//watchdog timer
	//ESP.wdtDisable();

	WiFi.mode(WIFI_STA);

	buzzerFunction(3);

	Serial.begin(9600);
	wifiConnect();

	// print the SSID of the network you're attached to:
	Serial.print("SSID: ");
	Serial.println(WiFi.SSID());

	// print your WiFi shield's IP address:
	IPAddress ip = WiFi.localIP();
	Serial.print("IP Address: ");
	Serial.println(ip);
	ESP.wdtFeed();

	String wfms = WiFi.macAddress();
	Serial.print("MAC address : ");
	Serial.println(wfms);
	
	// Initialising the UI will init the display too.
	display.init();

	display.flipScreenVertically();
	display.setFont(ArialMT_Plain_16);

	pinMode(startButton, INPUT_PULLUP);
	pinMode(cancelButton, INPUT_PULLUP);
	
	pinMode(LedLight, OUTPUT);

	attachInterrupt(startButton, startButtonChange, CHANGE);
	attachInterrupt(cancelButton, cancelButtonChange, CHANGE);
	
	displayClear();

	WifiStrength ();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
	display.drawString(64, 22, "Mechanic ID :\n" + String(mechanicID));
	display.display();
	
	Serial.println("WiFi connected");
	Serial.println("IP address: ");
	Serial.println(WiFi.localIP());
	yield();
	delayer(3);

	displayClear();
	WifiStrength ();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
	display.drawString(64, 22, "WIFI: Connected" );
	display.print("\n");
	display.display();
	yield();

}

void loop() {
	
	Serial.println();
	Serial.println("Start Main loop");	
	
	//reset button values	
	buttonState1 = 1;
	buttonState2 = 1;
	
	delayer(2);
	displayClear();
	WifiStrength ();
	display.setTextAlignment(TEXT_ALIGN_CENTER);
	display.drawString(64, 22, "Getting Tasks\n");
	display.display();
	
	//getting tasks
	
	ESP.wdtFeed();
	int typer=1;
	statusCode = 0;
	response = "";
	Serial.println("making POST request");
	//String contentType = "application/x-www-form-urlencoded";
	String postData = "NotifNo=";
	postData += mechanicID;
	postData += "&typer=";
	postData += typer;

	Serial.print("postData: ");
	Serial.println(postData);

	Serial.println();
	Serial.println("Start sending loop");
	
	ESP.wdtFeed();
	
	while ( statusCode != 200) {
		ESP.wdtFeed();
		Serial.print(".");
		//client.post("/android2/querytask.php", contentType, postData);
		client.post("/querytask.php", contentType, postData);
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
	//reset status code
	statusCode = 0;
  
  if ((response != "")&&(typer == 1)) {
	  
		ESP.wdtFeed();
		Serial.println();
		Serial.println("not empty, means task available!");

		//crunch response to get data
		int firstCommaIndex = response.indexOf(',');
		int secondCommaIndex = response.indexOf(',', firstCommaIndex+1);
		int thirdCommaIndex = response.indexOf(',', secondCommaIndex+1);
		taskID = response.substring(0, firstCommaIndex);
		cellLocation = response.substring(firstCommaIndex+1, secondCommaIndex);
		Status = response.substring(secondCommaIndex+1, thirdCommaIndex);
		EmpNo = response.substring(thirdCommaIndex+1);

		Serial.print("ID: ");
		Serial.println(taskID);
		Serial.print("location: ");
		Serial.println(cellLocation);
		Serial.print("Status: ");
		Serial.println(Status);
		Serial.print("Assignee/EmpNo: ");
		Serial.println(EmpNo);
		Serial.println();
		ESP.wdtFeed();
		client.stop();

		//task found starting
	  
		int TNLeaveLoop = 0;
		int countToFifteen = 0;
		long countToFifteenAgain = 0;
		int countToMinute = 0;
		int MinLeft = 15;
		
		//set LED to ON
		digitalWrite(LedLight, HIGH);   // turn the LED on (HIGH is the voltage level)
		delay(10);

		displayClear();
		display.setTextAlignment(TEXT_ALIGN_LEFT);
		
		//get WIFI strength data
		WifiStrength ();
		
		display.drawString(0, 15, "Sew Line # " + String(cellLocation));
		display.drawString(0, 30, "ACK Time left :" + String(MinLeft));
		display.drawString(0, 45, "START         END");

		display.display();
		buzzerFunction(5);
		
		while (TNLeaveLoop < 1) {
			yield();
			//buttonState1 = digitalRead(startButton);
			//buttonState2 = digitalRead(cancelButton);
			
			if (countToSec > 15) {
				BlinkNeoPixel();
				countToSec = 0;
			}
				
			if (buttonState1 == LOW && buttonState2 == HIGH) {
				
				OnNeoPixel();
				
				displayClear();
				WifiStrength ();
				display.drawString(0, 15, "Sew Line # " + String(cellLocation));
				display.drawString(0, 30, "<Task Done>");
				display.display();
				//starting task on db
				Serial.println("Starting task, update DB");
				ElapsedTime=0;
				Serial.print("start task!!");
				Serial.println("PHP query to start task");
				yield();
				
				if (Status.toInt() != 2){
					Serial.println("update task normally");
					typePhp(2);
				} else {
					Serial.println("update task Mech Status Only");
					typePhp(6);
				}
				
				buzzerFunction(2);
				
				buttonState1 = HIGH; //reset button status
				
				Serial.print("starting loop to wait to finish task");
				for (int tempTimer = 0;tempTimer <= 3;tempTimer++)  {
					//buttonState1 = digitalRead(startButton);
					delay(200);
			
					if (buttonState1 == HIGH && buttonState2 == LOW){
						CancelTask();		
					}
			
					if (buttonState1 == HIGH){
						tempTimer = 0;
					}
					if (countToFifteenAgain > 4500){
						buzzerFunction(2);
						countToFifteenAgain = 0;
					}
			
					if (countToMinute > 300){
						buzzerFunction(1);
						countToMinute = 0;
						ElapsedTime=ElapsedTime+1;
						
						displayClear();
						
						//get WIFI strength data
						WifiStrength ();
						display.drawString(0, 15, "Elapsed Time: " + String(ElapsedTime) + "mins");
						display.drawString(0, 30, "Sew Line #: " + String(cellLocation));
						display.drawString(0, 45, "<Task Done>");
						display.display();
					
					}
			
					Serial.print("countToMinute : ");
					Serial.print(countToMinute);
					Serial.print("\n");
					Serial.print("countToFifteenAgain : ");
					Serial.print(countToFifteenAgain);
					Serial.print("\n");
					
					countToFifteenAgain++;
					countToMinute++;
				}
		
				Serial.print("done task!!");
				displayClear();
						
				WifiStrength ();
				display.setTextAlignment(TEXT_ALIGN_CENTER);
				
				display.drawString(64, 8, "Task Done\n Requesting new task \n");
				display.display();
				
				//query for end time
				typePhp(3);
				
				buzzerFunction(2);
				
				OnNeoPixel();
		
				ESP.restart();
				TNLeaveLoop = 2;
				buttonState2 == HIGH;
			}
			if (buttonState1 == HIGH && buttonState2 == LOW){
				CancelTask();		
			}
	
			yield();
			
			//jomar
			
			if (countToMinute > 1200 && TNLeaveLoop < 1){
				displayClear();

				display.setTextAlignment(TEXT_ALIGN_LEFT);
				//get WIFI strength data
				WifiStrength ();
				display.drawString(0, 15, "Sew Line # " + String(cellLocation));
				display.drawString(0, 30, "ACK Time left :" + String(MinLeft));
				display.drawString(0, 45, "START         END");
				display.display();
				MinLeft--;
				countToMinute = 0;
				//Serial.print("function to update DB, timeout");
				buzzerFunction(5);
			}
			
			if (countToFifteen > 18000 && TNLeaveLoop < 1){
				Serial.println("function to update DB, 15mins have past, auto assign");
		
				displayClear();
				WifiStrength ();
				display.setTextAlignment(TEXT_ALIGN_CENTER);
				display.drawString(64, 22, "No ACK!\nTransferring");
				display.display();
		
				//SQL start
				typePhp(4);
				
				buzzerFunction(4);
				TNLeaveLoop = 2;	
				cellLocation = "";
				taskID = "";
				delay(200);
				displayClear();
				OnNeoPixel();
			}

	
			Serial.print("countToFifteen: ");
			Serial.println(countToFifteen);
			countToFifteen++;
			countToMinute++;
			countToSec++;
			delay(50);
			yield();
		
		}
		
		Serial.println("out of loop");
		//displayClear();
			
		//reset button state
		buttonState1 = 1;
		buttonState2 = 1;

	  /*
	  Serial.println("Posting and updating data");
	  
	  postData = "NotifNo=";
	  postData += mechanicID;
	  postData += "&typer=2&taskID=";
	  //postData = "NotifNo=1&typer=2&taskID=";
	  postData += ID;
	  
	  Serial.print("postData: ");
	  Serial.println(postData);
	  
	  while ( statusCode != 200) {
		client.post("/android2/querytask.php", contentType, postData);
		// read the status code and body of the response
		statusCode = client.responseStatusCode();
		response = client.responseBody();
		Serial.print("Status code: ");
		Serial.println(statusCode);
		Serial.print("Response: ");
		Serial.println(response);
		delay(100);
	  }
	  Serial.println("Update 2 successful! ");
	  Serial.println();*/
	  
  } else {
	  	OnNeoPixel();
		displayClear();
		WifiStrength ();
		display.setTextAlignment(TEXT_ALIGN_CENTER);
		display.drawString(64, 22, "No task,\n sleeping for 1min");
		Serial.println("No task,\n sleeping for 1min");
		display.display();
		buzzerFunction(1);
		displayClear();
		yield();
		ESP.deepSleep(4000000*15);
		//sleep esp8266 for 1mins
		ESP.restart();
  }
  
	Serial.println("Wait five seconds");
	delay(5000);
	ESP.wdtFeed();
	
}

int typePhp (int typer){
	
	ESP.wdtFeed();
	statusCode = 0;
	response = "";
	Serial.println("making POST request");
	//String contentType = "application/x-www-form-urlencoded";
	String postData = "NotifNo=";
	postData += mechanicID;
	postData += "&typer=";
	postData += typer;
	
	if ((typer==2)||(typer==3)||(typer==4)||(typer==5)||(typer==6)) {
		Serial.println("Posting and updating data");
		postData += "&taskID=";
		postData += taskID;
	}
	
	if ((typer==5)||(typer==4)) {
		Serial.println("For Cancel/Timeout data");
		postData += "&EmpNo=";
		postData += EmpNo;
	}

	Serial.print("postData: ");
	Serial.println(postData);

	Serial.println();
	Serial.println("Start sending loop");
	
	ESP.wdtFeed();
	
	while ( statusCode != 200) {
		ESP.wdtFeed();
		Serial.print(".");
		//client.post("/android2/querytask.php", contentType, postData);
		client.post("/querytask.php", contentType, postData);
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
	//reset status code
	statusCode = 0;
	

    if ((typer==2)||(typer==3)||(typer==4)||(typer==5)||(typer==6)) {
		Serial.print("Update ");
		Serial.print(typer);
		Serial.print(" successful! ");
		Serial.println();
	}
  
	if ((response != "")&&(typer == 1)) {
	  
		ESP.wdtFeed();
		Serial.println();
		Serial.println("not empty, means task available!");

		//crunch response to get data
		int firstCommaIndex = response.indexOf(',');
		int secondCommaIndex = response.indexOf(',', firstCommaIndex+1);
		String taskID = response.substring(0, firstCommaIndex);
		String cellLocation = response.substring(firstCommaIndex+1, secondCommaIndex);
		String Status = response.substring(secondCommaIndex+1);

		Serial.print("ID: ");
		Serial.println(taskID);
		Serial.print("location: ");
		Serial.println(cellLocation);
		Serial.print("Status: ");
		Serial.println(Status);
		Serial.println();
		ESP.wdtFeed();
		client.stop();

		  
	Serial.println("Wait five seconds");
	delay(5000);
	ESP.wdtFeed();
	}
}

void wifiConnect () {
	// Connect to WPA/WPA2 network:
	WiFi.begin(ssid, pass);
	int ResetCounter = 0;
	Serial.print("Attempting to connect to Network ");
	while ( WiFi.status() != WL_CONNECTED) {
		ESP.wdtFeed();
		Serial.print(".");
		ResetCounter++;
		yield();
		delay(300);
		if (ResetCounter >= 30) {
			Serial.print("ESP8266 reset!");
			
			display.init();

			display.flipScreenVertically();
			display.setFont(ArialMT_Plain_16);
			
			displayClear();
			WifiStrength ();
			display.setTextAlignment(TEXT_ALIGN_CENTER);
			display.drawString(64, 22, "ESP8266 reset!");
			display.display();
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

void startButtonChange() {
	
	buttonState1 = 0;
	
}

void cancelButtonChange() {
	
	buttonState2 = 0;
	
}

int displayClear() {
display.clear();
display.setTextAlignment(TEXT_ALIGN_LEFT);
display.display();
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
		
	// read the battery level from the ESP8266 analog in pin.
	// analog read level is 10 bit 0-1023 (0V-1V).
	// our 1M & 220K voltage divider takes the max
	// lipo value of 4.2V and drops it to 0.758V max.
	// this means our min analog read value should be 580 (3.14V)
	// and the max analog read value should be 774 (4.2V).
	int level = analogRead(A0);
	Serial.print("A0 level: ");
	Serial.print(level);

	// convert battery level to percent
	level = map(level, 580, 774, 0, 100);
	Serial.print("Battery level: "); Serial.print(level); Serial.println("%");
	// prints WIFI / Battery on screen	
	display.setTextAlignment(TEXT_ALIGN_LEFT);
	display.drawStringMaxWidth(0, 0, 128, "WiFi:" + String(bars) + " BT:" + String(level));
	display.display();	
}

void CancelTask() {
	
	yield();
	Serial.println("Checking if I can cancel task");
	
	if (cellLocation != "") {
		displayClear();
		WifiStrength ();
		display.setTextAlignment(TEXT_ALIGN_CENTER);
		display.drawString(64, 18, "Task cancelled!\nReassigning");
		display.display();
		
		typePhp(5);
		
		delay(100);
		Serial.println("PHP query to cancel task");
			
		Serial.print("cancel!! \n");
		Serial.print("task should auto assign. \n");
		buzzerFunction(4);
		OnNeoPixel();
		ESP.restart();
	}
}
