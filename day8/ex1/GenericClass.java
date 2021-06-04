import java.util.*;

public class GenericClass<T>{
	
    public static <V> void printMth(Vector < ? extends Number> arr){

	   System.out.println("chieu dai cua mang :  " + arr.size());
	   for(Number e : arr) System.out.printf( e + "\t ");
       System.out.println("\n===================================================");
	}


}