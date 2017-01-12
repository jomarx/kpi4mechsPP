
char inChar; // Store the single character pulled in from the RFID Serial Port here

// Serial Library
#include <SoftwareSerial.h>

SoftwareSerial RfidData(2,3); // Com to Scanner TX's tied together

int LoopCounter; //Keep track of number of times to loop here
int LaneCounter; //Keep track of which lane we're scanning here

String TagJustScanned = ""; // store the tag just scanned here 
int PowerControlLane[6] = {4,5,6,7,8,9}; // set the pins which will control the power to the RFID Scanners
String LaneScannedTag[6] = {"","","","","",""}; // set these to blank as the system hasn't scanned any tags

//PCLAP COUNTER LANE TAGS  - LANE 1    - LANE 2    - LANE 3    - LANE 4    - LANE 5    - LANE 6
String LaneAssignedTag[6] = {"6E0084D539","6E0084999C","6D00091BE1","6D0009311E","6E0084A84C","6D00094B1A"}; // Assign the previously determined RFID Seqeunces associated with a specific lane (Left most set of numbers is for lane 1, then lane 2, etc)

//-------------------------------------------------------------------------------------
// Intial Set Up
//-------------------------------------------------------------------------------------


void setup() // Let's get the system ready before we actually start doing anything
{
Serial.begin(9600); // Turn on the serial port connected to the computer at 9600bps
RfidData.begin(9600); // Turn on the serial port that connects to the RFID Scanners at 9600bps

 for (LaneCounter = 0; LaneCounter < 6; LaneCounter ++) // Go through each lane and do the following..
 {
  pinMode(PowerControlLane[LaneCounter],OUTPUT); // Set all the pins to be outputs
digitalWrite(PowerControlLane[LaneCounter],LOW); // Turn all these pins LOW to turn off all the RFID Scanners
 }

//end loop

} //end of setup()

//-----------------------------------------------------------------------------------------
//Main program loop
//-----------------------------------------------------------------------------------------

void loop() // This is the main program
{
 for (LaneCounter = 0; LaneCounter < 6; LaneCounter ++) // enter a loop sequence as long as "LaneCounter"'s values is less than 6
 {
  lanescan(LaneCounter); // Activate the RFID Scanner Sequence for the matching lane and pull data in
  delay(100); // wait for 1/10th of a second before moving to the next lane.
 }
}




void lanescan(int LaneNumber) // This is the bit the activates a scanner, pulls in the data, checks it, and then turns it off, send the data to PC LapCounter
{
digitalWrite(PowerControlLane[LaneNumber],HIGH); // turn reader on
delay(200); // wait for the reader to settle
TagJustScanned = ""; // Clear any previous data
if (RfidData.available() > 0) // if there is data on the virtual serial port
{      
            for (LoopCounter = 0; LoopCounter < 11; LoopCounter ++)
                {
                delay(50);  // wait a bit
                inChar = RfidData.read(); // Get the next character from the virtual serial port
                TagJustScanned += inChar; // throw it on the end of the string we're building to use.
                }
          //This next loop removes the preceeding blank that is acquired upon reading in from the Serial Port for RFIDDATA      
          for (LoopCounter = 0; LoopCounter < 11; LoopCounter ++) 
          {
            TagJustScanned[LoopCounter] = TagJustScanned[LoopCounter + 1]; // The current character in the string will now become the character to it's immediate right. 
          }
}    
    RfidData.flush(); // clear the stream of data

  
    
    
    // The next 2 if statements prevent the RFID tag being sent more than necessary.
    // It will only resend the tag if it was removed and then scanned again, when the power was turned on during
    // multiplexing.
    
    if ((LaneScannedTag[LaneNumber] != TagJustScanned) && (TagJustScanned != "")) // If the tag scanned is different to the one previous scanned, but is ALSO not "Blank" then
      { 
    LaneScannedTag[LaneNumber] = TagJustScanned;    // update my records of which tag just got scanned
        SendPCLCCommand(LaneNumber); // Send it to PCLapCounter
      };
      
    if (TagJustScanned == "") // If I didn't get detect a tag just now
    {
      LaneScannedTag[LaneNumber] = TagJustScanned; // update my records but don't bother sending anything
    };

    
digitalWrite(PowerControlLane[LaneNumber],LOW); // Turn Reader Off
delay(200); // allow time for reader to power down fully      
RfidData.flush(); // Just empty the data stream from the RFID Scanners
Serial.flush(); // And empty the Serial Buffer to the PC now that I'm done with it.
  

}

void SendPCLCCommand(int LaneNumber)
{
Serial.println("RF" + LaneScannedTag[LaneNumber]);    // Send the PC LapCounter Command out with the RFID Tag's number correctly formatted
delay(10); // wait a bit to let PCLC handle things
Serial.println("RF" + LaneAssignedTag[LaneNumber]);    // Send the PC LapCounter Command to say what lane this tag is being allocated to.
delay(10);
}