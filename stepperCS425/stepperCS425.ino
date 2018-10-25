
/*
 Stepper Motor Control - one revolution

 This program drives a unipolar or bipolar stepper motor.
 The motor is attached to digital pins 8 - 11 of the Arduino.

 The motor should revolve one revolution in one direction, then
 one revolution in the other direction.


 Created 11 Mar. 2007
 Modified 30 Nov. 2009
 by Tom Igoe

 */

#include <Stepper.h>

const int buttonPin2 = 2;     // the number of the pushbutton pin
const int buttonPin3 = 3;
// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status
int buttonState2 = 0;         // variable for reading the pushbutton status

const int stepsPerRevolution = 150;  // change this to fit the number of steps per revolution
const unsigned long  debounceMillis = 100;
unsigned long  lastDebounce1 = 0;
unsigned long  lastDebounce2 = 0;
// for your motor

// initialize the stepper library on pins 8 through 11:
Stepper myStepper(stepsPerRevolution, 8, 9, 10, 11);

void setup() {
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  // set the speed at 60 rpm:
  myStepper.setSpeed(60);
  // initialize the serial port:
  Serial.begin(9600);
  
}

void loop() {
  // read the state of the pushbutton value:
  int runOnce=0;
  int oldButton = buttonState;
  int oldButton2 = buttonState2;
  buttonState = digitalRead(buttonPin2);
  buttonState2 = digitalRead(buttonPin3);
  Serial.println(buttonState);
  Serial.println(buttonState2);
  if (oldButton != buttonState)
  {
      lastDebounce1 = millis();
  }
  if (oldButton2 != buttonState2)
  {
      lastDebounce2 = millis();
  }
  if (buttonState == HIGH && ((millis()-lastDebounce1)>debounceMillis) && runOnce==0) {
      // step one revolution  in one direction:
      Serial.println("clockwise");
      myStepper.step(stepsPerRevolution);
      runOnce=1;
      delay(10);
    }
  
  if(buttonState2 == HIGH && ((millis()-lastDebounce2)>debounceMillis)&& runOnce==0) {
    // step one revolution in the other direction:
    Serial.println("counterclockwise");
    myStepper.step(-stepsPerRevolution);
    runOnce=1;
    delay(10);
  }
  //delay(1000);
}
