import java.util.*;

public class shopping{
    private static shoppingManagement sp;

    public static void main(String ... args){
        // create new shopping management
        sp = new shoppingManagement();

        for(;;){
            show();
            userOptionHandle();
        }
    }

    public static void userOptionHandle(){
        Scanner sc = new Scanner(System.in);
        int usrpption = sc.nextInt();
        sc.nextLine();
        switch(usrpption){
            case 1:
                System.out.println("option 1 selected ------ buy more items ------");
                sp.buyItems();
                break;
            case 2:
                System.out.println("option 2 selected ------ removing ------");
                sp.removeItems();
                break;
            case 3:
                System.out.println("option 3 selected ------ purchase ------ ");
                sp.payment();
                break;
            case 4:
                System.out.println("option 4 selected ------ update ------");
                sp.updateMenu();
                break;
            case 5:
                System.out.println("option 5 selected ------ searching ------ ");
                sp.searchItems();
                break;
            case 6:
                System.out.println("option 6 selected ------ Show info ------ ");
                sp.viewShoppingItems();
                break;
            case 7:
            default:
                System.exit(100);
        }
    }

    public static void show(){
        System.out.println("\n================== S H O P P I N G ================== ");
        System.out.println("Please choose one of below options: ");
        System.out.println("\t Enter '1' : buy items ");
        System.out.println("\t Enter '2' : remove items ");
        System.out.println("\t Enter '3' : payment ");
        System.out.println("\t Enter '4' : update menu ");
        System.out.println("\t Enter '5' : searching ");
        System.out.println("\t Enter '6' : view shopping menu ");
        System.out.println("\t Enter '7' : exit ");
        System.out.println(" ==================  *  *  * ================== \n");
    }
}
