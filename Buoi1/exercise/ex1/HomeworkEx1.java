import static java.lang.Math.*;
import java.util.Scanner;

class HomeworkEx1{
    public static void main(String arg[]){
        
        Scanner scanner = new Scanner(System.in);
        double dAvgOfNumber3 = 0;
        double sumOfNumbers = 0;
		
		
        System.out.println("Please input your number :");
        
		for (int idx = 0; idx < 3 ; idx++){
			System.out.println("number index :" + idx);
			while(!scanner.hasNextDouble()){
				System.out.println("That is not a double number, try again plz");	
				scanner.next();
			}
			sumOfNumbers += scanner.nextDouble();
		}
		
		System.out.println("sum of three input number equal to :" + sumOfNumbers);
		System.out.println("average of three input number :" + (double)Math.round((sumOfNumbers/3)*100)/100);
		
    }
}