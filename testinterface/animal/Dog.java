/*Dog.java*/
package animal;
import animal.inteface.*;

public class Dog implements Animal,Eat
{
	int movesteps=2;
	String food="MEAT";
	
	Dog()
	{
		move();
		food();
	}
	
	public void move()
	{
		System.out.println("I am a dog i can move just "+this.movesteps+" steps/sec");

	}
	public void food()
	{
		System.out.println("I am a dog i only eat "+this.food);

	}
	public static void main(String args[])
	{

		Dog myDoggy=new Dog();

		System.exit(0);

	}
}