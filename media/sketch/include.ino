#include <SD.h>
#include <SPI.h>
#include <Wire.h>

#include <Adafruit_BMP280.h>
#include <Adafruit_HDC1000.h>

// https://github.com/watterott/Arduino-Libs
#include <RV8523.h>

RV8523 rtc;

Adafruit_HDC1000 hdc = Adafruit_HDC1000();

Adafruit_BMP280 bmp;
sensors_event_t temp_event, pressure_event;

const int sd_chipselect = 4;
