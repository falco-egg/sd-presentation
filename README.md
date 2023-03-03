<h1 align="center">SD-Präsentation</h1>


Eine Präsentation zur nichtflüchtigen Datenspeicherung in integrierten Systemen :floppy_disk::

- Motivation & Einführung der SD-Karte
- Hardware-Aspekte
- Software-Lösungen (Arduino `SD.h`)
- Beispielprojekt &ndash; die Wetterstation


![micro-sd card](/media/title_edit.jpg)


<h2 align="center">Bau des Beispielprojekts Wetterstation</h2>

Das Beispielprojekt "[Wetterstation](/weather_station)" kann mithilfe der [Arduino Software](https://www.arduino.cc/en/software) gebaut werden.
Dazu werden außerdem die "Arduino-SD", "Adafruit-HDC1000" und "Adafruit-BMP280" Libraries aus dem Library Manager, sowie die [Watterott electronic RV8523](https://github.com/watterott/Arduino-Libs) Library benötigt.

<h2 align="center">Bau der Dokumente</h2>

Die Präsentation und das Handout sind in LaTeX geschrieben.
Eine TeX Distribution wie `texlive`, sowie eine Anzahl an [ctan](https://ctan.org/?lang=en) Packeten werden benötigt.
Zum Bau der Bibliografie wird ebenfalls `biber` gebraucht.

### linux

GNU `make` baut mit der [Makefile](Makefile) vollautomatisch die Präsentation und das Handout als PDF:

`$ git clone https://github.com/falco-egg/sd-presentation && cd sd-presentation`  
`$ make`
