/*
For Elecrow i2c LCD :
https://github.com/esp8266/Arduino/issues/2366
https://www.elecrow.com/wiki/index.php?title=Crowtail-_I2C_LCD

*/

#include <ArduinoHttpClient.h>
#include <ESP8266WiFi.h>
#include <Wire.h> 
//#include <LiquidCrystal_I2C.h>
#include "LiquidCrystal.h"

//SQL read
#include <WiFiClient.h>
#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

//rfidReader
#include <SPI.h>
#include <MFRC522.h>

//IPAddress server_addr(192,168,143,200); // Piplay
IPAddress server_addr(192,168,143,220); // IP of the MySQL server here
char user[] = "nodemcu1"; // MySQL user login username
char spassword[] = "secret"; // MySQL user login password

char serverAddress[] = "192.168.143.220";  // server address
//char serverAddress[] = "10.37.10.149";  // server address
int port = 80;

// Sample query
char INSERT_SQL[] = "INSERT INTO kpi_mech.rfid_db (col1, col2, col3, col4) VALUES (%d, %d, %d, %d);";
char QUERY_SMID[] = "SELECT SpecialSerial, RFID FROM kpi_mech.sm_db WHERE RFID = %lu; ";
char QUERY_EMPID[] = "SELECT EmpNo, location FROM kpi_mech.user_db WHERE rfid = %lu; ";
char QUERY_INSERT[] = "INSERT INTO kpi_mech.task_db (EmpNo, Status, details, location, Assignee, StartDate, BreakStartTime) values (%d, 0, %d, %d, 0, (now()),(Curtime()));";
char QUERY_FNDTASK[] = "SELECT ID, SpecialSerial FROM kpi_mech.task_db WHERE Status = %d limit 1; ";
char QUERY_FNDCTASK[] = "SELECT mech FROM kpi_mech.cancel_db WHERE taskID = %d; ";
char QUERY_FNDTTASK[] = "SELECT mech FROM kpi_mech.timeout_db WHERE taskID = %d; ";
char QUERY_FINDMECH[] = "SELECT empID, NotifNo FROM kpi_mech.mech_db WHERE status = %d limit 1 ; ";
char QUERY_FINDCMECH[] = "SELECT empID, NotifNo FROM kpi_mech.mech_db WHERE status = 0 AND empID != %d limit 1 ; ";
char QUERY_UPDATEMECH[] = "UPDATE kpi_mech.mech_db SET status = 1 WHERE empID = %d; ";
char QUERY_UPDATETASK[] = "UPDATE kpi_mech.task_db SET location = 1, Status = 1, NotifNo = %d, Assignee = %d WHERE ID = %d; ";
char QUERY_UPDATETASK1[] = "UPDATE kpi_mech.task_db SET location = 1, Status = 1, NotifNo = %d, Assignee = %d WHERE ID = %d; insert into kpi_mech.mbreak_db (SpecialSerial, StartDate, TaskID) values (%d, (now()), %d);";
char QUERY_MECHSTART[] = "insert into kpi_mech.mstat_db (empID, StartDate, Status) values (%d, (now()), 1); UPDATE kpi_mech.mech_db SET att_stat = 1 WHERE empID = %d;";
char QUERY_MECHEND[] = "UPDATE kpi_mech.mstat_db SET EndDate = (now()), status = 2 WHERE empID = %d, status = 1; UPDATE kpi_mech.mech_db SET att_stat = 0 WHERE empID = %d;";
char QUERY_MECHBSTART[] = "insert into kpi_mech.mstat_db (empID, StartDate, Status) values (%d, (now()), 3); UPDATE kpi_mech.mech_db SET att_stat = 0 WHERE empID = %d;";
char QUERY_MECHBEND[] = "UPDATE kpi_mech.mstat_db SET EndDate = (now()), status = 2 WHERE empID = %d, status = 3; UPDATE kpi_mech.mech_db SET att_stat = 1 WHERE empID = %d;";
char QUERY_FNDMECHEMPID[] = "SELECT SpecialSerial FROM kpi_mech.mech_db WHERE SpecialSerial = %lu;";
char SELECTID_SQL[] = "SELECT empID FROM kpi_mech.rfid_db WHERE col1 = %lu AND col2 = %lu AND col3 = %lu AND col4 = %lu;";
char SELECTSS_SQL[] = "SELECT SpecialSerial FROM kpi_mech.rfid_db WHERE col1 = %lu AND col2 = %lu AND col3 = %lu AND col4 = %lu;";
char query[256];

