package com.lincolnwdaniel.utils;

/**
 * Created by Lincoln W Daniel on 5/22/2016.
 */
public class Logger {
    /**
     * Prints a event to the system's console
     *
     * @param event
     */
    public static void message(String event) {
        System.out.print(Time.getCurrentDateTime(null) + " message > " + event);
        System.out.println("\n");
    }

    public static void debug(String event) {
        System.out.print(Time.getCurrentDateTime(null) + " debug > " + event);
        System.out.println("\n");
    }

    public static void prompt(String event) {
        System.out.print(Time.getCurrentDateTime(null) + " prompt > " + event);
        System.out.println("\n");
    }
}
