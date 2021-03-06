/*
char bug,

https://www.arduino.cc/en/Reference/String
http://www.nongnu.org/avr-libc/user-manual/group__avr__string.html
https://forum.arduino.cc/index.php?topic=405786.0
*/

#include <ESP8266WiFi.h>
#include <SPI.h>
#include <MFRC522.h>

/* wiring the MFRC522 to ESP8266 (ESP-12)
RST     = GPIO5
SDA(SS) = GPIO4
MOSI    = GPIO13
MISO    = GPIO12
SCK     = GPIO14
GND     = GND
3.3V    = 3.3V
*/

#include <Wire.h>  // This library is already built in to the Arduino IDE
#include <LiquidCrystal_I2C.h> //This library you can add via Include Library > Manage Library > 
LiquidCrystal_I2C lcd(0x27, 16, 2);
 
byte storedCard[4];		// Stores an ID read from EEPROM
byte readCard[4];		// Stores scanned ID read from RFID Module
byte lastReadCard[4];		// Stores last scanned ID read from RFID Module
byte masterCard[4];		// Stores master card's ID read from EEPROM
byte EprmDaw[16];

int successRead;		// Variable integer to keep if we have Successful Read from Reader

boolean match = false;          // initialize card match to false
boolean programMode = false;	// initialize programming mode to false

#define RST_PIN 2  //5 RST-PIN für RC522 - RFID - SPI - Modul GPIO5 
#define SS_PIN 15  //4 SDA-PIN für RC522 - RFID - SPI - Modul GPIO4 

//const char *ssid =  "jomarAP-SP";     // change according to your Network - cannot be longer than 32 characters!
//const char *pass =  "maquinay1"; // change according to your Network

const char *ssid =  "outsourcing1.25";     // change according to your Network - cannot be longer than 32 characters!
const char *pass =  "dbafe54321!"; // change according to your Network

MFRC522 mfrc522(SS_PIN, RST_PIN); // Create MFRC522 instance

//SQL
#include <WiFiClient.h>

#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

//IPAddress server_addr(192,168,42,146); // IP of the MySQL server here
IPAddress server_addr(192,168,143,220); // IP of the MySQL server here
char user[] = "nodemcu1"; // MySQL user login username
char password[] = "secret"; // MySQL user login password
// Sample query
char INSERT_SQL[] = "INSERT INTO kpi_mech.rfid_db (col1, col2, col3, col4) VALUES (%d, %d, %d, %d);";
char SELECT_SQL[] = "SELECT col1, col2, col3, col4 FROM kpi_mech.rfid_db;";
char SELECTID_SQL[] = "SELECT empID FROM kpi_mech.rfid_db WHERE col1 = %d AND col2 = %d AND col3 = %d AND col4 = %d;";
//char SELECTID_SQL[] = "SELECT empID FROM kpi_mech.rfid_db WHERE col1 = 210;";

char query[256];

WiFiClient client;

MySQL_Connection conn((Client *)&client);


void setup() {
	
	WiFi.mode(WIFI_STA);
	
  Serial.begin(9600);    // Initialize serial communications
  delay(250);
  Serial.println(F("Booting...."));
  
  SPI.begin();           // Init SPI bus
  mfrc522.PCD_Init();    // Init MFRC522
  
  WiFi.begin(ssid, pass);
  
  int retries = 0;
  while ((WiFi.status() != WL_CONNECTED) && (retries < 10)) {
    retries++;
    delay(500);
    Serial.print(".");
  }
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println(F("WiFi connected"));
  }
	Serial.println(F("Connecting to SQL"));
    while (conn.connect(server_addr, 3306, user, password) != true) {
	delay(500);
	Serial.print ( "." );
	}
  
  Serial.println(F("Ready!"));
  Serial.println(F("======================================================")); 
  Serial.println(F("Scan for Card and print UID:"));
  
  lcd.init();   // initializing the LCD
  lcd.backlight(); // Enable or Turn On the backlight 
  lcd.setCursor(0, 1);
  lcd.print("16x2 LCD TEST"); // Start Print text to Line 1
  lcd.setCursor(0, 2);      
  lcd.print("143 Time"); // Start Print Test to Line 2
  
  ShowReaderDetails();	// Show details of PCD - MFRC522 Card Reader details
  
  /*
  if (EprmDaw[1] != 143) {
    Serial.println(F("No Master Card Defined"));
    Serial.println(F("Scan A PICC to Define as Master Card"));
    do {
      successRead = getID();            // sets successRead to 1 when we get read from reader otherwise 0
      delay(200);
    }
    while (!successRead);                  // Program will not go further while you not get a successful read
    for ( int j = 0; j < 4; j++ ) {        // Loop 4 times
      EprmDaw[ 2 + j] = readCard[j];  // Write scanned PICC's UID to EEPROM, start from address 3
    }
    EprmDaw[1] = 143;                  // Write to EEPROM we defined Master Card.
    Serial.println(F("Master Card Defined"));
  }
  Serial.println(F("-------------------"));
  Serial.println(F("Master Card's UID"));
  for ( int i = 0; i < 4; i++ ) {          // Read Master Card's UID from EEPROM
    masterCard[i] = EprmDaw[2 + i];    // Write it to masterCard
    Serial.print(masterCard[i], HEX);
  }
  */
  Serial.println("");
  Serial.println(F("-------------------"));
  Serial.println(F("Everything Ready"));
  Serial.println(F("Waiting PICCs to be scanned"));
  
