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
long avg_val = 0;
long heading_int = 0;
long current_time = millis();
long new_current_time = 0;
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
   for (int idx = 0;  idx < 10; idx++){
    avg_val = avg_val + analogRead(A3);
   }
   avg_val = avg_val / 10;

   //lcd.setCursor(0,3);
   //lcd.print("Average: " + String(avg_val, DEC));
   lcd.setCursor(0,3);
   lcd.print("Degrees: ");
}

void loop()
{  
   // read the current analog value on a3
   int16_t analogValue = analogRead(A3)-avg_val;
   if (abs(analogValue) < 5){
      analogValue = 0;
   }
   // implement your code here:
   String analogValue_formatted = String(analogValue, DEC);
   while (analogValue_formatted.length() < 4) {
    analogValue_formatted = " " + analogValue_formatted;
  }
   lcd.setCursor(9, 0);
   lcd.print(analogValue_formatted);

   new_current_time = millis();
   int time_passed = new_current_time - current_time;
   current_time = new_current_time;
   heading_int = heading_int + analogValue * time_passed;
   lcd.setCursor(0,1);
   lcd.print(time_passed);
   lcd.setCursor(0,2);
   lcd.print(String(heading_int, DEC));
   
   double val = heading_int * 1.0 / 1130000 * 360;
   int current_degrees = val;
   if (current_degrees < 0){
      current_degrees = 360 - (abs(current_degrees) % 360);
   } else{
       current_degrees = current_degrees % 360;
   }
   String current_degrees_formatted = String(current_degrees, DEC);
   while (current_degrees_formatted.length() < 4) {
     current_degrees_formatted = " " + current_degrees_formatted;
   }
   lcd.setCursor(9,4);
   lcd.print(current_degrees_formatted);
}


/* Usefull LCD functions:
set the current write position of the lcd to specific line and row:
  lcd.setCursor(row, line);  

write onto lcd, starting at current position:
  lcd.print("abc");
*/
