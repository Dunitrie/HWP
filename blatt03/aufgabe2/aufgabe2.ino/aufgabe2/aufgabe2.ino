bool toggle = false;

void setup() {
  // put your setup code here, to run once:
  pinMode(13, OUTPUT);
  cli();
  //reset control registers
  TCCR1A = 0;
  TCCR1B = 0;

  //prescaler: 64
  TCCR1B |= (1 << CS11);
  TCCR1B |= (1 << CS10);

  //CTC-MODE
  TCCR1B |= (1 << WGM12);

  //Set output compare register A
  OCR1A = 60;

  //enable interrupt
  TIMSK1 |= (1 << OCIE1A);
  
  //enable all interrputs
  sei();
}

void loop() {
  // put your main code here, to run repeatedly:

}
ISR(TIMER1_COMPA_vect) {
  PINB |= (1 << 5);
}

void setTimer1Freq(){
  cli();
  //reset control registers
  TCCR1A = 0;
  TCCR1B = 0;

  //prescaler: 64
  TCCR1B |= (1 << CS11);
  TCCR1B |= (1 << CS10);
  //CTC-MODE
  TCCR1A |= (1 << WGM12);
  //Set output compare register A
  OCR1A = 60;
  //enable interrupt
  TIMSK1 |= (1 << OCIE1A);
  //enable all interrputs
  sei();
}
