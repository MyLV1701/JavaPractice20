// get time and print out

package utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time{
	public static String getCurrentTime(DateFormat dateFormat){
		// dateFormat = dateFormat != null ? dateFormat : new SimpleDateFormat("HH:mm:ss");
		// if(){
			
		// }
		dateFormat = ((dateFormat != null) ? dateFormat : (new SimpleDateFormat(HH:mm:ss)));
		
		return dateFormat.format(new Date());
	}
	public static void main(String [] args)
	{
		Time t = new Time();
		System.out.println("test Time class : " + t.getCurrentTime(null));
		
	}
}

