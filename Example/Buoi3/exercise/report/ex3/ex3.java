import java.util.Scanner;

public class ex3{
	
	private String string_user_input = "";
	
	ex3(){
		string_user_input = "";
	}
	
	public void inputString(){
		Scanner sc = new Scanner(System.in);
		System.out.println("please input your string :");
		this.string_user_input = sc.nextLine();
	}
	
	public String getInputString(){
		return this.string_user_input;
	}
	
	public static void main(String ... args){		
		ex3 test = new ex3();
		test.inputString();
		System.out.println("input string : " + test.getInputString());
		
		// length of string
		String stringhanle = test.getInputString();
		System.out.println("input string length: " + stringhanle.length());
		
		// get character at index 3
		System.out.println("character at index 3rd : " + stringhanle.charAt(3));
		
		// get index of 'a' character
		System.out.println("index of 'a' character : " + stringhanle.indexOf('a'));
		
		// perform replace 'a' character with 'b'
		System.out.println("replace 'a' with 'b' result : " + stringhanle.replace('a','b'));
		
		// count 'c' character inside given string by filter() + count() method
		System.out.println("amount of 'c' character by filter() + count() method : " + stringhanle.chars().filter(h -> h == 'c').count());		
		
		// count 'c' character inside given string by convert string to tocharArray() method
		char[] chars = stringhanle.toCharArray();
		int cCharCount = 0;
		for(char el : chars){
			cCharCount += (el == 'c') ? 1 : 0;
		}
		System.out.println("amount of 'c' character by convert string to tocharArray() method: " + cCharCount);
		
		// convert to lowerCase
		String temp = stringhanle;
		System.out.println("convert to lowerCase results : " + temp.toLowerCase());
		
		// convert to UpperCase
		temp = stringhanle;
		System.out.println("convert to lowerCase results : " + temp.toUpperCase());
		
		// eliminates leading and trailing spaces
		temp = stringhanle;
		System.out.println("convert to lowerCase results : " + temp.trim());
		
		// print out substring start from index euqal to 5
		temp = stringhanle;
		System.out.println("substring start from index euqal to 5 : " + temp.substring(5));
		
		// count number of consonants inside given string  
		cCharCount = 0;
		temp = stringhanle;
		for (int i = 0 ; i < temp.length(); i++){
			char ch = temp.charAt(i);
			if(ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' )
			{
				cCharCount ++;
			}
		}
		temp = stringhanle.replaceAll("\\s", "");
		System.out.println("number of consonants : " + cCharCount);
		System.out.println("number of vowel : " + (temp.length() - cCharCount));
		
		// concat given string to another one ‘Programming’
		temp = stringhanle.concat("Programming");
		System.out.println("concat given string to another one 'Programming' : " + temp);
		
		// last index of the given character value or substring
		temp = stringhanle;
		System.out.println("concat given string to another one 'Programming' : " + temp.lastIndexOf("abc"));
		
		// require user input another string and take comparision to previous string
		Scanner sc = new Scanner(System.in);
		System.out.println("please input your string :");
		String anotherOne = sc.nextLine();
		temp = stringhanle;
		temp = (temp.compareTo(anotherOne) == 0) ? "the same" : "difference";
		System.out.println("string comparision result : " + temp);
		
	}
}