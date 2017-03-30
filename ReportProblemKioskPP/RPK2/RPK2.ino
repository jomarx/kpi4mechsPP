#include <ESP8266WiFi.h>
#include <SoftwareSerial.h>
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

//SQL read
#include <WiFiClient.h>
#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

IPAddress server_addr(192,168,143,200); // Piplay
//IPAddress server_addr(192,168,42,85); // IP of the MySQL server here
char user[] = "nodemcu1"; // MySQL user login username
char spassword[] = "secret"; // MySQL user login password

// Sample query
char QUERY_SMID[] = "SELECT SpecialSerial, RFID FROM kpi_mech.sm_db WHERE RFID = %lu; ";
char QUERY_EMPID[] = "SELECT EmpNo, location FROM kpi_mech.user_db WHERE rfid = %lu; ";
char QUERY_INSERT[] = "insert into kpi_mech.task_db (EmpNo, Status, details, SpecialSerial, location, StartDate, BreakStartTime) values (%d, 0, %d, %d, 1, (now()),(Curtime()));";
char QUERY_FNDTASK[] = "SELECT ID, SpecialSerial FROM kpi_mech.task_db WHERE Status = %d limit 1; ";
char QUERY_FNDCTASK[] = "SELECT mech FROM kpi_mech.cancel_db WHERE taskID = %d; ";
char QUERY_FNDTTASK[] = "SELECT mech FROM kpi_mech.timeout_db WHERE taskID = %d; ";
char QUERY_FINDMECH[] = "SELECT empID, NotifNo FROM kpi_mech.mech_db WHERE status = %d limit 1 ; ";
char QUERY_FINDCMECH[] = "SELECT empID, NotifNo FROM kpi_mech.mech_db WHERE status = 0 AND empID != %d limit 1 ; ";
char QUERY_UPDATEMECH[] = "UPDATE kpi_mech.mech_db SET status = 1 WHERE empID = %d; ";
char QUERY_UPDATETASK[] = "UPDATE kpi_mech.task_db SET location = 1, Status = 1, NotifNo = %d, Assignee = %d WHERE ID = %d; ";
char QUERY_UPDATETASK1[] = "UPDATE kpi_mech.task_db SET location = 1, Status = 1, NotifNo = %d, Assignee = %d WHERE ID = %d; insert into kpi_mech.mbreak_db (SpecialSerial, StartDate, TaskID) values (%d, (now()), %d);";
char QUERY_MECHSTART[] = "insert into kpi_mech.mstat_db (SpecialSerial, StartDate, Status) values (%d, (now()), 1); UPDATE kpi_mech.mech_db SET att_stat = 1 WHERE SpecialSerial = %d;";
char QUERY_MECHEND[] = "UPDATE kpi_mech.mstat_db SET EndDate = (now()), status = 2 WHERE SpecialSerial = %d, status = 1; UPDATE kpi_mech.mech_db SET att_stat = 0 WHERE SpecialSerial = %d;";
char QUERY_MECHBSTART[] = "";
char QUERY_MECHBEND[] = "";
char QUERY_FNDMECHEMPID[] = "SELECT SpecialSerial FROM kpi_mech.mech_db WHERE SpecialSerial = %lu;";
char query[256];

WiFiClient client;
MySQL_Connection conn((Client *)&client);

//LCD
LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display

SoftwareSerial rfidReader(D3,D4);
String tagString;
char tagNumber[14];
char realTagNum[12];
boolean receivedTag;

//const char* ssid = "jomarAP-SP";
//const char* wpassword = "maquinay1";

const char* ssid = "outsourcing1.25s";
const char* wpassword = "dbafe12345!!!";

//rfid tag
int validRFID = 7754087;

//buzzer
const int buzzer = D8;

//button
const int startButton = D6;
const int cancelButton = D7;
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
const int AttFunctionButton = D5;

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

int taskID = 0;
int mechID = 0;
int CmechID = 0;
int TmechID = 0;

