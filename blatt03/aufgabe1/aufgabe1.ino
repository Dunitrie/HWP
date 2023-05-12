void setup() {
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:
  setPin13(true);
  delay(500);
  setPin13(false);
  delay(500);
}


void setPin13(bool high) {
    //set pin 13 as output and initial low
  DDRB |= (1<<PB5);
  PORTB &= ~(1 << PB5);
  //set LED on if bool == high, else set LED off
  if (high) {
    PORTB |= (1 << PB5);
  } else {
    PORTB &= ~(1 << PB5);
  }
}