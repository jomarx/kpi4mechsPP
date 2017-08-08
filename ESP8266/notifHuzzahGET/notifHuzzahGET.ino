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

//char serverAddress[] = "192.168.143.185";  // server address
char serverAddress[] = "10.37.10.149";  // server address
int port = 80;

WiFiClient wifi;
HttpClient client = HttpClient(wifi, serverAddress, port);
int status = WL_IDLE_STATUS;
String response;
int statusCode = 0;

//mechanic ID
//static NotifNo that will be default per device.
int mechanicID = 1;


void setup() {
	//watchdog timer
	//ESP.wdtDisable();
	
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
}

void loop() {
	ESP.wdtFeed();
	statusCode = 0;
	response = "";
	Serial.println("making POST request");
	String contentType = "application/x-www-form-urlencoded";
	String postData = "NotifNo=";
	postData += mechanicID;
	postData += "&typer=1";

	Serial.print("postData: ");
	Serial.println(postData);

	Serial.println();
	Serial.println("Start loop :");
	
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
		Serial.print("Response: ");
		Serial.println(response);
		delay(100);
		client.stop();
	}
  
  if (response != "") {
	  ESP.wdtFeed();
	  Serial.println();
	  Serial.println("not empty!");
	  Serial.println("Update 1 successful! ");
  
	  int firstCommaIndex = response.indexOf(',');
	  int secondCommaIndex = response.indexOf(',', firstCommaIndex+1);
	  String ID = response.substring(0, firstCommaIndex);
	  String location = response.substring(firstCommaIndex+1, secondCommaIndex);
	  String Status = response.substring(secondCommaIndex+1);

	  Serial.print("ID: ");
	  Serial.println(ID);
	  Serial.print("location: ");
	  Serial.println(location);
	  Serial.print("Status: ");
	  Serial.println(Status);
	  Serial.println();
	  ESP.wdtFeed();
	  client.stop();
  } else {
	  ESP.wdtFeed();
	  Serial.println("empty!");
	  Serial.println();
	  client.stop();
  
	Serial.println("Wait five seconds (from no response)");
	ESP.wdtFeed();
	delay(3000);
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
  }
  
	Serial.println("Wait five seconds");
	delay(5000);
	ESP.wdtFeed();
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
			ESP.restart();
		}
	}
}