void setup() {

  delay(1000);
  //pinMode(D1, OUTPUT);
  rfidReader.begin(9600); // the RDM6300 runs at 9600bps
  Serial.begin(9600);

  Serial.println("\n\n\nRFID Reader...ready!");
  
  // We start by connecting to a WiFi network
  Serial.println();
 /* 
  ClearLCD();
  lcd.setCursor(0,0);
  lcd.print("Connecting to ");
  lcd.setCursor(0,1);
  lcd.print("WIFI");
  */
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, wpassword);

  int ResetCounter = 0;
while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
    Serial.print(ResetCounter);
	  Serial.println(WiFi.status());
    ResetCounter++;
    if (ResetCounter >= 30) {
		Serial.print("\n");
		Serial.print("ESP8266 reset!");
		ESP.restart();
      }
}

  //LCD init
  lcd.init();                      // initialize the lcd 
  lcd.init();
  // Print a message to the LCD.
  lcd.backlight();
  lcd.setCursor(0,0);
  lcd.print("Report Problem");
  lcd.setCursor(0,1);
  lcd.print("Kiosk by JM");
  delay(3000);
  buzzerFunction(3);

	pinMode(startButton, INPUT_PULLUP);
	pinMode(cancelButton, INPUT_PULLUP);
	pinMode(AttFunctionButton, INPUT);
		
	attachInterrupt(startButton, startButtonChange, CHANGE);
	attachInterrupt(cancelButton, cancelButtonChange, CHANGE);

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
	ClearLCD();
	lcd.print("Please Scan ID");

}

