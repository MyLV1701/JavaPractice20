import java.util.Scanner;

public class Person{
	
	private String name;
	private String address;
	private int    age;
	
	
	public void inputDetails(String name, String address, int age){
		this.name = name;
		this.address = address;
		this.age = age;
	}
	
	public void displayDetails(){
		
		System.out.println("\t The information you input as shown below:");
		System.out.println("\t Name : " + this.name);
		System.out.println("\t address : " + this.address);
		System.out.println("\t Age : " + this.age);
		
	}
	
	
public static void main(String ... args){
		
		String name;
		String address;
		int    age;
		
		Person  pTest = new Person();
		Scanner sc    = new Scanner(System.in);
		
		{
			System.out.println("please input your information ");
			System.out.println("Name ");
			name = sc.nextLine();
			System.out.println("address ");
			address = sc.nextLine();
			System.out.println("Age ");
			age = sc.nextInt();
		}
		
		pTest.inputDetails(name,address,age);
		pTest.displayDetails();
		
		
	}
}