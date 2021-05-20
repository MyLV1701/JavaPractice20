import java.util.Scanner;

public class NhanVien{

	private int    employeeCode;
	private String fullName;
	private int    salary;
	private int    age;

	public NhanVien(String fullName, int employeeCode, int salary, int age)
	{
		this.fullName     = fullName;
		this.employeeCode = employeeCode;
		this.salary       = salary;
		this.age          = age;
	}

	public void showEmployeeInfo()
	{		
		System.out.printf("*  %s   |    %d    |   %d   |   %d  |*\n",fullName,employeeCode,salary,age);
		
	}
	
	public int getEmployeeAge(){
		return this.age;
	}

	public static void main(String ... args){
		
		NhanVien[] nv = new NhanVien[10];
		Scanner    sc = new Scanner(System.in);
		
		String fullName;
		int    employeeCode;
		int    salary;	
		int    age;
		int    idx = 0;
		
		// get information for each item	
		while(idx < 10){
			System.out.printf("please fill information for employ number %d : \n", (idx + 1));
			
			System.out.println("Full Name :");
			fullName = sc.nextLine();
			
			System.out.println("employee Code :");
			employeeCode = sc.nextInt();
			sc.nextLine();
			
			System.out.println("salary :");
			salary = sc.nextInt();
			sc.nextLine();
			
			System.out.println("age :");
			age = sc.nextInt();
			sc.nextLine();
			
			nv[idx] = new NhanVien(fullName, employeeCode, salary, age);
			
			idx++;
		}		
		
		// show information all employee
		
		System.out.println(" E M P L O Y E E *** I N F O R M A T I O N ");
		System.out.println("**********************************************");
		System.out.println("* fullName | employeeCode |  salary | age    *");
		System.out.println("*----------|--------------|---------|-------|*");
		
		for (NhanVien el : nv) el.showEmployeeInfo();
		
		System.out.println("********************************************** \n\n\n");
		
		// show information employee who greater than 30 years old
		
		System.out.println("--- Employee's years old greater than 30 ----");
		System.out.println("**********************************************");
		System.out.println("* fullName | employeeCode |  salary | age    *");
		System.out.println("*----------|--------------|---------|-------|*");
		
		for (NhanVien el : nv) {
			if( el.getEmployeeAge() > 30) el.showEmployeeInfo();
		}
	}
}