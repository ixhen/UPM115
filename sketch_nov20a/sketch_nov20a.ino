 
  //Universal 8bit Graphics Library, http://code.google.com/p/u8glib/
  
#include "U8glib.h"

//U8GLIB_SSD1306_128X64 u8g(14,13,15,4,5);

U8GLIB_SSD1306_128X64 u8g(13,11,2,3,4);


void setup(void) {

  u8g.setFont(u8g_font_6x10);
  u8g.setColorIndex(1); 
}

void loop(void) {

  u8g.firstPage();
  do { 
    u8g.drawStr(20,20,"Hello Madrid");
 } while( u8g.nextPage() ); 

}
