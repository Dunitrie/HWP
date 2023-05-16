//bool toggle = false;

void setup() {
  setTimer1Freq();
}

void loop() {
  // put your main code here, to run repeatedly:

}

void setTimer1Freq() {
  // put your setup code here, to run once:
  DDRB |= (1 << PB2); // Set 10 to output
  PORTB &= ~(1 << PB2); // Set 10-output to low

  // define pin 10 as output
  //cli();
  //reset control registers
  TCCR1A = 0;
  TCCR1B = 0;
  TIMSK1 = 0;

  // We want to toggle OCR1A on pin 10
  // Timer Counter Control Register 1 
  TCCR1A |= (1 << COM1B0);

  //prescaler: 64
  TCCR1B |= (1 << CS12)| (1 << CS10);
//   TCCR1B |= (1 << CS11) | (1 << CS10); Sets Prescaler to 256

  //CTC-MODE
  TCCR1B |= (1 << WGM12);

  //Set output compare register A
  // IF CTC-Mode: If TCNT1 == OCR1A: TOV2 = 1; TCNT1 = 0;
  // OCR1A = f_clk / (2 * prescaler * f_oc) = 59.x
  OCR1A = 60;
  //enable interrupt
  // TIMSK1 |= (1 << OCIE1A);
  //enable all interrputs
  //sei();
  // setTimer1Freq();
}
