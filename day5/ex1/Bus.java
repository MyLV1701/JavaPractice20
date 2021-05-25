package ex1;

public class Bus extends Vehicle{
	Bus(){
	   price = 5000; 
	   color = "Blue";
	}
	
	public void printDetails(){
		System.out.println("hi guys, I am Bus");
		System.out.println("price : " + this.price);
		System.out.println("color : " + this.color);
	}
	
	public void accelerate(){
		
	}
	
}