WiFiClient wifi;
WiFiClient client;
MySQL_Connection conn((Client *)&client);
HttpClient client1 = HttpClient(wifi, serverAddress, port);

//LCD
//LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal lcd(0);


String tagString;
char tagNumber[14];
char realTagNum[12];

//const char* ssid = "jomarAP-SP";
//const char* wpassword = "maquinay1";

const char* ssid = "kpi4mech";
const char* wpassword = "kpi4mech1";

//buzzer
const int buzzer = 0;

//button
const int startButton = 16;
//const int cancelButton = 7;
int buttonState1 = 1;
int buttonState2 = 1;

//mbdc Machine Break Down Code
int mbdc = 0;
int EmpCd = 0;

//Attendance code
int AttCode = 0;

//potentiometer selector
int potPin = A0;
int potVal = 0;       // variable to store the potValue coming from the sensor

//int count check for auto assign
int countToTwo = 0;

//ESP reset timeout
int countToloop = 0;

//selector assign
int AssignSelect = 0;

//2nd Function Enable/disable
//1 = enabled
//2 = disabled
int AssignFunction = 1;

//shorter delay to get to assign function
int AttFunction = 1;
//const int AttFunctionButton = D5;

//2nd Function Enable/disable
//1 = enabled
//2 = disabled
int RFIDFunction = 1;

//SpecialSerial
int SpecialSerial = 0;

//to get out of Machine RFID check loop
int SmRfidDone = 0;

//result temp
unsigned long result = 0;

int BytesRead = 0;

int NotifNo = 0;

int taskID1 = 0;
int mechID = 0;
int CmechID = 0;
int TmechID = 0;

byte storedCard[4];		// Stores an ID read from EEPROM
byte readCard[4];		// Stores scanned ID read from RFID Module
byte lastReadCard[4];		// Stores last scanned ID read from RFID Module
byte masterCard[4];		// Stores master card's ID read from EEPROM
byte EprmDaw[16];

int successRead;		// Variable integer to keep if we have Successful Read from Reader

boolean match = false;   // initialize card match to false

#define RST_PIN 2  //5 RST-PIN für RC522 - RFID - SPI - Modul GPIO5 
#define SS_PIN 15  //4 SDA-PIN für RC522 - RFID - SPI - Modul GPIO4 
MFRC522 mfrc522(SS_PIN, RST_PIN); // Create MFRC522 instance

String contentType = "application/x-www-form-urlencoded";
String taskID = "";
String cellLocation = "";
String Status = "";
String EmpNo = "";
String response;
int mechanicID = 1;
int statusCode;




void setup() {
	
	WiFi.mode(WIFI_STA);

  delay(1000);
  //pinMode(D1, OUTPUT);
  Serial.begin(9600);

	//RFID start
    SPI.begin();           // Init SPI bus
	mfrc522.PCD_Init();    // Init MFRC522
  
  // We start by connecting to a WiFi network
  Serial.println();

  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, wpassword);

  int ResetCounter = 0;
	while (WiFi.status() != WL_CONNECTED) {
		delay(500);
		Serial.print(".");
		Serial.print(ResetCounter);
		ResetCounter++;
		if (ResetCounter >= 30) {
			Serial.print("\n");
			Serial.print("ESP8266 reset!");
			ESP.restart();
		}
	}

  //LCD init
  //lcd.init();                      // initialize the lcd 
  lcd.begin(16, 2); //crowtail LCD
  
  // Print a message to the LCD.
  //lcd.backlight();
  lcd.setBacklight(HIGH); //crowtail LCD
  lcd.setCursor(0,0);
  lcd.print("KPI 4 Sewers");
  //lcd.print("Report Problem");
  lcd.setCursor(0,1);
  lcd.print(" by JM");
  delay(3000);
  buzzerFunction(3);

	pinMode(startButton, INPUT_PULLUP);
	//pinMode(AttFunctionButton, INPUT); //to change
		
	//attachInterrupt(startButton, startButtonChange, CHANGE);
	//attachInterrupt(cancelButton, cancelButtonChange, CHANGE);

  Serial.println("");
  Serial.println("WiFi connected");  
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  ClearLCD();
  lcd.setCursor(0,0);
  lcd.print("WiFi connected");
  lcd.setCursor(0,1);
  lcd.print(WiFi.localIP());
  delay(1000);
  
  Serial.println("DB - Connecting...");
  
  ResetCounter = 0;
