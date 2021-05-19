import java.util.Scanner;

public class ex1{
	
	private float[] arrayFloat;
	
	public float[] getArray(){
		return this.arrayFloat;
	}
	
	public void setArray(float[] arrayFloat){
		this.arrayFloat = arrayFloat;
	}
	
	public float findMinVal(){
		float fMinVal = this.arrayFloat[0];
		for(float el : this.arrayFloat){
			if(el < fMinVal) fMinVal = el;
		}
		return fMinVal; 
	}
	
	public float findMaxVal(){
		float fMaxVal = this.arrayFloat[0];
		for(float el : this.arrayFloat){
			if(el > fMaxVal) fMaxVal = el;
		}
		return fMaxVal; 
	}
	
	public void showInputReq(){
		Scanner sc = new Scanner(System.in);
		System.out.println("please input you array value :");
		System.out.println("how many items you wanna :");
		int idx = 0, lengthArray  = 0;
		lengthArray = sc.nextInt();
		
		sc.nextLine();
		float[] temp = new float[lengthArray];
		
		while(idx < lengthArray){
			System.out.println(" value array index " + (idx + 1) + " :");
			temp[idx] = sc.nextFloat();
			sc.nextLine();
			idx++;
		}
		
		this.setArray(temp);
		
		System.out.println("input you array value :");
		for(float el : this.arrayFloat){
			System.out.println(el);
			System.out.println("\t");
		}
		
	}
	
	public float findAvgDivByInt(int n){
		int count = 1;
		float sum = 0;
		
		if(n == 0){
			System.out.println("Error : divide by zero");
			return 0;
		}
		
		for(float el : this.arrayFloat){
			if((el % n) == 0){
				count++;
				sum += el;
			}
		}
		
		if(n == 3){
			return count - 1;
		}
		
		if(count > 1){
			return sum/(count-1);
		}
		else{
			return 0;
		}
	}
	
	public int findMaxCount(float maxVal){
		int countMax = 0;
		for(float el : this.arrayFloat){
			if(el == maxVal){
				countMax++;
			}
		}
		return countMax - 1;
	}
	
	public float mulArrayCal(){
		float result = 1;
		for(float el : this.arrayFloat){
			result *= el;
		}
		return result;
	}
	
	public static void main(String ... args){		
		
		ex1 test = new ex1();
		
		test.showInputReq();
		
		float maxVal = test.findMaxVal();
		float AvgDivBy5 = test.findAvgDivByInt(5);
		int divBy3Count = (int)test.findAvgDivByInt(3);
		
		/* tim phan tu co gia tri lon nhat va nho nhat cua mang nay */
		System.out.println("max value :" + maxVal );		
		System.out.println("minimize value :" + test.findMinVal());
		
		
		/* hay tinh va in ra trung bung cong cua cac phan tu cua mang co gia tri chia het cho 5. */
		if( AvgDivBy5 > 0){
			System.out.println("average numbers divide by 5 :" + AvgDivBy5);
		}
		else{
			System.out.println("there is no number divide by 5 in results zero");
		}
		
		/* hay dem so phan tu co gia tri bang voi phan tu lon nhat trong mang. */
		System.out.println("amount of number equal to max value :" + test.findMaxCount(maxVal));
		
		
		/* hay tinh va in ra tich cua cac phan tu trong mang. */
		System.out.println("multiply of element inside array result :" + test.mulArrayCal());
		
		
		/* hay dem xem mang co bao nhieu phan tu chia het cho 3 */
		if( divBy3Count > 0){
			System.out.println("amout of number divide by 3 in result zero :" + divBy3Count);
		}
		else{
			System.out.println("there is no number divide by 3 in results zero");
		}
		
	}
}
