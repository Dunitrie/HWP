//bool toggle = false;
#include <math.h>


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
  // Toggle Pin when OCRA1 value is reached
  TCCR1A |= (1 << COM1B0);
  //CTC-MODE
  TCCR1B |= (1 << WGM12);
  //prescaler: 64
  TCCR1B |= (1 << CS11)| (1 << CS10);

  
  Serial.begin(19200);

}

void loop() {
  setTimer1Freq(3000);
  delay(2000);
  setTimer1Freq(150);
  delay(2000);
}


void setTimer1Freq(uint16_t frequency){
  // Set Pin 10 low if frequency is not between 100 and 3000 Hz
  if (frequency < 100 || frequency > 3000) {
    PORTB &= ~(1<<PB2);
    TCCR1B |= (1 << CS12) | (1 << CS11)| (1 << CS10);
  }
  else {
    PORTB &= ~(1<<PB2);
    TCCR1B |= (1 << CS11)| (1 << CS10);
    // TODO: Here we need to have a prescaler. Right now, we just use 64 (which might even be incorrect)
    OCR1A = return_OCR1A(frequency);
    // Serial.print("OCR1A: ");
    // Serial.println(OCR1A);
    TCCR1A |= (1<<COM1A0);
    // Set prescaler depending on OCR1A value
    // if (OCR1A <= 64) {
    //   TCCR1B |= (1 << CS11)| (1 << CS10);
    //   TCCR1B &= ~(1<<CS12);
    // }
    // else if (OCR1A <= 256) {
    //   TCCR1B |= (1 << CS12);
    //   TCCR1B &= ~(1<<CS11);
    //   TCCR1B &= ~(1<<CS10); 

    // }
    // else{
    //   TCCR1B |= (1 << CS12)| (1 << CS10);
    //   TCCR1B &= ~(1<<CS11);
    // }

  }
}

uint16_t return_OCR1A(uint16_t frequency){
  uint8_t bitbreite_timer = 256;
  // uint32_t F_CPU = 8000000;
  // prescalers = [64, 256, 1024]
  // F_CPU is the clock frequency
  // Derived from p.99 datasheet
  double val = 16000000 / 256;
  val /= frequency;
  // for(i=0; i<5; i++) {
	//   if (val <= prescalers[i]) {
  //     prescaler == prescalers[i];
  //     break;
  //   };

  // }
  ///Serial.println(val);
  return ceil(val);
}
