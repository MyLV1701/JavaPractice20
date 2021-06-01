import interF.*;

public class exercise1 implements Television{
    public void display(){
        System.out.println("Television price : " + Television.price);
    }

    public static void main(String ... args){
        
        exercise1 ex1 = new exercise1();
        ex1.display();

    }
}