while (conn.connect(server_addr, 3306, user, spassword) != true) {
	delay(800);
    Serial.print( "." );
    Serial.print(ResetCounter);
    ResetCounter++;
    if (ResetCounter >= 60) {
		Serial.print("ESP8266 reset!");
		ESP.restart();
		}
    }
  
  ClearLCD();
  lcd.setCursor(0,0);
  lcd.print("SQL connected");
  delay(1000);
	

}

void loop(){

	//reset button state
	buttonState1 = 1;

  int TNLeaveLoop = 0;
  int countToFive = 0;
  int tempTimer = 0;
  int cellLocation = 0;

	delay (500);
    Serial.print("Start loop / "); 
	Serial.print(countToTwo); 
	Serial.print(" / ");
	Serial.print(countToloop); 
	Serial.print(" \n ");

	potVal = analogRead(potPin);    // read the potValue from the sensor
	Serial.print("Selector Value : ");
	Serial.println(potVal);
	
	if (potVal > 400 && potVal < 999) {
		AttFunction1();
		}
	
	//Reading from RFID
	
	ClearLCD();
	lcd.print("Please Scan ID");
	
do {
	successRead = getID(1); 	// sets successRead to 1 when we get read from reader otherwise 0
	delay(10);
	yield();
} while (!successRead); 	//the program will not go further while you not get a successful read

EmpCd = successRead;
//LCD
ClearLCD();
lcd.print("User RFID allowed");
delay(3000);

ClearLCD();
lcd.setCursor(0,0);
lcd.print("USR:");
lcd.print(EmpCd);
lcd.setCursor(0,1);
lcd.print("Scan Task ID");
Serial.println("Select Error ID");
delay(3000);

/* machine ID scan code, temporily disabled
ClearLCD();
lcd.print("Scan Machine ID");
Serial.println("Scan Machine ID");
delay(500);
buzzerFunction(1);
do {
	successRead = getID(2); 	// sets successRead to 1 when we get read from reader otherwise 0
	delay(10);
	yield();
} while (!successRead); 	//the program will not go further while you not get a successful read

cellLocation = successRead;

Serial.println("Machine ID OK");

Serial.print("value of RFID = ");
Serial.println(cellLocation);
buzzerFunction(1);
*/

buzzerFunction(1);
do {
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
	
	
	
	while ( statusCode != 200) {
		
		Serial.print(".");
		//client.post("/android2/querytask.php", contentType, postData);
		client1.post("/k4squerytask.php", contentType, postData);
		// read the status code and body of the response
		statusCode = client1.responseStatusCode();
		response = client1.responseBody();
		Serial.print("Status code: ");
		Serial.println(statusCode);
		//200 = data sent successfully
		//-1 =
		//Response is the data the PHP server sents back
		Serial.print("Response: ");
		Serial.println(response);
		delay(100);
		//disconnect client
		client1.stop();
	}
	//reset status code
	statusCode = 0;
	//
	
} while (buttonState1 == HIGH);  


delay(100);
Serial.print(countToFive);
countToFive++;

  delay(400);
  
  
	countToTwo++;
	
	delay(100);
		
	countToloop++;
	yield();
	Serial.print("End loop");
  
} // end main loop

void ClearLCD() {
	lcd.clear();
	lcd.setCursor(0,0);
}

int buzzerFunction(int counter){
  for (int buzzerTimer = 1; buzzerTimer <= counter; buzzerTimer++){
  tone(buzzer, 5000); // Send 5KHz sound signal...
  delay(100);        // ...for .1 sec
  noTone(buzzer);     // Stop sound...
  delay(100);        // ...for .1sec
  }
}

