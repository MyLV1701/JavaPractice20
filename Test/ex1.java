// package Test;
// import Test.aquarium.*;
// import Test.aquarium.jellies.Tank;

// public class ex1 {
	
	// // public static void main(String ... args){
	// public static void main(String[] args) {
		// Tank tank = new Tank();	
		// ex1 t = new ex1();
		// t.test();
	// }
	
	// public void test(){
		// int a;
		
		// System.out.println("test value : " + a);
		
	// }
// }

public class ex1 {
	
	protected void finalize(){
		System.out.println("Roar!!!!!!!!!!!!!!!");
	}
	public static void main(String ... args){
		int x = 0;
		while(x++ < 10){};
		
		String msg = x > 10 ? "greater than" : valueOf(false);
		
		System.out.println("Roar!!!!!!!!!!!!!!!" + msg);
	}
}