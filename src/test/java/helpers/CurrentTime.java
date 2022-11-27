package helpers;

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;  

public class CurrentTime {  
  public static String getTimeString() {  
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmssms");
   LocalDateTime now = LocalDateTime.now();
   return dtf.format(now);
  }  
}  
