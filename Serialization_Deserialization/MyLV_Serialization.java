
import java.io.*;

class person implements Serializable{
    private String name;            // MyLV
    private transient int age;      // 30, 40
    private static String gender;   // female + Male
    private String occupation;      // Worker

    public person(String name, int age, String gender, String occupation){
        this.name = name;
        this.age = age;
        this.occupation = occupation;
        person.gender = gender;
    }

    public String getName() {
        return this.name;
    }

    public int getAge() {
        return this.age;
    }

    public String getOcupation() {
        return this.occupation;
    }

    public static String getGender() {
        return person.gender;
    }
}

public class MyLV_Serialization {

    // create object
    // Creat new method to print out information 
    // 

    private static void showInfo(person objectPerson){
        System.out.println("Name        : " + objectPerson.getName());
        System.out.println("Age        : " + objectPerson.getAge());
        System.out.println("Gender      : " + person.getGender());
        System.out.println("Occupation  : " + objectPerson.getOcupation());
    }

    public static void main(String[] args){


        // initilize object with specified information file
        person p1 = new person("MyLV", 30, "Male", "Software Engineer");
        // create file to store data in serilization way
        String fileName = "MyLV_Serialization_Deserialization.txt";


        try{
            FileOutputStream fName = new FileOutputStream(fileName);
            ObjectOutputStream objOut = new ObjectOutputStream(fName);

            // write infomation into fileName
            objOut.writeObject(p1);
            objOut.close();
            fName.close();

            System.out.println("The following data before deserialization :");
            showInfo(p1);
        }
        catch (IOException e){
            System.out.println("Have an error ");
        }

        p1 = null;

        System.out.println(" release object : ");

        try{
            // Deserialization data form txt file file
            FileInputStream file_name = new FileInputStream(fileName);
            ObjectInputStream object_input = new ObjectInputStream(file_name);

            // must to casting type of object
            p1 = (person)object_input.readObject();
            object_input.close();
            file_name.close();

            System.out.println(" information after deserialization : ");
            showInfo(p1);

        }
        catch(IOException err){
            System.out.println("Have an Error occured");
        }
        catch (ClassNotFoundException e){
            System.out.println("Have an Error relate to 'ClassNotFoundException' occured");
        }
    }
}