int SQLserverConnect() {
	int ResetCounter = 0;
while (conn.connect(server_addr, 3306, user, spassword) != true) {
	delay(800);
    Serial.print( "." );
    Serial.print(ResetCounter);
    ResetCounter++;
	
    }
	Serial.println( "connected again!" );
}

// Helper routine to dump a byte array as hex values to Serial
void dump_byte_array(byte *buffer, byte bufferSize) {
  for (byte i = 0; i < bufferSize; i++) {
    Serial.print(buffer[i] < 0x10 ? " 0" : " ");
    Serial.print(buffer[i], HEX);
  }
}

///////////////////////////////////////// Get PICC's UID ///////////////////////////////////
int getID( int number) {
  // Getting ready for Reading PICCs
  if ( ! mfrc522.PICC_IsNewCardPresent()) { //If a new PICC placed to RFID reader continue
    delay(10);
	yield();
	return 0;
  }
  if ( ! mfrc522.PICC_ReadCardSerial()) {   //Since a PICC placed get Serial and continue
    delay(10);
	yield();
	return 0;
  }
  // There are Mifare PICCs which have 4 byte or 7 byte UID care if you use 7 byte PICC
  // I think we should assume every PICC as they have 4 byte UID
  // Until we support 7 byte PICCs
  Serial.println(F("Scanned PICC's UID:"));
	ClearLCD();
	buzzerFunction(1);
	lcd.print("RFID found");
	lcd.setCursor(0,1);
	lcd.print("Checking AUTH");
  for (int i = 0; i < 4; i++) {  //
	lastReadCard[i] = readCard[i];
    readCard[i] = mfrc522.uid.uidByte[i];
    Serial.print(readCard[i], HEX);
  }
  Serial.println("");
  Serial.print("modified : ");
  dump_byte_array(mfrc522.uid.uidByte, mfrc522.uid.size);
  Serial.println("");
  SQLserverConnect();
  
  
	Serial.println("GET CARDS FROM SQL from stored RFID lists");
	delay(100);
	int rowss = 0;
	MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	if (number == 1) { //1 = select empID, 2 = select SpecialSerial
		sprintf(query, SELECTID_SQL, readCard[0], readCard[1], readCard[2], readCard[3] );
	} else if (number == 2) {
		sprintf(query, SELECTSS_SQL, readCard[0], readCard[1], readCard[2], readCard[3] );
	}
		
	cur_mem->execute(query);
	Serial.println(query);
	
	column_names *cols = cur_mem->get_columns();
	/*
	  for (int f = 0; f < cols->num_fields; f++) {
    Serial.print(cols->fields[f]->name);
    if (f < cols->num_fields-1) {
      Serial.print(',');
    }
  }*/
	
	row_values *row = NULL;
	delay(100);
	byte transferCard[4];		// Stores an ID read from SQL
	int tester = 0;
	Serial.println("CARDS read FROM SQL ");
	
	do {
		row = cur_mem->get_next_row();
		if (row != NULL) {
			Serial.println("Card found!!");
			tester = 1;
			int EmpCd = atol(row->values[0]);
			Serial.print("value of EmpID/SpecialSerial = ");
			Serial.print(EmpCd);
			return EmpCd; //returns value of EmpCd if card is found
			} else {
					if (tester == 0) {
						Serial.println("Card not found!!");
						ClearLCD();
						lcd.print("Card not found");
						lcd.setCursor(0,1);
						lcd.print("Scan another card");
						yield();
						delay(1000);
						return 0; // returns value of 1 if card not found
					}
				}
		} while (row != NULL);
  delete cur_mem;
  delete query;
    conn.close();
	Serial.println(F("SQL disconnected"));
  mfrc522.PICC_HaltA(); // Stop reading
  
}


//////////////////////////////////////// Read an ID from EEPROM //////////////////////////////
void readID( int number ) {
  int start = (number * 4 ) + 2; 		// Figure out starting position
  for ( int i = 0; i < 4; i++ ) { 		// Loop 4 times to get the 4 Bytes
    storedCard[i] = EprmDaw[start + i]; 	// Assign values read from EEPROM to array
  }
}

