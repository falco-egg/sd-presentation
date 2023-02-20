rtc.begin();
rtc.start();

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
