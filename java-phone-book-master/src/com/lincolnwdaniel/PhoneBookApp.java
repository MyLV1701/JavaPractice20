package com.lincolnwdaniel;

import com.lincolnwdaniel.phonebook.PhoneBook;
import com.lincolnwdaniel.utils.Logger;

import java.util.Scanner;

import static java.lang.String.format;

/**
 * A program that emulates a phone book application in the console.
 */
public class PhoneBookApp {
    //the name of the file to save and or load a phone book to or from
    private static String phoneBookFileName = "default-phone-book";
    //the phone book to store all the user's contacts
    private static PhoneBook phoneBook;
    //initialize a Scanner to capture user input
    private static Scanner userInputScanner = new Scanner(System.in);

    /**
     * Starts the program with the provided arguments.
     * @param args Arguments from the command line to start the program with.
     */
    public static void main(String[] args) {
        Logger.message("Starting Phone Book App!");
        loadPhoneBook();

        //forever
        for(;;) {
            //show the menu
            showMenu();
        }
    }

    /**
     * Attempts to load a previously saved phone book from the file with name matching phoneBookFileName
     */
    private static void loadPhoneBook() {
        Logger.prompt("Where do you want to load your phone book from? File name: ");
        if(userInputScanner.hasNextLine()) phoneBookFileName = userInputScanner.nextLine();

        //try to load the user's phone book with the file name
        phoneBook = PhoneBook.load(phoneBookFileName);
        if(phoneBook != null) {
            //great, the phone book was loaded
            Logger.message(format("Loaded your %s phone book of %d contacts.", phoneBookFileName, phoneBook.getSize()));
            phoneBook.display();
        } else {
            //no phone book loaded. create new one
            phoneBook = new PhoneBook(phoneBookFileName);
            Logger.message("Opened a new phone book at " + phoneBookFileName);
        }
    }

    /**
     * Shows the user a menu of actions they can perform in this program
     */
    private static void showMenu() {
        Logger.message("Menu: " +
                        "\n\t\tEnter | Action" +
                        "\n\t\t" + UserOption.VIEW_CONTACTS.getKey() + " to \t" + UserOption.VIEW_CONTACTS.getDescription() +
                        "\n\t\t" + UserOption.ADD_CONTACT.getKey() + " to \t" + UserOption.ADD_CONTACT.getDescription() +
                        "\n\t\t" + UserOption.DELETE_CONTACT.getKey() + " to \t" + UserOption.DELETE_CONTACT.getDescription() +
                        "\n\t\t" + UserOption.SAVE.getKey() + " to \t" + UserOption.SAVE.getDescription() +
                        "\n\t\t" + UserOption.SAVE_QUIT.getKey() + " to \t" + UserOption.SAVE_QUIT.getDescription() +
                        "\n\t\t" + UserOption.QUIT.getKey() + " to \t" + UserOption.QUIT.getDescription()
        );

        Logger.prompt("What do you want to do?");
        handleUserMenuSelection();
    }

    /**
     * Handles the user's last menu selection.
     */
    private static void handleUserMenuSelection() {
        if(userInputScanner.hasNextLine()) {
            String userSelection = userInputScanner.nextLine();
            int numUnsavedChanges = phoneBook.getNumUnsavedChanges();
            String name = "",  phone = "";

            UserOption selectedUserOption = UserOption.getByKey(userSelection);
            if(selectedUserOption != null) {
                switch (selectedUserOption) {
                    case VIEW_CONTACTS:
                        //display the phonebook
                        phoneBook.display();
                        break;
                    case ADD_CONTACT:
                        Logger.prompt("Name:");
                        if(userInputScanner.hasNextLine()) {
                            name = userInputScanner.nextLine();
                            Logger.prompt("Phone Number:");
                            if(userInputScanner.hasNextLine()) {
                                String number = userInputScanner.nextLine();

                                //try to add the contact to the phone book
                                PhoneBook.AddContactResult result = phoneBook.addContact(name, number/*, false*/);
                                switch (result) {
                                    case ADDED:
                                        Logger.message("Added " + name);
                                        break;
                                    case UPDATED:
                                        Logger.message("Updated " + name);
                                        break;
                                    case INVALID_NAME:
                                        Logger.message("\"" + name + "\" is not a valid name.");
                                        break;
                                    case INVALID_NUMBER:
                                        Logger.message("" + number + " is not a valid phone number.");
                                        break;
                                }
                            }
                        }
                        break;
                    case DELETE_CONTACT:
                        Logger.prompt("Name:");
                        if(userInputScanner.hasNextLine()) {
                            name = userInputScanner.nextLine();

                            //try to delete the contact from the phone book
                            if(phoneBook.deleteContact(name)) Logger.message("Deleted " + name);
                            else Logger.message("Failed to delete " + name);
                        }
                        break;
                    case SAVE:
                        //try to save the phone book
                        if (phoneBook.save()) Logger.message("Saved " + numUnsavedChanges + " changes.");
                        else Logger.message("Failed to save " + numUnsavedChanges + " changes.");
                        break;
                    case SAVE_QUIT:
                        if (numUnsavedChanges > 0) {
                            //try to save the phone book before ending program
                            if(phoneBook.save()) Logger.message("Saved " + numUnsavedChanges + " changes.");
                            else Logger.message("Failed to save " + numUnsavedChanges + " changes.");
                        } else Logger.message("No changes to save.");

                        Logger.message("Goodbye!");

                        //end the program
                        System.exit(100);
                        break;
                    case QUIT:
                        Logger.message("Not saving " + numUnsavedChanges + " changes. Goodbye!");
                        //end the program
                        System.exit(100);
                    default:
                        Logger.message(userSelection + " is an invalid selection.");
                }
            }
        }
    }

    /**
     * An enum representing the types of options
     * the user can choose from in the menu to perform actions.
     */
    private enum UserOption {
        VIEW_CONTACTS("1","View Contacts"),
        ADD_CONTACT("2", "Add Contact"),
        DELETE_CONTACT("3", "Delete Contact"),
        SAVE("4", "Save"),
        SAVE_QUIT("*", "Save and Quit"),
        QUIT("#", "Quit");

        private final String description;
        private String key;

        UserOption(String key, String s) {
            this.key = key;
            this.description = s;
        }

        public String getDescription() {
            return description;
        }

        public String getKey() {
            return key;
        }

        public static UserOption getByKey(String key){
            for(UserOption userOption : values()){
                if( userOption.getKey().equals(key)){
                    return userOption;
                }
            }
            return null;
        }
    }
}