///////////////////////////////////////// Add ID to EEPROM   ///////////////////////////////////
void writeID( byte a[] ) {
  if ( !findID( a ) ) { 		// Before we write to the EEPROM, check to see if we have seen this card before!
    int col[3];
	int num = EprmDaw[0]; 		// Get the numer of used spaces, position 0 stores the number of ID cards
    int start = ( num * 4 ) + 6; 	// Figure out where the next slot starts
    num++; 								// Increment the counter by one
    EprmDaw[0] = num; 		// Write the new count to the counter
    for ( int j = 0; j < 4; j++ ) { 	// Loop 4 times
      EprmDaw[start + j] = a[j]; 	// Write the array values to EEPROM in the right position
	  col[j] = a[j];
	  Serial.println(col[j]);
    }
    
	// Initiate the query class instance
	MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	sprintf(query, INSERT_SQL, col[0],col[1],col[2],col[3]);
	// Execute the query
	cur_mem->execute(query);
	// Note: since there are no results, we do not need to read any data
	// Deleting the cursor also frees up memory used
	delete cur_mem;
	conn.close();
	Serial.println(F("SQL disconnected"));
    Serial.println(F("Succesfully added ID record to SQL"));
	
	
  }
  else {
    
    Serial.println(F("Failed! There is something wrong with ID or bad EEPROM"));
  }
}

///////////////////////////////////////// Check Bytes   ///////////////////////////////////
boolean checkTwo ( byte a[], byte b[] ) {
  if ( a[0] != NULL ) 			// Make sure there is something in the array first
    match = true; 			// Assume they match at first
  for ( int k = 0; k < 4; k++ ) { 	// Loop 4 times
    if ( a[k] != b[k] ) 		// IF a != b then set match = false, one fails, all fail
      match = false;
  }
  if ( match ) { 			// Check to see if if match is still true
    return true; 			// Return true
  }
  else  {
    return false; 			// Return false
  }
}

///////////////////////////////////////// Find Slot   ///////////////////////////////////
int findIDSLOT( byte find[] ) {
  int count = EprmDaw[0]; 			// Read the first Byte of EEPROM that
  for ( int i = 1; i <= count; i++ ) { 		// Loop once for each EEPROM entry
    readID(i); 								// Read an ID from EEPROM, it is stored in storedCard[4]
    if ( checkTwo( find, storedCard ) ) { 	// Check to see if the storedCard read from EEPROM
      // is the same as the find[] ID card passed
      return i; 				// The slot number of the card
      break; 					// Stop looking we found it
    }
  }
}

///////////////////////////////////////// Find ID From EEPROM   ///////////////////////////////////
boolean findID( byte find[] ) {
  int count = EprmDaw[0];			// Read the first Byte of EEPROM that
  for ( int i = 1; i <= count; i++ ) {  	// Loop once for each EEPROM entry
    readID(i); 					// Read an ID from EEPROM, it is stored in storedCard[4]
    if ( checkTwo( find, storedCard ) ) {  	// Check to see if the storedCard read from EEPROM
      return true;
      break; 	// Stop looking we found it
    }
    else {  	// If not, return false
    }
  }
  return false;
}

void ShowReaderDetails() {
  // Get the MFRC522 software version
  byte v = mfrc522.PCD_ReadRegister(mfrc522.VersionReg);
  Serial.print(F("MFRC522 Software Version: 0x"));
  Serial.print(v, HEX);
  if (v == 0x91)
    Serial.print(F(" = v1.0"));
  else if (v == 0x92)
    Serial.print(F(" = v2.0"));
  else
    Serial.print(F(" (unknown),probably a chinese clone?"));
  Serial.println("");
  // When 0x00 or 0xFF is returned, communication probably failed
  if ((v == 0x00) || (v == 0xFF)) {
    Serial.println(F("WARNING: Communication failure, is the MFRC522 properly connected?"));
    Serial.println(F("SYSTEM HALTED: Check connections."));
    while (true); // do not go further
  }
}

////////////////////// Check readCard IF is masterCard   ///////////////////////////////////
// Check to see if the ID passed is the master programing card
boolean isMaster( byte test[] ) {
  if ( checkTwo( test, masterCard ) )
    return true;
  else
    return false;
}


