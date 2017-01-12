#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>

SoftwareSerial rfidReader(D3,D4);
String tagString;
char tagNumber[14];
char realTagNum[12];
boolean receivedTag;

const char* ssid = "jomarAP-SP";
const char* password = "maquinay1";

//rfid tag
int validRFID = 7754087;

void setup() {
  delay(1000);
  pinMode(D1, OUTPUT);
  Serial.begin(9600);
  rfidReader.begin(9600); // the RDM6300 runs at 9600bps
  Serial.println("\n\n\nRFID Reader...ready!");
  
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");  
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  	  Serial.println(WiFi.status());
}

void loop(){
	
  receivedTag=false;

    Serial.println("Start loop");  
  
  if (rfidReader.available() > 0){
    Serial.println("Reading from RFID");
    int BytesRead = rfidReader.readBytesUntil(3, tagNumber, 15);//EOT (3) is the last character in tag 
    receivedTag=true;
    Serial.println("Got a tag");    
  }

  if (receivedTag){
    tagString=tagNumber;
    
    Serial.println();
    Serial.print("Tag Number: ");
    Serial.println(tagString);
    tagString.substring(3,11).toCharArray(realTagNum, sizeof(realTagNum));
    Serial.println(realTagNum);
    unsigned long result = hex2int(realTagNum, 8);
    
    Serial.println(result);
    
    if (validRFID == result) {
      Serial.println("RFID is allowed");
      digitalWrite(2, HIGH);   // turn the LED on by making the voltage HIGH
      delay(3000);             // wait for a second
      digitalWrite(2, LOW);    // turn the LED off by making the voltage LOW
    } else {
      Serial.println("RFID is not allowed");
    }
    
    memset(tagNumber,0,sizeof(tagNumber)); //erase tagNumber
    // this clears the rest of data on the serial, to prevent multiple scans
    while (Serial.read() >= 0) {
      Serial.flush(); // trying
    }
  }

  delay(500);
}

unsigned long hex2int(char *a, unsigned int len)
{
    int i;
    unsigned long val = 0;

    for(i=0;i<len;i++)
       if(a[i] <= 57)
         val += (a[i]-48)*(1<<(4*(len-1-i)));
       else
        val += (a[i]-55)*(1<<(4*(len-1-i)));

    return val;
}