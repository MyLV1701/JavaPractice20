import java.util.*;

public class shoppingManagement{
    private final Hashtable<String, product> shoppingMenu = new Hashtable<>();

    public void buyItems(){
        Scanner sc = new Scanner(System.in);
        
        System.out.println("enter items type : ex food, clothes ....");
        String type = sc.nextLine();
        String name = type;

        System.out.println("enter Item's ID : ");
        int id = sc.nextInt();
        sc.nextLine();

        // System.out.println("enter Item's Name : ");
        // String name = sc.nextLine();

        System.out.println("enter Item's Price : ");
        double price = sc.nextDouble();
        sc.nextLine();
        
        System.out.println("enter Item's Quantity : ");
        int quantity = sc.nextInt();
        sc.nextLine();

        //product(id, name, price, quantity)
        shoppingMenu.put(type, new product(id, name, price, quantity));
    }

    public void removeItems(){
        
        System.out.println("enter items want to DELETE : ex food, clothes ....");
        Scanner sc = new Scanner(System.in);
        String type = sc.nextLine();

        if(!shoppingMenu.isEmpty()){
            shoppingMenu.remove(type);
        }
        else{
            System.out.println("have no entered item in your shopping menu, double check plz");
        }
    }

    public void payment(){
        
        if(!shoppingMenu.isEmpty()){
            double total = 0;
            List<product> listItems =  new ArrayList<product>(shoppingMenu.values());
            for(product e : listItems){
                total += e.getPrice() * e.getQuantity();
            }
            System.out.printf("Thank you very much for shopping, total payment : %.2f USD \n",total);
        }
        else{
            System.out.println("have no entered item's type in your shopping menu, double check plz");
        }
    }

    public void updateMenu(){
        System.out.println("enter items want to DELETE : ex food, clothes ....");
        Scanner sc = new Scanner(System.in);
        String type = sc.nextLine();

        System.out.println("enter you wanna quantity : ");
        int itemNum = sc.nextInt();
        sc.nextLine();

        product rst = shoppingMenu.get(type);

        if((!shoppingMenu.isEmpty()) && (rst != null)){
            rst.setQuantity(itemNum);
        }
        else{
            System.out.println("have no entered item in your shopping menu, double check plz");
        }
    }

    public void searchItems(){
        System.out.println("enter items price you want to find out");
        Scanner sc = new Scanner(System.in);
        double seachPrice = sc.nextDouble();
        sc.nextLine();
        if(!shoppingMenu.isEmpty()){
            int matchedItemsCnt = 0;
            List<product> listItems = new ArrayList<product>(shoppingMenu.values());
            for(product e : listItems){
                if(e.getPrice() > seachPrice){
                    matchedItemsCnt++;
                    if(matchedItemsCnt == 1) System.out.printf("%4s | %20s | %10s | %10s | \n","ID" ,"NAME", "PRICE","QUANTITY");
                    System.out.printf("%4d | %20s | %10.2f | %10d |",e.getId() ,e.getName(), e.getPrice(),e.getQuantity());
                    System.out.println();
                }
            }

            if(matchedItemsCnt == 0) System.out.println("there is no items greater than your entered price");
        }
        else{
            System.out.println("have no entered item in your shopping menu, double check plz");
        }
    }

    public void viewShoppingItems(){
        if(!shoppingMenu.isEmpty()){
            List<product> listItems = new ArrayList<product>(shoppingMenu.values());
            System.out.printf("The following shopping menu content :\n");
            System.out.printf("%4s | %20s | %10s | %10s | \n","ID" ,"NAME", "PRICE","QUANTITY");
            for(product e : listItems){
                System.out.printf("%4d | %20s | %10.2f | %10d |\n",e.getId() ,e.getName(), e.getPrice(),e.getQuantity());
            }
        }
        else{
            System.out.println("have no entered item in your shopping menu, double check plz");
        }
    }
}