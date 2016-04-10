package sql;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class test {

	public static void main(String[] args) throws IOException {
		 String sURL = "https://www.zipcodeapi.com/rest/6Vi706MIFdDIek0llkfcG1XtGE0OxDBDyTLz0xhFLUo0folAIAMpCKSjoT8WwJA4/radius.json/63303/8/km"; //just a string

		    // Connect to the URL using java's native library
		    URL url = new URL(sURL);
		    HttpURLConnection request = (HttpURLConnection) url.openConnection();
		    request.connect();

		    // Convert to a JSON object to print data
		    JsonParser jp = new JsonParser(); //from gson
		    JsonElement root = jp.parse(new InputStreamReader((InputStream) request.getContent())); //Convert the input stream to a json element
		    JsonObject rootobj = root.getAsJsonObject(); //May be an array, may be an object. 
		     String zipcode = rootobj.get("zip_code").getAsString(); //just grab the zipcode
		     	System.out.println(zipcode);
	}

}
