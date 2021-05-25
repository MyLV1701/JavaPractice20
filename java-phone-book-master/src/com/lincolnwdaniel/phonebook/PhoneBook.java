package com.lincolnwdaniel.phonebook;

import com.lincolnwdaniel.utils.Logger;
import java.util.Collection;
import java.util.HashMap;

/**
 * A class to model phone books from.
 */
public class PhoneBook {
    //the name of the file to store this phone book in disk. Unchangeable
    private final String fileName;
    //Stores entries for this phone book. The entries of this map may be referred to as contacts
    private final HashMap<String,PhoneBookEntry> entriesMap = new HashMap<>();
    //the number of unsaved changes, such as new or removed contacts, to this phone book.
    private int numUnsavedChanges = 0;

    /**
     * Constructs a new phone book with the provided file name.
     * @param fileName The file name of the file to store this phone book in disk.
     */
    public PhoneBook(String fileName) {
        this.fileName = fileName;
    }

    /**
     *
     * @return the values, PhoneBookEntry's of this phone book.
     */
    public Collection<PhoneBookEntry> getEntries() {
        return entriesMap.values();
    }

    /**
     *
     * @return the name of the file at which this phone book will be stored in disk.
     */
    public String getFileName() {
        return fileName;
    }

    /**
     *
     * @return The number of contacts stored in this PhoneBook
     */
    public int getSize() {
        return entriesMap.size();
    }

    /**
     *
     * @return the number of unsaved changes to this PhoneBook
     */
    public int getNumUnsavedChanges() {
        return numUnsavedChanges;
    }

    /**
     * Attempts to add a new entry to the map of phone book entriesMap by name
     * after validating the name and number.
     * @param name The name of the contact
     * @param number The phone number of the contact
     * @return the result of the action.
     * ADDED or UPDATED means the contact was successfully added
     */
    public AddContactResult addContact(String name, String number/*, boolean isNew*/) {
        if(isValidName(name)){
            if(isValidPhoneNumber(number)){
                //make the name lowercase for consistency
                name = name.toLowerCase();

                AddContactResult result;

                PhoneBookEntry existingEntryByName = entriesMap.get(name);
                //check if the contact already exists in the map by name
                if(existingEntryByName != null){
                    //if so set their new number
                    existingEntryByName.setNumber(number);

                    //mark this contact as unsaved because its been changed
                    existingEntryByName.setIsNew(false);
                    //set the result of this method call to UPDATED
                    result = AddContactResult.UPDATED;
                } else {
                    //if not, create the new contact and add it to the map by name
                    entriesMap.put(name, new PhoneBookEntry(name, number/*, isNew*/));
                    //set the result of this method call to ADDED
                    result = AddContactResult.ADDED;
                }

                //increment the number of unsaved changes
                numUnsavedChanges++;
                //return the result of this method call
                return result;
            } else {
                //fail
                return AddContactResult.INVALID_NUMBER;
            }
        } else {
            //fail
            return AddContactResult.INVALID_NAME;
        }
    }

    /**
     * Adds the collection of PhoneBookEntry's loaded from disk into this PhoneBook.
     * @param phoneBookEntries The collection of contacts to load into this phone book.
     */
    public void addFromFile(Collection<PhoneBookEntry> phoneBookEntries) {
        if(phoneBookEntries != null) {
            for (PhoneBookEntry entry : phoneBookEntries) {
                if (entry != null) {
                    /*
                    You could call addContact() again
                    to revalidate the name and number of this contact in case the file was corrupted,
                    but we'll trust that its save to simply add the contact to the map.
                    addContact(entry.getName(), entry.getNumber(), false);
                     */
                    //bypass validation and add the contact to the map by name.
                    entriesMap.put(entry.getName(), entry);
                }
            }
        }
    }

    /**
     * Attempts to remove a contact from this PhoneBook by name
     * @param name The name of the contact
     * @return True if the contact was found and removed and false otherwise.
     */
    public boolean deleteContact(String name) {
        if(name != null) {
            //make the name lowercase for consistency
            name = name.toLowerCase();

            //try to remove the contact from the map by name
            boolean success = entriesMap.remove(name) != null;
            //if it was removed, increment the number of unsaved changes by one
            if (success) numUnsavedChanges++;
            //return the result of this method call
            return success;
        }

        //fail
        return false;
    }

    /**
     * Displays all of the contacts in this phone book
     */
    public void display() {
        if(!entriesMap.isEmpty()) {
            StringBuilder contacts = new StringBuilder();
            for (PhoneBookEntry contact : entriesMap.values()) {
                contacts.append(contact + " | ");
            }

            Logger.message("Contacts: \n\t" + contacts.toString());
        } else Logger.message("No contacts to display.");
    }

    /**
     * Returns whether or not the provided name is a valid name.
     * @param name The name to check
     * @return true if the provided name is a valid name and false otherwise.
     */
    public boolean isValidName(String name) {
        return name != null && !name.trim().isEmpty();
    }

    /**
     * Checks whether or not the provided number is a valid phone number
     * @param number The number to check
     * @return true if the provided number is a valid phone number
     */
    private boolean isValidPhoneNumber(String number) {
        return number != null && number.replace(" ", "").matches("[0-9]+") && number.length() > 7 && number.length() < 20;
    }

    /**
     * Tries to save this PhoneBook's contacts to disk
     * @return Returns true if the save was successful and false otherwise.
     */
    public boolean save() {
        boolean success = PhoneBookFileManager.save(this);
        if(success) numUnsavedChanges = 0;
        return success;
    }

    /**
     * Tries to load a PhoneBook from disk
     * @param fileName the name of the file to load the PhoneBookEntry's from
     * @return The loaded PhoneBook or null if none.
     */
    public static PhoneBook load(String fileName) {
        return PhoneBookFileManager.load((fileName));
    }

    /**
     * Enum representing the types of results that can be returned from a call to addContact()
     */
    public enum AddContactResult {
        ADDED, UPDATED, INVALID_NAME, INVALID_NUMBER
    }
}
