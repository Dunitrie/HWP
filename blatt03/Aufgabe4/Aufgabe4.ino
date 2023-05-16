//bool toggle = false;

void setup() {
  // put your setup code here, to run once:
  DDRB |= (1<<PB2);
  PORTB &= ~(1<<PB2);
  //reset control registers
  TCCR1A = 0;
  TCCR1B = 0;
  TIMSK1 = 0;
  // We want to toggle OCR1A on pin 10
  // Timer Counter Control Register 1 
  TCCR1A |= (1 << COM1B0);
  //CTC-MODE
  TCCR1B |= (1 << WGM12);
  //prescaler: 64
  TCCR1B |= (1 << CS12)| (1 << CS10);

  
  Serial.begin(19200);

}

void loop() {
  setTimer1Freq(3000);
  delay(2000);
  setTimer1Freq(1000);
  delay(2000);
}


void setTimer1Freq(uint16_t frequency){

  // TODO: Here we need to have a prescaler. Right now, we just use 64 (which might even be incorrect)
  OCR1A = return_OCR1A(frequency, 64);
  Serial.print("OCR1A: ");
  Serial.println(OCR1A);
  //enable interrupt
  // TIMSK1 |= (1 << OCIE1A);
  //enable all interrputs
  // setTimer1Freq();
}

long return_OCR1A(uint16_t frequency, uint16_t prescaler){
  // F_CPU is the clock frequency
  // Derived from p.99 datasheet
  long val = F_CPU / 2 / prescaler / frequency - 1;
  ///Serial.println(val);
  return val;
}
