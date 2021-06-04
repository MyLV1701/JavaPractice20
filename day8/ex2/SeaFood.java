import java.util.*;

public class SeaFood{

     public static void main(String ... args){
     
     	// adding 10 elements into SeaFodd menu
        Vector<String> menu = new Vector<String>();
        menu.add("Tom1");
        menu.add("Tom2");
        menu.add("Tom3");
        menu.add("Tom4");
        menu.add("Tom5");
        menu.add("Tom6");
        menu.add("Tom7");
        menu.add("Tom8");
        menu.add("Tom9");
        menu.add("Tom0");
                                        
        // print out all information inside vector
        for(String e : menu) System.out.print(e + "\t");
        System.out.println();
       
        // remove element index equal to 5 and print out size of menu
        menu.remove(4);
        System.out.println("size of vector after removing 5th element : " + menu.size());

        // replace 2nd element with "Cua Hoang De Alaska" and printout results
        menu.set(2, "Cua Hoang De Alaska");
        System.out.println("3rd element content : " + menu.get(2));

        // checking whether "Tom Hum Bo Lo Phomai" exist or not
        if(menu.contains("Tom hum bo lo phomai"))  System.out.println("Yes"); 
        else System.out.println("No"); 

        // take the first and last element
        System.out.println("The first element : " + menu.get(0));
        System.out.println("The first element : " + menu.get(menu.size() -1 ));

        // delete all
        menu.clear();
        System.out.println("size of vector after removing all : " + menu.size());

     }
     
}