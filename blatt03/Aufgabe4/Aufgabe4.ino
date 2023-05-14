//bool toggle = false;

void setup() {
  // put your setup code here, to run once:
  DDRB |= (1<<PB2);
  PORTB &= ~(1<<PB2);
  setTimer1Freq();
}

void loop() {
  // put your main code here, to run repeatedly:

}
ISR(TIMER1_COMPA_vect) {
//   PINB |= (1 << 4);
}

void setTimer1Freq(){
  cli();
  //reset control registers
  TCCR1A = 0;
  TCCR1B = 0;
  //TIMSK1 = 0;

  //prescaler: 64
  TCCR1B |= (1 << CS11);
  TCCR1B |= (1 << CS10);

  //CTC-MODE
  TCCR1B |= (1 << WGM12);

  //Set output compare register A
  OCR1A = 60;

  //enable interrupt
  TCCR1A |= (1<<COM1A0);
  
  // TIMSK1 |= (1 << OCIE1A);
  //enable all interrputs
  sei();
}