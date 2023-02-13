#include <Wire.h>
#include <SPI.h>
#include <SD.h>

// https://github.com/watterott/Arduino-Libs
#include <RV8523.h>

#include <Adafruit_HDC1000.h>
#include <Adafruit_BMP280.h>

#include "util.h"

RV8523 rtc;

Adafruit_HDC1000 hdc = Adafruit_HDC1000();

Adafruit_BMP280 bmp;
Adafruit_Sensor *bmp_temp = bmp.getTemperatureSensor();
Adafruit_Sensor *bmp_pressure = bmp.getPressureSensor();
sensors_event_t temp_event, pressure_event;

logger logger;

const int sd_chipselect = 4;

void setup() {
  Serial.begin(9600);
  while (!Serial);

  Serial.println("\n\nStarting Weather Station UwU");

  rtc.begin();
  rtc.set24HourMode();
  //rtc.set(0, 49, 12, 06, 02, 2023); // sec, min, hour, day, month, year
  rtc.start();
  rtc.batterySwitchOver(1);

  if (!SD.begin(sd_chipselect)) {
    Serial.println("Couldn't initialize SD-Card");
    err();
  }

  if (!hdc.begin()) {
    Serial.println("Couldn't initialize HDC100x");
    err();
  }

  if (!bmp.begin()) {
    Serial.println("Couldn't initialize BMP280");
    err();
  }

  bmp.setSampling(Adafruit_BMP280::MODE_NORMAL,     /* Operating Mode. */
                  Adafruit_BMP280::SAMPLING_X2,     /* Temp. oversampling */
                  Adafruit_BMP280::SAMPLING_X16,    /* Pressure oversampling */
                  Adafruit_BMP280::FILTER_X16,      /* Filtering. */
                  Adafruit_BMP280::STANDBY_MS_500); /* Standby time. */

  logger.init("data.txt");
}

void loop() {
  u8 sec, min, hour, day, month; u16 year;
  rtc.get(&sec, &min, &hour, &day, &month, &year);

  bmp_temp->getEvent(&temp_event);
  bmp_pressure->getEvent(&pressure_event);

  prnt_time(sec, min, hour, day, month, year);
  logger.print(", ");
  logger.print((hdc.readTemperature() + temp_event.temperature) / 2.); logger.print(" °C");
  logger.print(", "); logger.print(hdc.readHumidity()); logger.print("% RH");
  logger.print(", "); logger.print(pressure_event.pressure); logger.print(" hPa");

  logger.print('\n');
  logger.flush();

  delay(10000);
}

inline void prnt_time(u8 sec, u8 min, u8 hour, u8 day, u8 month, u16 year) {
  logger.print(year);
  logger.print('-');
  if (month < 10) logger.print('0');
  logger.print(month);
  logger.print('-');
  if (day < 10) logger.print('0');
  logger.print(day);
  logger.print('T');
  if (hour < 10) logger.print('0');
  logger.print(hour);
  logger.print(':');
  if (min < 10) logger.print('0');
  logger.print(min);
  logger.print(':');
  if (sec < 10) logger.print('0');
  logger.print(sec);
}
