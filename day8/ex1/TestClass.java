import java.util.*;


public class TestClass{
    public static void main(String... args){
        System.out.println("for Integer variable");
        Vector<Integer> v1 =  new Vector<>();
        v1.add(1);
        v1.add(12);
        GenericClass<Integer> c1 = new GenericClass<Integer>();
        c1.printMth(v1);

        System.out.println("for Double variable");
        Vector<Double> v2 =  new Vector<>();
        v2.add(1.2);
        v2.add(12.02);
        v2.add(5.06);
        GenericClass<Double> c2 = new GenericClass<Double>();
        c2.printMth(v2);

        System.out.println("for Float variable");
        Vector<Float> v3 =  new Vector<>();
        v3.add(new Float(1.1));
        v3.add(new Float(3.6));
        GenericClass<Float> c3 = new GenericClass<Float>();
        c3.printMth(v3);
    }
}
