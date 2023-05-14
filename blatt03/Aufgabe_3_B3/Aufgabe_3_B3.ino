//bool toggle = false;

void setup() {
  setTimer1Freq();
}

void loop() {
  // put your main code here, to run repeatedly:

}

void setTimer1Freq(){
    // put your setup code here, to run once:
  DDRB |= (1<<PB2);
  PORTB &= ~(1<<PB2);
    // define pin 10 as output
  cli();
  //reset control registers
  TCCR1A = 0;
  TCCR1B = 0;
  TIMSK1 = 0;

  // We want to toggle OCR1A on pin 10
  TCCR1A |= (1<<COM1A0) | (0<<COM1A1) | (0<<COM1B0) | (0<<COM1B1);
  //prescaler: 64
  TCCR1B |= (1 << CS11) | (1 << CS10);
  //CTC-MODE
  TCCR1B |= (1 << WGM12);
  //Set output compare register A
  OCR1A = 60;
  //enable interrupt
  // TIMSK1 |= (1 << OCIE1A);
  //enable all interrputs
  sei();
  // setTimer1Freq();
}