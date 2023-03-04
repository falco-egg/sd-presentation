#ifndef __WEATHER_UTIL__
#define __WEATHER_UTIL__

#include <SD.h>

#define u8 uint8_t
#define u16 uint16_t

class logger {
    bool sd = false, serial = false;
    File sdFile;
    char* filename = 0;

  public:
    init(char* filename) {
      if (Serial) serial = true;

      sdFile = SD.open(filename, FILE_WRITE);
      if (sdFile) {
        this->filename = new char [strlen(filename)];
        strcpy(this->filename, filename);
        sd = true;
      }

      Serial.print("initialized logger:\n");
      Serial.print("sd: "); Serial.print(sd);
      Serial.print("\tserial: "); Serial.print(serial);
      Serial.print("\n\n");
    };

    ~logger() {
      sd_close();
    }

    template<typename T>
    void print(T input) {
      if (sd) sdFile.print(input);
      if (serial) Serial.print(input);
    }

    template<typename T>
    void println(T input) {
      if (sd) sdFile.println(input);
      if (serial) Serial.println(input);
    }

    void dump() {
      bool sd = sdFile ? true : false;
      sdFile.close();

      File dump = SD.open(filename, FILE_READ);
      if (dump) {
        while (dump.available())
          Serial.write(dump.read());

        Serial.flush();
        dump.close();
      }
      else if (serial) {
        Serial.println("couldn't dump log");
      }

      if (sd) sdFile = SD.open(filename, FILE_WRITE);
    }

    void clear_log() {
      if (sd) {
        sdFile.close();
        SD.remove(filename);
        sdFile = SD.open(filename, FILE_WRITE);
      }
    }

    void flush() {
      sdFile.flush();
    }

    void sd_close() {
      sdFile.close();
      sd = false;

      if (filename) {
        delete[] filename;
        filename = 0;
      }
    }
};

void err() {
  while (1);
}

#endif