/*
	Serial.println("GET CARDS FROM SQL");
	row_values *row = NULL;
	delay(100);
	int rowss = 0;
	MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	cur_mem->execute(SELECT_SQL);
	column_names *columns = cur_mem->get_columns();
	byte transferCard[4];		// Stores an ID read from SQL

	do {
		row = cur_mem->get_next_row();
		if (row != NULL) {
			transferCard[0] = atol(row->values[0]);
			Serial.print("DEC value of COL1 = ");
			Serial.println(transferCard[0]);
			transferCard[1] = atol(row->values[1]);
			Serial.print("DEC value of COL2 = ");
			Serial.println(transferCard[1]);
			transferCard[2] = atol(row->values[2]);
			Serial.print("DEC value of COL3 = ");
			Serial.println(transferCard[2]);
			transferCard[3] = atol(row->values[3]);
			Serial.print("DEC value of COL4 = ");
			Serial.println(transferCard[3]);
			Serial.println("");
			rowss = rowss + 1;
			writeID(transferCard);
			}
		} while (row != NULL);
	
	Serial.print("value of rowss = ");
	Serial.println(rowss);
	Serial.println("");
	
	delete cur_mem;
	*/
}

void loop() { 
  /*
  // Look for new cards
  if ( ! mfrc522.PICC_IsNewCardPresent()) {
    delay(50);
    return;
  }
  // Select one of the cards
  if ( ! mfrc522.PICC_ReadCardSerial()) {
    delay(50);
    return;
  }
  // Show some details of the PICC (that is: the tag/card)
  Serial.print(F("Card UID:"));
  lcd.setCursor(0, 1);      
  lcd.print("card read"); // Start Print Test to Line 2
  dump_byte_array(mfrc522.uid.uidByte, mfrc522.uid.size);
  Serial.println();
  */
  
  do {
    successRead = getID(); 	// sets successRead to 1 when we get read from reader otherwise 0
  delay(10);
  yield();
  }
  while (!successRead); 	//the program will not go further while you not get a successful read
  
  
      if ( successRead == 2 ) { // If scanned card is known delete it
        Serial.println(F("I know this PICC, Not adding to DB..."));
        Serial.println("-----------------------------");
        Serial.println(F("Waiting PICCs to be scanned"));
      }
      else if (successRead == 1) {                    // If scanned card is not known add it
        Serial.println(F("I do not know this PICC, adding to DB..."));
        writeID(readCard);
        Serial.println(F("-----------------------------"));
        Serial.println(F("Waiting PICCs to be scanned"));
      }
}


// Helper routine to dump a byte array as hex values to Serial
void dump_byte_array(byte *buffer, byte bufferSize) {
  for (byte i = 0; i < bufferSize; i++) {
    Serial.print(buffer[i] < 0x10 ? " 0" : " ");
    Serial.print(buffer[i], HEX);
  }
}

///////////////////////////////////////// Get PICC's UID ///////////////////////////////////
int getID() {
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
  if (!checkTwo(readCard,lastReadCard)) {
	Serial.println("GET CARDS FROM SQL from stored RFID lists");
	delay(100);
	int rowss = 0;
	MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	sprintf(query, SELECTID_SQL, readCard[0], readCard[1], readCard[2], readCard[3] );
	cur_mem->execute(query);
	Serial.println(query);
	
	column_names *cols = cur_mem->get_columns();
	  for (int f = 0; f < cols->num_fields; f++) {
    Serial.print(cols->fields[f]->name);
    if (f < cols->num_fields-1) {
      Serial.print(',');
    }
  }
	
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
			return 2; //returns value of 2 if card is found
			} else {
					if (tester == 0) {
						Serial.println("Card not found!!");
						return 1; // returns value of 1 if card not found
					}
				}
		} while (row != NULL);
  
  delete cur_mem;
  delete query;
  conn.close();
	Serial.println(F("SQL disconnected"));
  } else { 
	Serial.println("Same card as last time "); 
	Serial.println(F("-----------------------------"));
	Serial.println(F("Waiting PICCs to be scanned"));
	}
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
///////////////////// SQL connector   ///////////////////////////////////
// Check to see if device is connected to SQL
int SQLserverConnect() {
	int ResetCounter = 0;
while (conn.connect(server_addr, 3306, user, password) != true) {
	delay(800);
    Serial.print( "." );
    Serial.print(ResetCounter);
    ResetCounter++;
	
    }
	Serial.println( "connected again!" );
}