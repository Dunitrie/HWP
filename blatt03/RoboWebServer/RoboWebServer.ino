// Include WiFi libs
#include <ESP8266WiFi.h>
#include <ESP8266mDNS.h>
#include "website.h"

const bool left = true;
const bool right = false;
//const bool forward = true;
//const bool backward = false;

// Add your wifi credentials here
const char* ssid     = "Fairphone";
const char* password = "12344321";

uint16_t SPEED_OF_SOUND = 340;

// Webserver on port 80 (standard http port)
WiFiServer server(80);

// Variable to store incoiming http request
String request;

// Name of the device (can be used as DNS query in browser)
#define DEVICE_NAME "HWPRobo"

// Pins of motor
#define MOTOR_A1_PIN D1
#define MOTOR_A2_PIN D2
#define MOTOR_B1_PIN D5
#define MOTOR_B2_PIN D6
const uint8_t motorPins[] = {MOTOR_A1_PIN, MOTOR_A2_PIN, MOTOR_B1_PIN, MOTOR_B2_PIN};

// Us pins
#define US1_PIN D8
#define US2_PIN D7
#define US3_PIN D3
const uint8_t usPins[] = {US1_PIN, US2_PIN, US3_PIN};

//#define true true

void setup() {
  // Init serial
  Serial.begin(115200);

  // Init motor pins as output
  for (size_t i = 0; i < sizeof(motorPins)/sizeof(motorPins[0]); i++) {
    pinMode(motorPins[i], OUTPUT);
    digitalWrite(motorPins[i], LOW);
  }
  
  // Comment if you want that the ESP creates an AP
  // Connect to wifi
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  // Die IP vom Webserver auf dem seriellen Monitor ausgeben
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP Adress: ");
  Serial.println(WiFi.localIP());

  // Uncomment if you want that the ESP creates an AP
  /*
  // You can remove the password parameter if you want the AP to be open. 
  WiFi.softAP(ssid, password);
  IPAddress myIP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(myIP);
  */

  // mDNS name resolving
  if (MDNS.begin(DEVICE_NAME)) {
    Serial.println("MDNS started");
  } else {
    Serial.println("Error starting MDNS");
  }

  // Start webserver
  server.begin();
}

void loop() {
  // Handle clients
  handleClient();
  // Update MDNS
  MDNS.update();
}

void setMotor(bool forward, bool motor,  uint16_t speed)  {
  if (motor) {
    if (!forward) {
      // WE just set the speed of the motor in question
      //digitalWrite(D1, 0);
      analogWrite(D2, speed);
    }
    else {
      //digitalWrite(D2, 0);
      analogWrite(D1, speed);
    }
  }
  else{
    if (!forward) {
      //digitalWrite(D5, 0);
      analogWrite(D6, speed);
    }
    else {
      //digitalWrite(D6, 0);
      analogWrite(D5, speed);
    }
  }
}

void stopAllMotors(){
  setMotor(0, 0, 0);
  setMotor(0, 1, 0);
  setMotor(1, 0, 0);
  setMotor(1, 1, 0);
}

void drive(bool direction, uint16_t time, uint16_t speed) {
  // If direction==0: Drive backwards, otherwise forward with speed speed
  unsigned long starting_time = millis();

  while (millis() - starting_time < time) {
    setMotor(direction,0, speed);
    setMotor(direction,1, speed);
  }
  stopAllMotors();


}


void turn(bool direction, uint16_t time, uint16_t speed){
  unsigned long starting_time = millis();

  while (millis() - starting_time < time){
    if (direction) {
      setMotor(1, right, speed);
      setMotor(0, left, speed);
    }
    else{
      setMotor(1, left, speed);
      setMotor(0, right, speed);
    }
  }
  stopAllMotors();
}

double measureDistance(uint8_t ultrasonicPin){
  // Send a pulse
  pinMode(ultrasonicPin, OUTPUT);
  digitalWrite(ultrasonicPin, HIGH);
  delay(1);

  // Receive a pulse
  digitalWrite(ultrasonicPin, LOW);
  pinMode(ultrasonicPin, INPUT);
  //pulseIn(Pin, KindOfSignal, WaitTime)
  unsigned long pulseLength = pulseIn(ultrasonicPin, HIGH, 30000);

  // Return the distance
  if (pulseLength){
    // We measure the distance as length of the pulse times speed of sound, which is 340 m/s
    double distance = ((double)pulseLength/1000000) * (double) SPEED_OF_SOUND; // In m/s -> Divide by 100, if wanted 
    return distance;
  }
  else{
    return -1;
  }
}


void handleClient() {
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client)  {  
    return;  
  }
  // Read the first line of the request (we just need this line)
  request = client.readStringUntil('\r');

  // Print request to serial
  Serial.print("request: ");
  Serial.println(request); 

  // print header message
  client.println(header);
  // Check for corresponding get message  
  if (request.indexOf("GET /pollUS") >= 0) {
    Serial.println("Polling");
    double us1, us2, us3 = -1;
    // Insert your code here
    us1 = measureDistance(US1_PIN);
    us2 = measureDistance(US2_PIN);
    us3 = measureDistance(US3_PIN);


    // Send US data to website
    client.printf("{\"US1\":%.2f, \"US2\":%.2f, \"US3\":%.2f}", us1, us2, us3);
    
  // Insert code to make the d-pad control working
  // Start by pressing the buttons of the d pad and watch the serial console to see how the get requests look.

  
  // Serve initial Website
  } else if (request.indexOf("GET /up") >= 0) {
    //drive(bool direction, uint16_t time, uint16_t speed) {
    // direction = true -> Forward
    drive(true, 300, 200);
  } else if (request.indexOf("GET /back") >= 0) {
    drive(false, 300, 200);
  } else if (request.indexOf("GET /left") >= 0) {
    //void turn(bool direction, uint16_t time, uint16_t speed){
    turn(left, 300, 200);
  } else if (request.indexOf("GET /right") >= 0) {
    turn(right, 300, 200);
  } else {
    // Finish HTTP-Request with a newline (thats cruical)
    client.flush();
    client.println(page);
    client.println();
  }
  
}
