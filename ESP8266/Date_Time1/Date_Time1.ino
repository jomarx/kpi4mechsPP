/*
 * Arduino 1.6.6
 * Sketch uses 237,464 bytes (45%) of program storage space. Maximum is 524,288 bytes.
 */


#include <ESP8266WiFi.h>
#include <Wire.h>


const char* ssid     = "Your WiFi SSID";
const char* password = "Your WiFi Password";
// const char* host = "utcnist2.colorado.edu";
const char* host = "128.138.141.172";

int ln = 0;
String TimeDate = "";


void setup() {
  // Serial.begin(115200);                   // diagnostic channel
  Serial.begin(74880);
  delay(10);

  // We start by connecting to a WiFi network

  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  // Set WiFi to station mode and disconnect from an AP if it was previously connected
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  WiFi.begin(ssid, password);
  delay(100);

  //Wire.pins(int sda, int scl), etc
  Wire.pins(0, 2);                        //on ESP-01.
  Wire.begin();
  StartUp_OLED();                         // Init Oled and fire up!
  Serial.println("OLED Init...");
  clear_display();                        // done here to simplify also setXY(0,0);
  sendStrXY(">>> Start-up <<<", 0, 0);
  Draw_WAVES();

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  clear_display(); 
  sendStrXY(">WiFi Connected<", 0, 0);

  // char wifiIP = WiFi.localIP();
  // char *P = &wifiIP;
  // sendStrXY(P, 1, 0);

  Serial.println("");
  Serial.println("WiFi connected");  
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

}

void loop() 
{
  Serial.print("connecting to ");
  Serial.println(host);

  // Use WiFiClient class to create TCP connections
  WiFiClient client;
  const int httpPort = 13;

  if (!client.connect(host, httpPort)) {
    Serial.println("connection failed");
    return;
  }

  sendStrXY(">Sending Header<", 1, 0);
  
  // This will send the request to the server
  client.print("HEAD / HTTP/1.1\r\nAccept: */*\r\nUser-Agent: Mozilla/4.0 (compatible; ESP8266 NodeMcu Lua;)\r\n\r\n");

  delay(100);

  // Read all the lines of the reply from server and print them to Serial
  // expected line is like : Date: Thu, 01 Jan 2015 22:00:14 GMT
  char buffer[12];
  String dateTime = "";
  sendStrXY(">  Listening...<", 2, 0);

  while(client.available())
  {
    String line = client.readStringUntil('\r');

    if (line.indexOf("Date") != -1)
    {
      Serial.print("=====>");
    } else
    {
      // Serial.print(line);
      // date starts at pos 7
      TimeDate = line.substring(7);
      Serial.println(TimeDate);
      // time starts at pos 14
      TimeDate = line.substring(7, 15);
      TimeDate.toCharArray(buffer, 10);
      sendStrXY("UTC Date/Time:", 4, 0);
      sendStrXY(buffer, 5, 0);
      TimeDate = line.substring(16, 24);
      TimeDate.toCharArray(buffer, 10);
      sendStrXY(buffer, 6, 0);
    }
  }

  Serial.println();
  Serial.println("closing connection");
  sendStrXY("Close connection", 2, 0);
  sendStrXY(">Waiting 60 Sec<", 1, 0);
  delay(10000);
  sendStrXY(">Waiting 50 Sec<", 1, 0);
  delay(10000);
  sendStrXY(">Waiting 40 Sec<", 1, 0);
  delay(10000);
  sendStrXY(">Waiting 30 Sec<", 1, 0);
  delay(10000);
  sendStrXY(">Waiting 20 Sec<", 1, 0);
  delay(10000);
  sendStrXY(">Waiting 10 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  9 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  8 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  7 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  6 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  5 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  4 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  3 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  2 Sec<", 1, 0);
  delay(1000);
  sendStrXY(">Waiting  1 Sec<", 1, 0);
  delay(1000);
  clear_display(); 
  sendStrXY(">WiFi Connected<", 0, 0);
}


