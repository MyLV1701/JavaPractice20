package util;

import java.util.Locale;
import java.util.ResourceBundle;

public class MyResourceBundle {
	private final static String BUNDLE_FILE = "message";
	Locale locale = new Locale("vi", "VN");
	
	ResourceBundle rb = ResourceBundle.getBundle(BUNDLE_FILE, locale);
	
	public String getValue(String key) {
		String value = null;
		
		value = rb.getString(key);
		
		return value;
	}
	
	public void changeLocale(String language) {
		if(language.equals("vi"))
			locale = new Locale(language, "VN");
		else if(language.equals("en"))
			locale = new Locale(language, "US");
		rb = ResourceBundle.getBundle(BUNDLE_FILE, locale);
	}
	
	public void changeLocale(String language, String country) {
		locale = new Locale(language, country);
		rb = ResourceBundle.getBundle(BUNDLE_FILE, locale);
	}
	
	public static void main(String[] args) {
		MyResourceBundle mrb = new MyResourceBundle();
		System.out.println(mrb.getValue("index.proTable.caption"));
		
		mrb.changeLocale("en", "US");
		System.out.println(mrb.getValue("index.proTable.caption"));
		
	}
}
