package com.lincolnwdaniel.phonebook;

import java.io.Serializable;

import static java.lang.String.format;

/**
 * A class to model contacts stored in a phone book (PhoneBook)
 */
class PhoneBookEntry implements Serializable {
    //the name of this contact.
    private final String name;
    //the number of this contact.
    private String number;
    //whether or not this contact is new and unsaved. Won't be serialized.
    private transient boolean isNew;

    /**
     * Constructs a new contact with the provided name and number.
     * @param name The name of this contact.
     * @param number The number of this contact.
     */
    public PhoneBookEntry(String name, String number/*, boolean isNew*/) {
        this.name = name;
        this.number = number;
        this.isNew = true;
    }

    /**
     * Sets the number of this contact
     * @param number The new number for this contact.
     */
    public void setNumber(String number) {
        this.number = number;
    }

    /**
     *
     * @return Returns the name of this contact
     */
    public String getName() {
        return name;
    }

    /**
     * Toggles whether or not this contact is isNew.
     * @param isNew
     */
    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }

    /**
     *
     * @return Returns a string representation of this contact.
     */
    @Override
    public String toString() {
        return format("< %s: %s %s >", name, number, isNew ? "| new": "");
    }
}
