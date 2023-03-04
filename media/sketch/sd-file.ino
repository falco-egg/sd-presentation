File datei = SD.open("datei.txt", FILE_WRITE);
if (datei) {
  datei.println("Hallo, SD-Karte!");
  datei.close();
} else {/* error */}

datei = SD.open("datei.txt", FILE_READ);
if (datei) {
  while(datei.available())
    Serial.write(datei.read());
  datei.close();
} else {/* error */}
