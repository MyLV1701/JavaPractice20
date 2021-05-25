public class Bike extends Vehicle{
	Bike(){
	   price = 500; 
	   color = "yellow";
	}
	
	public void printDetails(){
		System.out.println("hi guys, I am Bike");
		System.out.println("price : " + this.price);
		System.out.println("color : " + this.color);
	}
	
	public void accelerate(){
		
	}
	
}