int AttFunction1 () {

	Serial.print("Attendance mode ");
	buzzerFunction(2);
	ClearLCD();
	lcd.print("Attendance mode");
	lcd.setCursor(0,1);
	lcd.print("Scan ID :");
	delay(5000);

	do {
		successRead = getID(1); 	// sets successRead to 1 when we get read from reader otherwise 0
		delay(10);
		yield();
	} while (!successRead); 	//the program will not go further while you not get a successful read

	EmpCd = successRead;
	//LCD
	ClearLCD();
	lcd.print("User RFID allowed");
	delay(3000);
	
	buttonState1 = 1;
		
	do {
			yield();
			ClearLCD();
			lcd.print("In/Out|Break S/E");
			lcd.setCursor(0,1);
			potVal = analogRead(potPin);    // read the potValue from the sensor
			if (potVal > 1 && potVal < 199) {AttCode=0; lcd.print("Time In");}
			else if (potVal > 200 && potVal < 299) {AttCode=1; lcd.print("Time Out");}
			else if (potVal > 300 && potVal < 399) {AttCode=2; lcd.print("Break Start");}
			else if (potVal > 400 && potVal < 999) {AttCode=3; lcd.print("Break End");}
			buttonState1 = digitalRead(startButton);    // read the potValue from the sensor
			delay(100);
	
	} while (buttonState1 == HIGH); 
	
	AttendanceCode(AttCode);
	
	/*
	//time in function
	if (AttendanceCode == 0) {
		
		ClearLCD();
		lcd.print("Logging IN");
	
		Serial.print("Start log In");
		//SQL start
		//row_values *row = NULL;
		SQLserverConnect();
		//char taskID
		delay(500);
		Serial.println("SQL query sending attendance IN");
		// Initiate the query class instance
		MySQL_Cursor *cur_mem62 = new MySQL_Cursor(&conn);
		sprintf(query, QUERY_MECHSTART, EmpCd, EmpCd);
		// Execute the query
		cur_mem62->execute(query);
		Serial.print("value of char = ");
		Serial.println(query);
		delay(500);
		//delete cur_mem;
		conn.close();
		// SQL end


	lcd.setCursor(0,1);
	lcd.print("Thank you!");
	}

if (AttCode == 1) {
	
	ClearLCD();
	lcd.print("Logging OFF");

	Serial.print("Start log Off");
	//SQL start
	//row_values *row = NULL;
	SQLserverConnect();
	//char taskID
	delay(500);
	Serial.println("SQL query sending attendance OFF");
	// Initiate the query class instance
	MySQL_Cursor *cur_mem62 = new MySQL_Cursor(&conn);
	sprintf(query, QUERY_MECHEND, EmpCd, EmpCd);
	// Execute the query
	cur_mem62->execute(query);
	Serial.print("value of char = ");
	Serial.println(query);
	delay(500);
	//delete cur_mem;
	conn.close();
	// SQL end

	lcd.setCursor(0,1);
	lcd.print("Thank you!");
}

//break start function

//break end function
*/
}

///////////////////////////////////////// update attendance / break status ///////////////////////////////////
int AttendanceCode( int number) {
	
	ClearLCD();
	yield();
	MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	
	if (number == 0){
		lcd.print("Logging IN");
		sprintf(query, QUERY_MECHSTART, EmpCd, EmpCd);
		Serial.print("Excecute Logging IN");
	}
	else if (number == 1) {
		lcd.print("Logging OFF");
		sprintf(query, QUERY_MECHEND, EmpCd, EmpCd);
		Serial.print("Excecute Logging OFF");
	}
	else if (number == 2) {
		lcd.print("Break START");
		sprintf(query, QUERY_MECHBSTART, EmpCd, EmpCd);
		Serial.print("Excecute Break START");
	}
	else if (number == 3) {
		lcd.print("Break END");
		sprintf(query, QUERY_MECHBEND, EmpCd, EmpCd);
		Serial.print("Excecute Break END");
	}
	
	cur_mem->execute(query);
	Serial.println(query);
	//column_names *cols = cur_mem->get_columns();
	
	lcd.setCursor(0,1);
	lcd.print("Thank you!");
	
	delete cur_mem;
	conn.close();
	
	Serial.println(F("SQL disconnected"));
    Serial.println(F("Succesfully added/updated attendance/break record to SQL"));
	ESP.restart();
}