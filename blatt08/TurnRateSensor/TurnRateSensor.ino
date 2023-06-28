// TurnRate Sensor: read data from analog gyroscope, output heading on lcd

/* Connections:
 R/S : Pin 11
 R/W : not connected
 E   : Pin 12
 DB4 : Pin 13
 DB5 : Pin A0
 DB6 : Pin A1
 DB7 : Pin A2
 
 
 Turn-Rate Sensor: A3
*/
// include LCD functions:
#include <LiquidCrystal.h> 

// define the LCD screen
LiquidCrystal lcd(11, 12, 13, A0, A1, A2);

// initialization
void setup()
{
   // LCD has 4 lines with 20 chars
   lcd.begin(20, 4); 
   lcd.print("system ready");

   lcd.setCursor(0,0);
   lcd.print("Analog 3: ");
  
}

void loop()
{  
   // read the current analog value on a3
   int16_t analogValue = analogRead(A3);
   // implement your code here:
   String analogValue_formatted = String(analogValue, DEC);
   while (analogValue_formatted.length() < 4) {
    analogValue_formatted = " " + analogValue_formatted;
  }
   lcd.setCursor(10, 1);
   lcd.print(analogValue_formatted);
   
   
}


/* Usefull LCD functions:
set the current write position of the lcd to specific line and row:
  lcd.setCursor(row, line);  

write onto lcd, starting at current position:
  lcd.print("abc");
*/
