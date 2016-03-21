package Run;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONObject;

public class ThreadEvent {
	
	public StringBuilder notif;
	public ActivityMap activityMap;
	public JSONObject jObj;
	
	public void execute(ArrayList<ArrayList<String>> allEvents)
	{
		String name = "testing";
	    RunnableDemo R1 = new RunnableDemo( allEvents, name);
	    R1.start();
	}
	
	public ThreadEvent(ArrayList<ArrayList<String>> allEvents, StringBuilder sb, JSONObject jobj)
	{
		this.notif = sb;
		this.jObj = jobj;
		execute(allEvents);
		/*String name = "testing";
	    RunnableDemo R1 = new RunnableDemo( allEvents, name);
	    R1.start();*/
	}
	
}

class RunnableDemo implements Runnable {
	   private Thread t;
	   private String threadName;
	   private long timestamp=50;
	   ArrayList<ArrayList<String>> allEvents;
	   
	   RunnableDemo( String name){
	       threadName = name;
	       System.out.println("Creating " +  threadName );
	   }
	   
	   RunnableDemo(ArrayList<ArrayList<String>> allEvents, String name){
	       //threadName = name;
		   this.allEvents = allEvents;
		   threadName = name;
	       System.out.println("Creating " +  threadName );
	   }
	   public void run() {
	      System.out.println("Running " +  threadName );
	      String casetest = allEvents.get(0).get(0).toString();
	      
	      System.out.println("case : "+casetest);
	      try {
	    	  String caseID = allEvents.get(0).get(0).toString();
    		  String actName = allEvents.get(0).get(2).toString();
    		  String tstamp = allEvents.get(0).get(3).toString();
	    	  Date time1 = timeSet(allEvents.get(0).get(3).toString());
	    	  System.out.println(caseID + ", " +actName + ", " + tstamp + " == "+allEvents.size());
	    	  for(int i=1; i<allEvents.size();i++){
	    		  //ArrayList<String> al1 : allEvents){
	    		  caseID = allEvents.get(i).get(0).toString();
	    		  actName = allEvents.get(i).get(1).toString();
	    		  Date time2 = timeSet(allEvents.get(i).get(3).toString());
	    		  timestamp = timediff(time1, time2)/10000;
	    		  System.out.println(caseID + ", " +actName + ", " + tstamp+ ","+timestamp);
	    		  Thread.sleep(timestamp);
	    		  System.out.println(caseID + ", " +actName + ", " + tstamp);
	    		  
	    	  }
	         /*for(int i = 4; i > 0; i--) {
	            System.out.println("Thread: " + threadName + ", " + i);
	            // Let the thread sleep for a while.
	            Thread.sleep(timestamp);
	         }*/
	     } catch (InterruptedException e) {
	         System.out.println("Thread " +  threadName + " interrupted.");
	     }
	     System.out.println("Thread " +  threadName + " exiting.");
	   }
	   
	   public void start ()
	   {
	      System.out.println("Starting " +  threadName );
	      if (t == null)
	      {
	         t = new Thread (this, threadName);
	         t.start ();
	      }
	   }
	   
	   public Date timeSet(String timestamp) {

			Date time = null;
			if (timestamp.length() >= "yyyy-MM-ddTHH:mm:ss".length()) {

				String format = "yyyy-MM-dd'T'HH:mm:ss";
				String end = timestamp.substring("yyyy-MM-ddTHH:mm:ss".length());
				timestamp = timestamp.substring(0, "yyyy-MM-ddTHH:mm:ss".length());
				if (!end.equals("")) {
					int ms = end.indexOf(".");
					int tz = end.indexOf("-");
					if (tz == -1) {
						tz = end.indexOf("+");
					}
					if (tz == -1) {
						tz = end.indexOf("Z");

					}
					int mse = 0;

					if (ms != -1) {
						mse = tz;
						if (mse == -1) {
							mse = end.length();
						}
						format += ".SSS";
						timestamp += ".";
						for (int i = 0; i < (mse - ms - 1); i++) {
							if (i > 2) {
								format += "S";
							}
							timestamp += end.charAt(i + 1);
						}
						for (int i = 0; i < 3 - (mse - ms - 1); i++) {
							timestamp += "0";
						}
					}
					if (tz != -1) {
						String timezone = end.substring(mse);

						if (timezone.length() == 1) {
							timezone = "+00:00";
						}
						timestamp += "GMT" + timezone;

						format += "z";

					}
				}
				SimpleDateFormat dateParser = new SimpleDateFormat(format);
				time = dateParser.parse(timestamp == null ? "" : timestamp,
					new ParsePosition(0));
				
			}
			return time;
		}
	   
	   public long timediff(Date tm1, Date tm2){
			Date start = tm1;
		    Date end = tm2;
		    // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		    //System.out.println(start + " "+end.getDate());
		    long diff=0;
		    long diffDays=0;
		    try{
			diff = end.getTime() - start.getTime();
			diffDays = diff / (60 * 1000);
		    }
		    catch(Exception e){
		    	//System.out.println(e.toString());
		    }
			
			//timediff = (double) diffDays;
			return diff;
		}

	}