public class exercise2 {
    public int MultiplyNumber(int a, int b){
        return (a*b);
    }

    public int MultiplyNumber(int a, int b, int c){
        return (a*b*c);
    }

    public static void main(String ... args){
        int x = 1;
        int y = 2;
        int z = 3;

        exercise2 ex2 = new exercise2();

        System.out.println("MultiplyNumber 2 parameters result : " + ex2.MultiplyNumber(x, y));

        System.out.println("MultiplyNumber 3 parameters result : " + ex2.MultiplyNumber(x, y, z));

    }
}