void loop(){
	
	//reset button state
	buttonState1 = 1;
	buttonState2 = 1;

  receivedTag=false;
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
	//lcd.noBacklight();

	
	//Reading from RFID
if (rfidReader.available() > 0 && RFIDFunction == 1){
	BytesRead = rfidReader.readBytesUntil(3, tagNumber, 15);//EOT (3) is the last character in tag 
    
	buzzerFunction(1);
	Serial.println("Got a tag");   
	delay(100);
	
	while (rfidReader.available() > 0) {
		rfidReader.read();
	}
	
	delay(100);
	
	tagString=tagNumber;
	Serial.println();
    Serial.print("Tag Number1: ");
    Serial.println(tagString);
    tagString.substring(3,11).toCharArray(realTagNum, sizeof(realTagNum));
    Serial.println(realTagNum);
    result = hex2int(realTagNum, 8);
    Serial.println(result);
	
	if (result <= 0 || tagNumber <= 0) {
		receivedTag=false;
		Serial.print("receivedTag: false");
	} else {
		receivedTag=true;
		Serial.print("receivedTag: true");
	}
}
	
  	
  if (receivedTag){
	
	lcd.backlight();
	ClearLCD();
	lcd.print("Checking ID Tag");
	
	MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	SQLserverConnect();	
    tagString=tagNumber;
        
	delay(500);
	row_values *row = NULL;
	Serial.println("SQL query to search for RFID");
	// Initiate the query class instance
	//MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
	sprintf(query, QUERY_EMPID, result);
	// Execute the query
	cur_mem->execute(query);
	Serial.print("value of char = ");
	Serial.println(query);
	// Fetch the columns (required) but we don't use them.
	column_names *columns = cur_mem->get_columns();
	// Read the row (we are only expecting the one)
		
		
	do {
		row = cur_mem->get_next_row();
		if (row != NULL) {
			EmpCd = atol(row->values[0]);
			Serial.print("value of Emp ID = ");
			Serial.println(EmpCd);
			cellLocation = atol(row->values[1]);
			Serial.print("value of cellLocation = ");
			Serial.println(cellLocation);
		}
	} while (row != NULL);
	// Deleting the cursor also frees up memory used
	//delete cur_mem;
	//conn.close();
	
    if (EmpCd != 0) {
      Serial.println("RFID allowed");
	  
	  //LCD
		ClearLCD();
		lcd.print("User RFID allowed");
		delay(3000);
		
		ClearLCD();
		lcd.print("Scan Machine ID");
		Serial.println("Scan Machine ID");
		delay(3000);
		receivedTag=false;
		result=0;
		
		//check RFID if valid machine
		do {
			if (rfidReader.available() > 0){
				BytesRead = rfidReader.readBytesUntil(3, tagNumber, 15);//EOT (3) is the last character in tag 
				buzzerFunction(1);
				Serial.println("Got Machine tag");    
				delay(1);
				
				while (rfidReader.available() > 0) {
					rfidReader.read();
				}
				delay(1);
				
				tagString=tagNumber;
				Serial.println();
				Serial.print("Tag Number: ");
				Serial.println(tagString);
				tagString.substring(3,11).toCharArray(realTagNum, sizeof(realTagNum));
				Serial.println(realTagNum);
				result = hex2int(realTagNum, 8);
				//tag number
				Serial.println(result);
				
				if (result <= 0) {
					receivedTag=false;
					} else {
						receivedTag=true;
						}
			}
			
			if (receivedTag){
				
				MySQL_Cursor *cur_mem11 = new MySQL_Cursor(&conn);
				SQLserverConnect();	
				tagString=tagNumber;
				EmpCd = 0;
    
				delay(500);
				row_values *row = NULL;
				Serial.println("SQL query to search for Machine RFID");
				// Initiate the query class instance
				//MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
				sprintf(query, QUERY_SMID, result);
				// Execute the query
				cur_mem11->execute(query);
				Serial.print("value of char = ");
				Serial.println(query);
				// Fetch the columns (required) but we don't use them.
				column_names *columns = cur_mem11->get_columns();
				// Read the row (we are only expecting the one)
					
					lcd.backlight();
					ClearLCD();
					lcd.print("Checking ID Tag");
				
				do {
					row = cur_mem11->get_next_row();
					if (row != NULL) {
						EmpCd = atol(row->values[0]);
						Serial.print("value of SpecialSerial = ");
						Serial.println(EmpCd);
						SpecialSerial=EmpCd;
						cellLocation = atol(row->values[1]);
						Serial.print("value of RFID = ");
						Serial.println(cellLocation);
					}
				} while (row != NULL);
				// Deleting the cursor also frees up memory used
				//delete cur_mem;
				//conn.close();
				
				if (EmpCd != 0) {
					Serial.println("Machine ID OK");
					delay(3000);
					SmRfidDone = 1;
				} else {
					Serial.println("RFID is not allowed");
					ClearLCD();
					lcd.print("ID is not allowed");
					delay(3000);
					ClearLCD();
					lcd.print("Scan Machine ID");
					result=0;
					receivedTag=0;
				} 
			}
			
		delay (200);
		Serial.print("1");
		} while (SmRfidDone != 1);
		//end rfid check
		
		ClearLCD();
		//put Emp# check here
		lcd.print("Emp# : ");
		lcd.setCursor(7,0);
		lcd.print(EmpCd);
		lcd.setCursor(0,1);
		lcd.print("Brkdwn Cd : P");
		lcd.print(mbdc);
		delay (2000);
		
			while (TNLeaveLoop < 1) {
				
				//buttonState1 = digitalRead(startButton);
				//buttonState2 = digitalRead(cancelButton);
				potVal = analogRead(potPin);    // read the potValue from the sensor
				
				if (potVal > 100 && potVal < 286) {mbdc=1;}
				else if (potVal > 297 && potVal < 323) {mbdc=2;}
				else if (potVal > 334 && potVal < 360) {mbdc=3;}
				else if (potVal > 371 && potVal < 397) {mbdc=4;}
				else if (potVal > 408 && potVal < 434) {mbdc=5;}
				else if (potVal > 445 && potVal < 471) {mbdc=6;}
				else if (potVal > 482 && potVal < 508) {mbdc=7;}
				else if (potVal > 519 && potVal < 545) {mbdc=8;}
				else if (potVal > 556 && potVal < 582) {mbdc=9;}
				else if (potVal > 593 && potVal < 619) {mbdc=10;}
				else if (potVal > 630 && potVal < 656) {mbdc=11;}
				else if (potVal > 667 && potVal < 693) {mbdc=12;}
				else if (potVal > 704 && potVal < 730) {mbdc=13;}
				else if (potVal > 741 && potVal < 767) {mbdc=14;}
				else if (potVal > 778 && potVal < 804) {mbdc=15;}
				else if (potVal > 815 && potVal < 841) {mbdc=16;}
				else if (potVal > 852 && potVal < 878) {mbdc=17;}
				else if (potVal > 889 && potVal < 915) {mbdc=18;}
				else if (potVal > 926 && potVal < 952) {mbdc=19;}
				else if (potVal > 963 && potVal < 989) {mbdc=20;}
							
				if (buttonState1 == LOW && buttonState2 == HIGH) {
					    Serial.print("Start");
							
						//SQL start
						//row_values *row = NULL;
						SQLserverConnect();
						//char taskID
						delay(500);
						Serial.println("SQL query sending task");
						// Initiate the query class instance
						MySQL_Cursor *cur_mem2 = new MySQL_Cursor(&conn);
						sprintf(query, QUERY_INSERT, EmpCd, mbdc, cellLocation);
						// Execute the query
						cur_mem2->execute(query);
						Serial.print("value of char = ");
						Serial.println(query);
						delay(500);
						//delete cur_mem;
						//conn.close();
						// SQL end
						
						ClearLCD();
						lcd.print("Sending data");
						lcd.setCursor(0,1);
						lcd.print("Thanks you!");
						TNLeaveLoop = 2;
						delay (2000);
						result = 0;
						mbdc = 1;
						EmpCd = 0;
						ClearLCD();
						lcd.print("Please Scan ID");
						
						buttonState1=1;
				}
				
				if (buttonState1 == HIGH && buttonState2 == LOW){
						Serial.print("Cancel");
						ClearLCD();
						lcd.setCursor(0,0);
						lcd.print("Cancel!");
						TNLeaveLoop = 2;
						delay (2000);
						result = 0;
						mbdc = 0;
						EmpCd = 0;
						ClearLCD();
						lcd.print("Please Scan ID");
						buttonState2=1;
				}
				
				if (countToFive > 6000 ){
					Serial.print("Timout Resetting");
					ClearLCD();
					lcd.print("Task Timeout");
					lcd.setCursor(0,1);
					lcd.print("Resetting");
					
					buzzerFunction(4);
					TNLeaveLoop = 2;	
					delay(3000);
					ESP.restart();
				}
				
				delay(100);
				Serial.print(countToFive);
				countToFive++;
				
				if (TNLeaveLoop == 0) {
				ClearLCD();
				lcd.print("Emp# : ");
				lcd.setCursor(8,0);
				lcd.print(EmpCd);
				lcd.setCursor(0,1);
				lcd.print("Brkdwn Cd : P");
				lcd.print(mbdc);
				}
				
			}
	
    } else {
      Serial.println("RFID is not allowed");
		ClearLCD();
		lcd.print("ID is not allowed");
		delay(3000);
		ClearLCD();
		lcd.print("Please Scan ID");
		result=0;
		receivedTag=0;
		
    }
    
    memset(tagNumber,0,sizeof(tagNumber)); //erase tagNumber
    // this clears the rest of data on the serial, to prevent multiple scans
    
	while (rfidReader.available() > 0) {
		rfidReader.read();
	}
	  
	  delay(100);
    
  }

  delay(400);
  
  AttFunction = analogRead(AttFunctionButton);
  if (AttFunction > 0){
	Serial.print("Attendance mode ");
	buzzerFunction(2);
	ClearLCD();
	lcd.print("Attendance mode");
	lcd.setCursor(0,1);
	lcd.print("Scan ID :");
	delay(5000);
	buzzerFunction(1);
	
	//check RFID if valid machine
		do {
			if (rfidReader.available() > 0){
				BytesRead = rfidReader.readBytesUntil(3, tagNumber, 15);//EOT (3) is the last character in tag 
				buzzerFunction(1);
				Serial.println("Got employee ID tag");    
				delay(1);
				
				while (rfidReader.available() > 0) {
					rfidReader.read();
				}
				delay(1);
				
				tagString=tagNumber;
				Serial.println();
				Serial.print("Tag Number: ");
				Serial.println(tagString);
				tagString.substring(3,11).toCharArray(realTagNum, sizeof(realTagNum));
				Serial.println(realTagNum);
				result = hex2int(realTagNum, 8);
				//tag number
				Serial.println(result);
				
				if (result <= 0) {
					receivedTag=false;
					} else {
						receivedTag=true;
						}
			}
			
			if (receivedTag){
				
				MySQL_Cursor *cur_mem121 = new MySQL_Cursor(&conn);
				SQLserverConnect();	
				tagString=tagNumber;
				EmpCd = 0;
    
				delay(500);
				row_values *row = NULL;
				Serial.println("SQL query to search for employee ID");
				// Initiate the query class instance
				//MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
				sprintf(query, QUERY_FNDMECHEMPID, result);
				// Execute the query
				cur_mem121->execute(query);
				Serial.print("value of char = ");
				Serial.println(query);
				// Fetch the columns (required) but we don't use them.
				column_names *columns = cur_mem121->get_columns();
				// Read the row (we are only expecting the one)
					
					lcd.backlight();
					ClearLCD();
					lcd.print("Checking ID Tag");
				
				do {
					row = cur_mem121->get_next_row();
					if (row != NULL) {
						EmpCd = atol(row->values[0]);
						Serial.print("value of SpecialSerial = ");
						Serial.println(EmpCd);
						SpecialSerial=EmpCd;
					}
				} while (row != NULL);
				// Deleting the cursor also frees up memory used
				//delete cur_mem;
				//conn.close();
				
				if (SpecialSerial != 0) {
					Serial.println("Employee ID OK");
					ClearLCD();
					lcd.print("Employee ID OK");
					delay(3000);
					SmRfidDone = 1;
				} else {
					Serial.println("RFID is not allowed");
					ClearLCD();
					lcd.print("ID is not allowed");
					delay(3000);
					ClearLCD();
					lcd.print("Scan Emp ID");
					result=0;
					receivedTag=0;
				} 
			}
			
		delay (200);
		Serial.print("1");
		} while (SmRfidDone != 1);
		//end rfid check
	
	TNLeaveLoop = 0;
	
	while (TNLeaveLoop < 1) {
		ClearLCD();
		lcd.print("In/Out|Break S/E");
		lcd.setCursor(0,1);
		potVal = analogRead(potPin);    // read the potValue from the sensor
		if (potVal > 100 && potVal < 371) {AttCode=0; lcd.print("Time In");}
		else if (potVal > 372 && potVal < 508) {AttCode=1; lcd.print("Time Out");}
		else if (potVal > 519 && potVal < 667) {AttCode=2; lcd.print("Break Start");}
		else if (potVal > 668 && potVal < 989) {AttCode=3; lcd.print("Break End");}
		
		if (buttonState1 == LOW && buttonState2 == HIGH) {
			
			//time in function
				if (AttCode == 0) {
					Serial.print("Start log In");
					//SQL start
					//row_values *row = NULL;
					SQLserverConnect();
					//char taskID
					delay(500);
					Serial.println("SQL query sending attendance IN");
					// Initiate the query class instance
					MySQL_Cursor *cur_mem62 = new MySQL_Cursor(&conn);
					sprintf(query, QUERY_MECHSTART, SpecialSerial, SpecialSerial);
					// Execute the query
					cur_mem62->execute(query);
					Serial.print("value of char = ");
					Serial.println(query);
					delay(500);
					//delete cur_mem;
					//conn.close();
					// SQL end
					
					ClearLCD();
					lcd.print("Log IN");
					lcd.setCursor(0,1);
					lcd.print("Thanks you!");
					TNLeaveLoop = 2;
					delay (2000);
					result = 0;
					mbdc = 1;
					EmpCd = 0;
					SmRfidDone = 0;
				}
			
			
			//time out function
				if (AttCode == 1) {
					Serial.print("Start log Off");
					//SQL start
					//row_values *row = NULL;
					SQLserverConnect();
					//char taskID
					delay(500);
					Serial.println("SQL query sending attendance OFF");
					// Initiate the query class instance
					MySQL_Cursor *cur_mem62 = new MySQL_Cursor(&conn);
					sprintf(query, QUERY_MECHEND, SpecialSerial, SpecialSerial);
					// Execute the query
					cur_mem62->execute(query);
					Serial.print("value of char = ");
					Serial.println(query);
					delay(500);
					//delete cur_mem;
					//conn.close();
					// SQL end
					
					ClearLCD();
					lcd.print("Log IN");
					lcd.setCursor(0,1);
					lcd.print("Thanks you!");
					TNLeaveLoop = 2;
					delay (2000);
					result = 0;
					mbdc = 1;
					EmpCd = 0;
					SmRfidDone = 0;
					}
			
			//break start function
			
			//break end function
			
			buttonState1=1;
		}
		
		if (buttonState1 == HIGH && buttonState2 == LOW){
					Serial.print("Attendance cancelled!");
						ClearLCD();
						lcd.setCursor(0,0);
						lcd.print("Cancelled!");
						TNLeaveLoop = 2;
						delay (2000);
						result = 0;
						mbdc = 0;
						EmpCd = 0;
						ClearLCD();
						lcd.print("Please Scan ID");
						buttonState2=1;
		}
		
		if (countToFive > 6000 ){
			Serial.print("Timout Resetting");
			ClearLCD();
			lcd.print("Task Timeout");
			lcd.setCursor(0,1);
			lcd.print("Resetting");
					
			buzzerFunction(4);
			delay(2000);
			ESP.restart();
		}
				
		delay(100);
		Serial.print(countToFive);
		countToFive++;
		
		AttFunction = analogRead(AttFunctionButton);
		if (AttFunction = 0){TNLeaveLoop = 0;}
	}
	
	TNLeaveLoop = 0;
	delay(2000);
	
	  
	}
	
 /* auto assign function is now available at PHP
  if (countToTwo > 120 && AssignSelect == 0 && AssignFunction == 1){
	
	buzzerFunction(2);
	ClearLCD();
	lcd.print("Task AutoAssign");
	lcd.setCursor(0,1);
	lcd.print("New Task");
		
	//SQL start
		SQLserverConnect();	
		taskID = 0;
		mechID = 0;
		//char taskID
		delay(500);
		row_values *row = NULL;
		MySQL_Cursor *cur_mem3 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding new task - test");
		// Initiate the query class instance
		sprintf(query, QUERY_FNDTASK, 0);
		// Execute the query
			cur_mem3->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		// Fetch the columns (required) but we don't use them.
	
		column_names *columns = cur_mem3->get_columns();
	
	do {
	row = cur_mem3->get_next_row();
		if (row != NULL) {
		taskID = atol(row->values[0]);
		Serial.print("value of taskID = ");
		Serial.println(taskID);
		SpecialSerial = atol(row->values[1]);
		Serial.print("value of SpecialSerial = ");
		Serial.println(SpecialSerial);
		}
	} while (row != NULL);
		
	if (taskID != 0) {
	
		delay(500);	
		MySQL_Cursor *cur_mem4 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding available mech");
		sprintf(query, QUERY_FINDMECH, 0);
			cur_mem4->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		
		column_names *column = cur_mem4->get_columns();

		do {
			row = cur_mem4->get_next_row();
			if (row != NULL) {
				mechID = atol(row->values[0]);
				Serial.print("value of mechID = ");
				Serial.println(mechID);
				NotifNo = atol(row->values[1]);
				Serial.print("value of NotifNo = ");
				Serial.println(NotifNo);
			}
		} while (row != NULL);
	
		delay(500);
				
		if (mechID != 0) {
			MySQL_Cursor *cur_mem5 = new MySQL_Cursor(&conn);
		Serial.println("First SQL query updating task");
		// Initiate the query class instance
		sprintf(query, QUERY_UPDATETASK1, NotifNo, mechID, taskID, SpecialSerial, taskID);
			cur_mem5->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
			Serial.println("task_db/mbreak_db updated!");
		delay(500); //find mech
		sprintf(query, QUERY_UPDATEMECH, mechID);
			cur_mem5->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
			Serial.println("mech_db updated!");
			
			ClearLCD();
			lcd.print("Task Assigned");
			delay(1000);
			
		} else {
			Serial.println("No available mech!");
		delay(500);
		}
	
	//sprintf(query, QUERY_EMPID, taskID);
	// Execute the query
	//cur_mem4->execute(query);
	delay(100);
	//conn.close();
	//countToTwo = 0;
	}
		ClearLCD();
		lcd.print("Please Scan ID");
		AssignSelect = 1;
	
	}
	
	//find cancelled task and auto assign
	 if (countToTwo > 240 && AssignSelect == 1 && AssignFunction == 1){
	
	buzzerFunction(2);
	ClearLCD();
	lcd.print("Task AutoAssign");
	lcd.setCursor(0,1);
	lcd.print("Cancelled Task");
	
	//SQL start
		SQLserverConnect();	
		taskID = 0;
		mechID = 0;
		CmechID = 0;
		//char taskID
		delay(500);
		row_values *row = NULL;
		MySQL_Cursor *cur_mem31 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding cancelled task");
		// Initiate the query class instance
		sprintf(query, QUERY_FNDTASK, 5);
		// Execute the query
			cur_mem31->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		// Fetch the columns (required) but we don't use them.
	
		column_names *columns = cur_mem31->get_columns();
	
	do {
	row = cur_mem31->get_next_row();
		if (row != NULL) {
		taskID = atol(row->values[0]);
		Serial.print("value of taskID = ");
		Serial.println(taskID);
		}
	} while (row != NULL);
	
		if (taskID != 0) {
	
			delay(500);
		//row_values *row = NULL;
		MySQL_Cursor *cur_mem312 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding cancelled task");
		// Initiate the query class instance
		sprintf(query, QUERY_FNDCTASK, taskID);
		// Execute the query
			cur_mem312->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		// Fetch the columns (required) but we don't use them.
	
		column_names *column = cur_mem312->get_columns();
	
	do {
	row = cur_mem312->get_next_row();
		if (row != NULL) {
		CmechID = atol(row->values[0]);
		Serial.print("value of CmechID = ");
		Serial.println(CmechID);
		}
	} while (row != NULL);
	
		delay(500);	
		MySQL_Cursor *cur_mem4 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding available mech NOT CmechID");
		sprintf(query, QUERY_FINDCMECH, CmechID);
			cur_mem4->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		
		column_names *column1 = cur_mem4->get_columns();
			
		do {
			row = cur_mem4->get_next_row();
			if (row != NULL) {
				mechID = atol(row->values[0]);
				Serial.print("value of mechID = ");
				Serial.println(mechID);
				Serial.print("value of NotifNo = ");
				Serial.println(NotifNo);
			}
		} while (row != NULL);
	
		delay(500);
				
		if (mechID != 0) {
			MySQL_Cursor *cur_mem5 = new MySQL_Cursor(&conn);
		Serial.println("SQL query updating task");
		// Initiate the query class instance
		sprintf(query, QUERY_UPDATETASK, NotifNo, mechID, taskID);
			cur_mem5->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
			Serial.println("task_db updated!");
		delay(500); //find cmech
		sprintf(query, QUERY_UPDATEMECH, mechID);
			cur_mem5->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
			Serial.println("mech_db updated!");
			
			ClearLCD();
			lcd.print("Task Assigned");
			delay(1000);
			
		} else {
			Serial.println("No available mech!");
		delay(500);
		}
	
	//sprintf(query, QUERY_EMPID, taskID);
	// Execute the query
	//cur_mem4->execute(query);
	delay(100);
	//conn.close();
	//countToTwo = 0;
		}
		
		ClearLCD();
		lcd.print("Please Scan ID");
		AssignSelect = 2;
	
	}
	
	//find timeout task
	if (countToTwo > 460 && AssignSelect == 2 && AssignFunction == 1){
	
	buzzerFunction(2);
	ClearLCD();
	lcd.print("Task AutoAssign");
	lcd.setCursor(0,1);
	lcd.print("Timeout Task");
	
	//SQL start
		SQLserverConnect();	
		taskID = 0;
		mechID = 0;
		TmechID = 0;
		//char taskID
		delay(500);
		row_values *row = NULL;
		MySQL_Cursor *cur_mem31 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding timeout task");
		// Initiate the query class instance
		sprintf(query, QUERY_FNDTASK, 6);
		// Execute the query
			cur_mem31->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		// Fetch the columns (required) but we don't use them.
	
		column_names *columns1 = cur_mem31->get_columns();
	
	do {
	row = cur_mem31->get_next_row();
		if (row != NULL) {
		taskID = atol(row->values[0]);
		Serial.print("value of taskID = ");
		Serial.println(taskID);
		}
	} while (row != NULL);
	
		if (taskID != 0) {
			delay(500);
		//row_values *row = NULL;
		MySQL_Cursor *cur_mem312 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding Timeout task");
		// Initiate the query class instance
		sprintf(query, QUERY_FNDTTASK, taskID);
		// Execute the query
			cur_mem312->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		// Fetch the columns (required) but we don't use them.
	
		column_names *column2 = cur_mem312->get_columns();
	
	do {
	row = cur_mem312->get_next_row();
		if (row != NULL) {
		TmechID = atol(row->values[0]);
		Serial.print("value of TmechID = ");
		Serial.println(TmechID);
		}
	} while (row != NULL);
	
		delay(500);	
		MySQL_Cursor *cur_mem4 = new MySQL_Cursor(&conn);
		Serial.println("SQL query finding available mech NOT TmechID");
		sprintf(query, QUERY_FINDCMECH, TmechID);
			cur_mem4->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
		
		column_names *column12 = cur_mem4->get_columns();
			
		do {
			row = cur_mem4->get_next_row();
			if (row != NULL) {
				mechID = atol(row->values[0]);
				Serial.print("value of mechID = ");
				Serial.println(mechID);
				Serial.print("value of NotifNo = ");
				Serial.println(NotifNo);
			}
		} while (row != NULL);
	
		delay(500);
				
		if (mechID != 0) {
			MySQL_Cursor *cur_mem5 = new MySQL_Cursor(&conn);
		Serial.println("SQL query updating task");
		// Initiate the query class instance
		sprintf(query, QUERY_UPDATETASK, NotifNo, mechID, taskID);
			cur_mem5->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
			Serial.println("task_db updated!");
		delay(500);
		sprintf(query, QUERY_UPDATEMECH, mechID);
			cur_mem5->execute(query);
			Serial.print("value of char = ");
			Serial.println(query);
			Serial.println("mech_db updated!");
			
			ClearLCD();
			lcd.print("Task Assigned");
			delay(1000);
			
		} else {
			Serial.println("No available mech!");
		delay(500);
		}
		}
	//sprintf(query, QUERY_EMPID, taskID);
	// Execute the query
	//cur_mem4->execute(query);
	delay(100);
	//conn.close();
	
		ClearLCD();
		lcd.print("Please Scan ID");
		countToTwo = 0;
		AssignSelect = 0;
	
	}
	// end auto assign*/
	
	
	countToTwo++;
	
	delay(100);
	
	if (countToloop > 600 ){ 
		Serial.print("IDLE Resetting");
		ClearLCD();
		lcd.print("IDLE Timeout");
		lcd.setCursor(0,1);
		lcd.print("Resetting");

		buzzerFunction(4);
		delay(2000);
		ESP.restart();
	
	}
	
	countToloop++;
	yield();
  
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

void startButtonChange() {
	
	buttonState1 = 0;
	
}

void cancelButtonChange() {
	
	buttonState2 = 0;
	
}
