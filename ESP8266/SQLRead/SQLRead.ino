/*
  MySQL Connector/Arduino Example : complex select
  This example demonstrates how to issue a SELECT query with parameters that
  we provide from code. Thus, it demonstrates how to build query parameters
  dynamically.
  Notice also the sketch demonstrates how to read columns and rows from
  the result set. Study this example until you are familiar with how to
  do this before writing your own sketch to read and consume query results.
  NOTICE: You must download and install the World sample database to run
          this sketch unaltered. See http://dev.mysql.com/doc/index-other.html.
  INSTRUCTIONS FOR USE
  1) Change the address of the server to the IP address of the MySQL server
  2) Change the user and password to a valid MySQL user and password
  3) Connect a USB cable to your Arduino
  4) Select the correct board and port
  5) Compile and upload the sketch to your Arduino
  6) Once uploaded, open Serial Monitor (use 115200 speed) and observe
  Note: The MAC address can be anything so long as it is unique on your network.
  Created by: Dr. Charles A. Bell
*/

#include <ESP8266WiFi.h> 
#include <WiFiClient.h>

#include <MySQL_Connection.h>
#include <MySQL_Cursor.h>

IPAddress server_addr(192,168,42,85); // IP of the MySQL server here
char user[] = "nodemcu1"; // MySQL user login username
char password[] = "secret"; // MySQL user login password

// WiFi card example
char ssid[] = "jomarAP-SP"; // your SSID
char pass[] = "maquinay1"; // your SSID Password

// Sample query
//char INSERT_SQL[] = "INSERT INTO test_arduino.hello_arduino (message) VALUES ('Hello, Arduino!')";

const char QUERY_POP[] = "SELECT ID, location FROM kpi_mech.task_db WHERE Assignee = 'jomar' AND Status = %lu ORDER BY Severity ASC limit 1;";
char query[128];

WiFiClient client;

MySQL_Connection conn((Client *)&client);

void setup() {
Serial.begin(115200);
// Begin WiFi section
WiFi.begin(ssid, pass);
// Wait for connection
while ( WiFi.status() != WL_CONNECTED ) {
delay ( 500 );
Serial.print ( "." );
}
Serial.println ( "" );
Serial.print ( "Connected to " );
Serial.println ( ssid );
Serial.print ( "IP address: " );
Serial.println ( WiFi.localIP() );
// End WiFi section
Serial.println("DB - Connecting...");
while (conn.connect(server_addr, 3306, user, password) != true) {
delay(500);
Serial.print ( "." );
}
}

void loop() {
	long head_count = 0;
	long head_count2 = 0;
	int swt = 0;
  delay(1000);

  Serial.println("> Running SELECT with dynamically supplied parameter");

  // Initiate the query class instance
  MySQL_Cursor *cur_mem = new MySQL_Cursor(&conn);
  // Supply the parameter for the query
  // Here we use the QUERY_POP as the format string and query as the
  // destination. This uses twice the memory so another option would be
  // to allocate one buffer for all formatted queries or allocate the
  // memory as needed (just make sure you allocate enough memory and
  // free it when you're done!).
  sprintf(query, QUERY_POP, 1);
  // Execute the query
  cur_mem->execute(query);
  // Fetch the columns and print them
  column_names *cols = cur_mem->get_columns();
  for (int f = 0; f < cols->num_fields; f++) {
    Serial.print(cols->fields[f]->name);
    if (f < cols->num_fields-1) {
      Serial.print(',');
    }
  }
  Serial.println();
  // Read the rows and print them
  row_values *row = NULL;
do {
    row = cur_mem->get_next_row();
    if (row != NULL) {
		for (int f = 0; f < cols->num_fields; f++) {
			Serial.print(row->values[f]);
			if (f < cols->num_fields-1) {
				Serial.print(',');
			  swt = 1;
			}
			Serial.println(atol(row->values[f]));
			if (swt == 0) {
				head_count = atol(row->values[0]);
				Serial.print("value of head_count plus 1 = ");
				Serial.println(head_count);
				
			} else {
				head_count = atol(row->values[0]);
				Serial.print("value of head_count plus 1 = ");
				Serial.println(head_count);
				head_count2 = atol(row->values[1]);
				Serial.print("value of head_count2 plus 1 = ");
				Serial.println(head_count2);
				}
		}
    Serial.println();
    }
} while (row != NULL);
  // Deleting the cursor also frees up memory used
  delete cur_mem;
  
}
