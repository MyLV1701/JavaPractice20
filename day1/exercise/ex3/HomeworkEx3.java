import java.util.Scanner;

class HomeworkEx3{
    public static void main(String arg[]){
        
        Scanner scanner = new Scanner(System.in);
        int number = 0;
        
        System.out.println("Please input your number :");
        while(!scanner.hasNextInt()){
            System.out.println("That is not a integer number");
            scanner.next();
        }
        number = scanner.nextInt();
        
        System.out.println("input number : " + number);
        
        
        if(number == 0){
            System.out.println("input number equal to ZERO ");
        }
        else if(isPositiveNumber(number)){
            System.out.println("input number is POSITIVE number ");
        }
        else{
            System.out.println("input number is NEGATIVE number ");
        }
        
        
        if(isOddNumber(number)){
            System.out.println("and an ODD number ");
        }
        else{
            System.out.println("and an EVEN number ");
        }
        
    }
    
    public static boolean isOddNumber(int n){
        if((n % 2) > 0){
            return true;
        }
        return false;
    }
    
    public static boolean isPositiveNumber(int n){
        if(n > 0){
            return true;
        }
        return false;
    }
}