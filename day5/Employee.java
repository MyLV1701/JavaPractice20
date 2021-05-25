public class Employee{
	
	private int id;
	String name;
	public String address;
	protected int balance;
		
	public void display(){
		System.out.println("Name :" + this.name + " " + "ID : " + this.id + " " + "address : " + this.address + " " + "balance : " + this.balance);
	}
	
	
	public static void main(String ... args){
		Employee e =  new Employee();
		
		System.out.println("ID : " + e.id);
		System.out.println("name : " + e.name);
		System.out.println("address : " + e.address);
		System.out.println("balance : " + e.balance);
		
		System.out.println(" display method show output : ");
		e.display();
	}
	
	
}
