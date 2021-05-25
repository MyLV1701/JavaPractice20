package com.lincolnwdaniel.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Lincoln W Daniel on 5/22/2016.
 */
public class Time {
    public static String getCurrentDateTime(DateFormat dateFormat) {
        dateFormat = dateFormat != null ? dateFormat : new SimpleDateFormat("HH:mm:ss");
        return dateFormat.format(new Date());
    }
}


/*
		Serializing the Phone Book Entries
1/ get its file name and extension to instantiate a FileOutputStream with
2/ getEntries() -> return Collection of all of the PhoneBookEntry instances stored in our phone book
3/ 




our PhoneBook class isn’t directly responsible for saving and loading a phone book to and from a file on disk; the PhoneBookFileManager takes on that responsibility.

