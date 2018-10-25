
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

const int stepsPerRevolution = 200;  // change this to fit the number of steps per revolution
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
  buttonState = digitalRead(buttonPin2);
  buttonState2 = digitalRead(buttonPin3);

  // check if the pushbutton is pressed. If it is, the buttonState is HIGH:
  if (buttonState == HIGH) {
    // step one revolution  in one direction:
    Serial.println("clockwise");
    myStepper.step(stepsPerRevolution);
    delay(500);
  }
  if(buttonState2 == HIGH) {
    // step one revolution in the other direction:
    Serial.println("counterclockwise");
    myStepper.step(-stepsPerRevolution);
    delay(500);
  }
  delay(1000);
}
