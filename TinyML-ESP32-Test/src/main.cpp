#include <Arduino.h>
#include <Adafruit_MPU6050.h>
#include <Wire.h>

Adafruit_MPU6050 mpu;

// put function declarations here:

void setup() {
  Serial.begin(9600);
  delay(1000);

  Wire.begin(21, 22);

  Wire.beginTransmission(0x68);
  Wire.write(0x75);  // WHO_AM_I register
  Wire.endTransmission(false);

  Wire.requestFrom(0x68, 1);

  if (Wire.available()) {
    byte whoAmI = Wire.read();

    Serial.print("WHO_AM_I = 0x");
    Serial.println(whoAmI, HEX);
  } else {
    Serial.println("Could not read WHO_AM_I");
  }
}

void loop() {
  Wire.beginTransmission(0x68);
  Wire.write(0x3B);  // ACCEL_XOUT_H
  Wire.endTransmission(false);

  Wire.requestFrom(0x68, 6);

  if (Wire.available() == 6) {
    int16_t ax = (Wire.read() << 8) | Wire.read();
    int16_t ay = (Wire.read() << 8) | Wire.read();
    int16_t az = (Wire.read() << 8) | Wire.read();

    Serial.print("X: ");
    Serial.print(ax / 16384.0);
    Serial.print(",");

    Serial.print("  Y: ");
    Serial.print(ay / 16384.0);
    Serial.print(",");

    Serial.print("  Z: ");
    Serial.println(az / 16384.0);
    Serial.print(",");

  } else {
    Serial.println("Failed to read accelerometer");
  }

  delay(500);
}

// put function definitions here:
