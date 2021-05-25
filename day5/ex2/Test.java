public class Test{
	public static void main(String ... args){
		Snake sn = new Snake();
		Bird b = new Bird();
		Dog dg = new Dog();
		sn.go();
		sn.run();
		
		b.go();
		b.run();
		
		dg.go();
		dg.run();
	}
}
