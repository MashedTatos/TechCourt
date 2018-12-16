package TechCourt;

public class TextParser {

	
	public static String parseText(String text) {
		String parsedText = "";
		
		parsedText = text.replaceAll("<code-block>", "<div class =\"code-block\">");
		parsedText = parsedText.replaceAll("</code-block>", "</div>");
		
		return parsedText;
	}
	
	
}
