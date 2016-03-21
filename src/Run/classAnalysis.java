package Run;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.math.stat.descriptive.DescriptiveStatistics;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class classAnalysis {

	Multimap<String, ArrayList<String>> timeMulti = ArrayListMultimap.create();
	ArrayList<String> caselist;
	ArrayList<String> timelist;

	HashMap<String, Double> caseToTime = new HashMap<String, Double>();
	HashMap<String, Double> caseWithOutOtl = new HashMap<String, Double>();
	HashMap<String, Double> caseToOtl = new HashMap<String, Double>();

	CaseClass caseClass;
	TimeAnalysis timeAnalysis = new TimeAnalysis(timeMulti, caseClass);
	DescriptiveStatistics statistics = DescriptiveStatistics.newInstance();
	
	String oneActivity, twoActivity, caseName, time1, time2;
	Date startTime, endTime;
	double timediff;
	double caseTime;
	double allCaseSum = 0;
	double averageTime = 0;
	double minArea, maxArea, SD;

	public classAnalysis(Multimap<String, ArrayList<String>> multi,
			CaseClass cas) {
		this.timeMulti = multi;
		this.caseClass = cas;
		divideMultimap();
		setCaseToAveg();
		findOtlMap();
	}

	public void test() {
		//System.out.println("Process average time  " + averageTime);
		//System.out.println("Process Time Standard Deviation " + SD);
		//System.out.println("Number of Original Process  " + caseToTime.size());
		//System.out.println("Number of Process without Outlier  " + caseWithOutOtl.size());
		//System.out.println("Number of Outlier Process  " + caseToOtl.size());
	}

	// set CaseToTimeList from Multimap;
	// CaseToTimeList will set all HashMap in this class
	public void divideMultimap() {
		for (Entry<String, Collection<ArrayList<String>>> e : timeMulti.asMap()
				.entrySet()) {
			for (int i = 0; i < caseClass.getCaseList().size(); i++) {
				caselist = new ArrayList<String>();
				timelist = new ArrayList<String>();

				if (e.getKey().equalsIgnoreCase(caseClass.getCaseList().get(i))) {
					Iterator it = e.getValue().iterator();

					// first arraylist
					ArrayList from = (ArrayList) it.next();

					// prepare the next arraylist
					ArrayList to;
					while (it.hasNext()) {
						to = (ArrayList) it.next();
						String[] fromList = getStringList(from);
						String[] toList = getStringList(to);

						// time different : assumption : succeeding activity
						// start as soon as preceeding activity finish
						timestartSet(fromList[3]);
						timeendSet(toList[3]);
						setTimediff(startTime, endTime);

						// setting the activity-to-activity map
						caseName = fromList[0];
						//System.out.println("case name:----"+caseName+"    "+getTimediff());
						setCaseToTimeList(caseName, getTimediff());
						from = to;
					}
				}
			}
		}
	}

	public String[] getStringList(ArrayList<String> arr) {
		String[] content = new String[5];
		content[0] = arr.get(0).toString(); // get case
		content[1] = arr.get(1).toString(); // get activity
		content[4] = arr.get(4).toString(); // get resource
		content[3] = arr.get(3).toString(); // get time
		return content;
	}

	public HashMap<String, Double> getCaseToTimeList() {
		return caseToTime;
	}

	public void timestartSet(String timestamp) {

		startTime = null;
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
			startTime = dateParser.parse(timestamp == null ? "" : timestamp,
					new ParsePosition(0));
		}
	}

	public void timeendSet(String timestamp) {

		// SimpleDateFormat dateParser = new
		// SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
		endTime = null;
		if (timestamp.length() >= "yyyy-MM-ddTHH:mm:ss".length()) {

			String format = "yyyy-MM-dd'T'HH:mm:ss";
			String end = timestamp.substring("yyyy-MM-ddTHH:mm:ss".length());
			timestamp = timestamp.substring(0, "yyyy-MM-ddTHH:mm:ss".length());
			if (!end.equals("")) {
				// end now contains all optional elements, such as:
				// milliseconds and/or
				// timezone
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
					// We have a milliseconds part
					mse = tz;
					if (mse == -1) {
						// no timezone
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
					// There is a timezone
					// mse is the first index of the timezone part
					String timezone = end.substring(mse);

					if (timezone.length() == 1) {
						// Timezone = 'Z'
						timezone = "+00:00";
					}
					timestamp += "GMT" + timezone;

					format += "z";

				}
			}
			SimpleDateFormat dateParser = new SimpleDateFormat(format);
			endTime = dateParser.parse(timestamp == null ? "" : timestamp,
					new ParsePosition(0));
		}
	}

	public double setTimediff(Date tm1, Date tm2) {
		Date start = tm1;
		Date end = tm2;
		// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		// System.out.println(start + " "+end.getDate());
		long diff = 0;
		long diffDays = 0;
		try {
			diff = end.getTime() - start.getTime();
			diffDays = diff / (60 * 1000);
		} catch (Exception e) {
			// System.out.println(e.toString());
		}
		timediff = Math.abs((double) diffDays);
		//timediff = diff
		return timediff;
	}

	public double getTimediff() {
		return timediff;
	}

	public void setCaseToTimeList(String caseNamee, double timediffvalue) {
		// set summation time -- CaseToTime
		if (caseToTime.containsKey(caseName)) {
			double actValue = caseToTime.get(caseName);
			actValue += timediffvalue;
			caseToTime.put(caseName, actValue);
		} else {
			caseToTime.put(caseName, (double) timediffvalue);
		}
	}

	public void setCaseToAveg() {
		Set key = caseToTime.keySet();
		for (Iterator iterator = key.iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			statistics.addValue(caseTime);
			caseTime = caseToTime.get(keyName);
			System.out.println(keyName);
			allCaseSum += caseTime;
		}
		averageTime = statistics.getMean();
		
		//calculate SD
		for (Iterator iterator = key.iterator(); iterator.hasNext();) {
			String keyName = (String) iterator.next();
			caseTime = caseToTime.get(keyName);
			SD+=Math.pow((caseTime-averageTime),2);
		}
		SD=SD/(double) caseToTime.size()-1;
		SD=statistics.getStandardDeviation();
		
	}

	public void findOtlMap(){
		double mean = statistics.getMean();
		double std = statistics.getStandardDeviation();
		double median = statistics.getPercentile(50);
		double miniarea = statistics.getPercentile(10);
		double maxiarea = statistics.getPercentile(90);
		minArea=averageTime-(2.326*(SD/Math.sqrt(caseToTime.size())));
		maxArea=averageTime+(2.326*(SD/Math.sqrt(caseToTime.size())));
		double min2 =averageTime-(1.282*(SD/Math.sqrt(caseToTime.size())));
		double min3 = averageTime-(1.96*(SD/Math.sqrt(caseToTime.size())));
		//System.out.println("AAAAAA    "+  averageTime);
		System.out.println("BBBBB     "+ mean);
		//System.out.println("Confidence level 90%   "+"(+,-)  "+(1.282*(SD/Math.sqrt(caseToTime.size()))));
		//System.out.println("Confidence level 95%   "+"(+,-)  "+(1.96*(SD/Math.sqrt(caseToTime.size()))));
		////System.out.println("Confidence level 99%   "+"(+,-)  "+(2.326*(SD/Math.sqrt(caseToTime.size()))));
		System.out.println("minArea   :"+miniarea);
		System.out.println("maxArea   :"+maxiarea);
		 Set key = caseToTime.keySet();
		  for (Iterator iterator = key.iterator(); iterator.hasNext();) {
		                   String keyName = (String) iterator.next();
		                   caseTime=caseToTime.get(keyName);
		                   
		                   	if(caseTime >= miniarea&&caseTime<=maxiarea){
		                   		//caseWithOutOtl.put(keyName, caseTime);
		                   		///System.out.println("-----------------------------------------------------------------------");
		                   		//System.out.println("Reference Process  :  Casename-  "+keyName +"   {MinArea("+minArea+")<  "
		                   		//		+caseTime+"  <MaxArea("+maxArea+")}");
		                   	}
		                   	else{
		                   		caseToOtl.put(keyName, caseTime);
		                   		System.out.println("-------------------------------------------------------------------------");
		                   		System.out.println("Outlier Process  : Casename -  "+keyName +"   {"+
		                   				caseTime+	"<  MinArea("+miniarea+")  or   "+caseTime+"  >MaxArea("+maxiarea+")}"	);
		                   	}
		                	  
		                   
		  }
			//System.out.println("minArea   :"+minArea);
			//System.out.println("maxArea   :"+maxArea);
			//System.out.println("min2   :"+min2);
			//System.out.println("min3   :"+min3);
			
			// Get a DescriptiveStatistics instance
			//DescriptiveStatistics statistics = new DescriptiveStatistics();

			// Add the data from the array
			//for( int i = 0; i < inputArray.length; i++) {
				//statistics.addValue(inputArray[i]);
			//}

			// Compute some statistics
			
			//System.out.println(mean);
			//System.out.println(std);
			//System.out.println(median);
			//System.out.println("minimam : "+miniarea);
			//System.out.println("maximam : "+maxiarea);
	}
}
