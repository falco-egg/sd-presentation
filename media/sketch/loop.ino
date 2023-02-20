rtc.get(&sec, &min, &hour, &day, &month, &year);

bmp_temp->getEvent(&temp_event);
bmp_pressure->getEvent(&pressure_event);

prnt_time(sec, min, hour, day, month, year);
logger.print(", ");
logger.print(hdc.readTemperature(); logger.print(" *C");
logger.print(", ");
logger.print(hdc.readHumidity()); logger.print("% RH");
logger.print(", ");
logger.print(pressure_event.pressure); logger.print(" hPa");
logger.print('\n');

logger.flush();
delay(10000);
