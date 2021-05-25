Bài 1:
Hãy phát triển chương trình Java cho phép cài đặt tính thừa kế. Định nghĩa một lớp
Vehicle thể hiện các phương tiện, trong lớp này gồm 2 thuộc tính là: price, color và một
method accelerate(). Tiếp theo, hãy định nghĩa 3 lớp con lần lượt là Bike, Car và Bus kế
thừa lớp Vehicle. Mỗi lớp này hãy định nghĩa method printDetails() để hiển thị thông tin
chi tiết của đối tượng.
Trong hàm main(), hãy khởi tạo 3 đối tượng thuộc 3 lớp con và hiển thị thông tin chi tiết
của từng đối tượng này.


Vehicle{
	long price;
	String color;
	
	
	public void accelerate(){
		
	}
	
}

public class Bike extends Vehicle{
	Bike(){
	   price = 500; 
	   color = "yellow";
	}
	
	public void printDetails(){
		System.out.println("hi guys, I am Bike");
		System.out.println("price : " + this.price);
		System.out.println("color : " + this.color);
	}
	
}

public class Car extends Vehicle{
	Car(){
	   price = 3000; 
	   color = "Red";
	}
	
	public void printDetails(){
		System.out.println("hi guys, I am Car");
		System.out.println("price : " + this.price);
		System.out.println("color : " + this.color);
	}
	
}


public class Bus extends Vehicle{
	Bus(){
	   price = 5000; 
	   color = "Blue";
	}
	
	public void printDetails(){
		System.out.println("hi guys, I am Bus");
		System.out.println("price : " + this.price);
		System.out.println("color : " + this.color);
	}
}


