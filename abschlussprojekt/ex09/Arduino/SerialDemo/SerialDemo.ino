// Copyright 2018: Benjamin Voelker,
// voelkerb@informatik.uni-freiburg.de
// IRA University of Freiburg
// Example of multiple serial interface connections

// Serial Speed
#define SERIAL_SPEED 38400

// Software Serial library
#include <SoftwareSerial.h>

// Define the Software Serial Pins like this
#define PIN_SOFT_RX 3
#define PIN_SOFT_TX 4
#define SOFT_SERIAL_SPEED 9600
// Software serial object instantiation
SoftwareSerial softSerial(PIN_SOFT_RX, PIN_SOFT_TX);

// Input buffer (of size BUF_SIZE). stores a single line
#define BUF_SIZE 30
char charBuf[BUF_SIZE];
unsigned int bufPos = 0;


void setup() {
  // Inititate serial communication
  Serial.begin(SERIAL_SPEED);
  // Same with softserial
  softSerial.begin(SOFT_SERIAL_SPEED);

  // clear the char buf
  for (int i = 0; i < BUF_SIZE; i++) {
    charBuf[i] = ' ';
  }

  // Indicate end of setup
  Serial.println("Setup done");
}


void loop () {
  // Wait for Serial data available
  if (Serial.available() > 0) {
    // Read single character
    char temp = Serial.read();
    // If it is n line break
    if (temp != '\r' && temp != '\n') {
      // Start by buffering the data
      charBuf[bufPos] = temp;
      // Prevent overflow
      bufPos = (bufPos + 1) % BUF_SIZE;
      // append end of string character
      charBuf[bufPos] = '\0';
    // If we have a line break character
    } else {
      // Test the string using stringcompare function: strcmp returns 0 on match
      if (strcmp(charBuf, "command1") == 0) {
        Serial.print("Abschluss Projekt\r\n");
        executeCommand1();
      // Can implement some sort of state machine here
      } else if (strcmp(charBuf, "command2") == 0) {
        executeCommand2();
      } else {
        if (bufPos > 0) Serial.println(charBuf);
      }
      // Clear data
      bufPos = 0;
      for (int i = 0; i < BUF_SIZE; i++) charBuf[i] = ' ';
      charBuf[bufPos] = '\0';
    }
  }
  // You can also do exact the same for a SoftwareSerial
  if (softSerial.available()) {
    char temp = softSerial.read();
    softSerial.println(temp);
  }
}

void executeCommand1() {
  // Wait for a specific character
  while (Serial.read() != '!') { delay(1); }
  // Wait for some amount of data
  while (Serial.available() < 10) { delay(10); }
}

void executeCommand2() {
  // Read 2 bytes
  while (Serial.available() < 2) { delay(10); }
  uint8_t myBytes[2] = {0};
  for (int i = 0; i < 2; i++) myBytes[i] = Serial.read();

  // Write 3 bytes
  uint8_t hwp[3] = {(uint8_t)'H',(uint8_t)'W',(uint8_t)'P'};
  for (int i = 0; i < 3; i++) { Serial.write(hwp[i]);}
  // Different way to write \r\n
  Serial.println("");
}
