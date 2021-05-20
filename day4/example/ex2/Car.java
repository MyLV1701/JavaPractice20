public class Car{
	
	private int price;
	private String color;
	private String type;
	
	Car(){
		price = 2000;
		color = "Blue";
		type  = "SUV";
	}
	
	Car(int price, String color, String type){
		this.price = price;
		this.color = color;
		this.type  = type;
	}
	
	public void displayDetails(){
		System.out.println("\t price : " + this.price + "\t color : " + this.color + "\t type : " + this.type);
	}
	
public static void main(String ... args){
		int price = 10000;
		String color = "P!nk";
		String type = "Sedan";
		
		Car car1 = new Car();
		System.out.println("Instance of Car constructor without parameters : ");
		car1.displayDetails();
		
		System.out.println("The Instance of Car constructor have parameters : ");
		car1 = new Car(price, color, type);
		car1.displayDetails();
	}
}