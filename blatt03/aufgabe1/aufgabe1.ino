void setup() {
  // put your setup code here, to run once:
  DDRB |= (1<<PB5);
  PORTB &= ~(1 << PB5)
}

void loop() {
  // put your main code here, to run repeatedly:
  setPin13(true);
  delay(500);
  setPin13(false);
  delay(500);
}


void setPin13(bool high) {
  if (high) {
    PORTB |= (1 << PB5)
  } else {
    PORTB &= ~(1 << PB5)
  }
}