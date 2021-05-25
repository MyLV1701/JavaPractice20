public class test{
	public static void main(String ... args){
		
		Bus bus = new Bus();
		Car car = new Car();
		Bike bike = new Bike();
		
		System.out.println(" *************************************** ");
		System.out.println(" =========== BUS information =========== ");
		System.out.println(" *************************************** ");
		bus.printDetails();
		
		System.out.println(" *************************************** ");
		System.out.println(" =========== CAR information =========== ");
		System.out.println(" *************************************** ");
		car.printDetails();
		
		System.out.println(" *************************************** ");
		System.out.println(" =========== BIKE information =========== ");
		System.out.println(" *************************************** ");
		bike.printDetails();
	}
	
}


