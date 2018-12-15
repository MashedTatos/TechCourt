package Listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class HttpListener
 *
 */
@WebListener
public class HttpListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public HttpListener() {
        // TODO Auto-generated constructor stub
    }


    public void requestDestroyed(ServletRequestEvent sre)  { 
        
    }

    public void requestInitialized(ServletRequestEvent sre)  { 
    	
    	System.out.println("Request made!");
    }
	
}
