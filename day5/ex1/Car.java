package ex1;

public class Car extends Vehicle {
	Car(){
	   price = 3000; 
	   color = "Red";
	}
	
	public void printDetails(){
		System.out.println("hi guys, I am Car");
		System.out.println("price : " + this.price);
		System.out.println("color : " + this.color);
	}
	
	public void accelerate(){
		
	}

}


