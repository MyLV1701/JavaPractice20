package util.customTag;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import util.MyResourceBundle;

public class TagI18N extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException, IOException {
		StringWriter sw = new StringWriter();
		getJspBody().invoke(sw);
		String input = sw.toString();
		
		System.out.println("\n\n\n>>>>>> input: " + input + "\n\n\n\n");
		
		MyResourceBundle mrb = new MyResourceBundle();
		
		PageContext pc = (PageContext) this.getJspContext();
		HttpServletRequest request = (HttpServletRequest)pc.getRequest();
		
		if(request.getSession().getAttribute("selectedLanguage") != null) {
			String selectedLanguage = request.getSession().getAttribute("selectedLanguage").toString();
			mrb.changeLocale(selectedLanguage);
		}
		
		String message = mrb.getValue(input);
		
		JspWriter jw = getJspContext().getOut();
		jw.print(message);
	}
}