#include <math.h>
// These are just in case you don't have the right board and need to define the variables in order not to get an error
const int D1 = 1;
const int D2 = 2;
const int D5 = 5;
const int D6 = 6; 
//const int D9 = 9;
const int D8 = 9;

const int SPEED_OF_SOUND = 340; // m/s

float calc_angle(bool left, float dist1, float dist2, float dist_to_middle = .1){
  if (dist1>0 and dist2>0){
    float angle = acos((dist1+dist_to_middle)/(dist2+dist_to_middle))/M_PI*180;
    if (left){
      return angle;
    }
    else{
      return -angle;
    }
  
  } else{
    return 0;
  }
}

void setup() {
  Serial.begin(9600);
  
  pinMode(D1, OUTPUT);  // right motor
  digitalWrite(D1, LOW);
  pinMode(D2, OUTPUT);  // left motor
  digitalWrite(D2, LOW);
  pinMode(D5, OUTPUT);
  digitalWrite(D5, LOW);
  pinMode(D6, OUTPUT);
  digitalWrite(D6, LOW);
  pinMode(D8, OUTPUT);
  digitalWrite(D8, LOW);
}


void loop() {
  // Turn the device
  //turn(0, 1000, 100);
  float dist3 = measureDistance(D8);
  float dist2 = measureDistance(D5);
  float dist1 = measureDistance(D6);
  
  String output = "dist1: " + String(dist1) +
                  ", dist2: " + String(dist2) +
                  ", dist3: " + String(dist3);
  
  float angle1 = calc_angle(true, dist1, dist3);
  float angle2 = calc_angle(false, dist1, dist2);
  
  

  // Print the concatenated string
  Serial.println(output);
  Serial.println("Left: " + String(angle1) + ", Right:" + String(angle2));

  //Serial.println(dist2);
  //Serial.println(dist3);

  
  // drive(0, 1000, 100);
  // setMotor(0, true, 50);
  delay(1000);
}



void setMotor(bool motor, bool forward, uint16_t speed)  {
  // sets right motor
  if (motor) {
    if (forward) {
      digitalWrite(D1, 0);
      analogWrite(D2, speed);
    }
    else {
      digitalWrite(D2, 0);
      analogWrite(D1, speed);
    }
  }
  // sets left motor
  else{
    if (forward) {
    digitalWrite(D5, 0);
    analogWrite(D6, speed);
    }
    else {
      digitalWrite(D6, 0);
      analogWrite(D5, speed);
    }
  }
}

void drive(bool direction, uint16_t duration, uint16_t speed) {
  // If direction==0: Drive backwards, otherwise forward with speed speed
  unsigned long starting_time = millis();

  while (millis() - starting_time < duration) {
    setMotor(0, direction, speed);
    setMotor(1, direction, speed);
  }
  // stops motors after a certain duration
  setMotor(0, direction, 0);
  setMotor(1, direction, 0);
}

void turn(bool direction, uint16_t duration, uint16_t speed){
  unsigned long starting_time = millis();
  // motors turn in opposite directions for the turn
  while (millis() - starting_time < duration){
    if (direction) {  // turns right
      setMotor(0, direction, speed);
      setMotor(1, !direction, speed);
    }
    else{  // turns left
      setMotor(1, direction, speed);
      setMotor(0, !direction, speed);
    }
  }
  // stops motors
  setMotor(0, direction, 0);
  setMotor(1, direction, 0);
}

double measureDistance(int ultrasonicPin){
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
    return distance/2;
  }
  else{
    return -1;
  }
}
