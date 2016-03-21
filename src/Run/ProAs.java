package Run;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.xml.sax.helpers.DefaultHandler;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class ProAs extends DefaultHandler{

	public static StringBuilder notif = new StringBuilder();
	public static JSONObject jobj = new JSONObject();
	
	
	 Multimap<String, ArrayList<String>> dataMultiList;
	 dataList newFile;
	 String filename = null;
	 ArrayList<String> caseList = new ArrayList<String>();
	 ArrayList<String> activityList = new ArrayList<String>();
	 ArrayList<String> timeStempList = new ArrayList<String>();
	 ArrayList<String> ResourceList = new ArrayList<String>();
	 ArrayList<String> EventList = new ArrayList<String>();
	 HashMap<String,Integer> DistinctCaseidQty = new HashMap<String,Integer>();
	 HashMap<String,Integer> DistinctActQty = new HashMap<String,Integer>();

	 HashMap<String,Integer> DistinctFilterCaseidQty = new HashMap<String,Integer>();
	 HashMap<String,Integer> DistinctFilterActQty = new HashMap<String,Integer>();
	 
	 int contantSize;
	 int caseSize;
	 int activitySize;
	 int resourceSize;
	 int pageNum;
	 int dataType;
	 public boolean status;
	 
	/* public static void main(String[] arg)
	 {
		 String file =  "C:/Users/admin/Desktop/eclipse-jee-luna-SR2-win32/eclipse/detail_activity_cut.mxml";
		 	 
		 ProAs p = new ProAs(file);
	 }
	*/
	 
	 public ProAs(String file) {
		if(file!=null){
			status = false;
			File Xmlfile = new File(file);
			newFile = new dataList(Xmlfile.getPath());
			System.out.println("masuk");
			//System.out.println("string :"+getsome());
			ArrayList<String> aa = getTimeStempList();
			//for(String sa : aa){
			//	System.out.println("sa :"+sa);
			//}
			getActToActMap();
			//printMultimap();
			for(ArrayList<String> ss : newFile.getArrayList())
			{
				//for(String ss1 : ss)
				//{
				//	System.out.print(ss1+" , ");
				//}
				//System.out.println();
			}
			}
			//run the log replay
			//execute();
			//ThreadEvent te = new ThreadEvent(newFile.getArrayList());
		//why????	
		//ThreadEvent te = new ThreadEvent(newFile.getArrayList(), notif, jobj);
		}
	
	public ArrayList<String> getCaseList(){
		caseList = newFile.getCase().getCaseList();
		return caseList;
	}
	
	public ArrayList<String> getActivityList(){
		activityList = newFile.getActivity().getActivityList();
		return activityList;
	}
	
	public ArrayList<String> getTimeStempList(){
		timeStempList = newFile.getTimeStemp().getTimeStempList();
		return timeStempList;
	}
	
	public ArrayList<String> getResourceList(){
		ResourceList = newFile.getResource().getResourceList();
		return ResourceList;
	}
	
	public ArrayList<String> getEventList(){
		EventList = newFile.getEvent().getEventList();
		return EventList;
	}
	
	public Integer getContantsSize(){
		contantSize = newFile.getCase().getCaseList().size();
		return contantSize;
	}
	public Integer getCaseSize(){
		caseSize = newFile.getCase().getHashCaseList().size();
		return caseSize;
	}
	public Integer getActivitySize(){
		activitySize = newFile.getActivity().getHashActivityList().size();
		return activitySize;
	}
	public Integer getResourceSize(){
		resourceSize = newFile.getResource().getHashResourceList().size();
		return resourceSize;
	}
	
	public String getsome(){
		StringBuffer s = new StringBuffer();
		s.append(newFile.getMultimap());
		return s.toString();
	}
	public void printMultimap(){
		
		System.out.println("no file : "+newFile.getTimeAnalysis().getActToActMap());//getMultiMap());
		newFile.getTimeAnalysis().setActAndTimeList();
        Map<String, Double> atam = newFile.getTimeAnalysis().getActToActMap();
		
		for(Map.Entry<String, Double> dd : atam.entrySet())
		{
			//System.out.println(dd.getKey() + "--"+ dd.getValue());
		}
	}
	

	
	public void getActToActMap(){
		newFile.getTimeAnalysis().setActAndTimeList();
		//System.out.println(newFile.getTimeAnalysis().getActToActMap());
	}
	
	public synchronized String getInt()
	{
		return notif.toString();
	}
	
	public String getString()
	{
		return notif.toString();
	}
	
	public JSONObject getObject()
	{
		return jobj;
	}
	
	public dataList getData()
	{return newFile;}
	
	public int setPageNumZero(){
		pageNum=0;
		return pageNum;
	}
	
	public int setPageNumOne(){
		pageNum=1;
		return pageNum;
	}
	
	public int setPageNumTWo(){
		pageNum=2;
		return pageNum;
	}
	
	public int getPageNum(){
		return pageNum;
	}
	
	public int setDataTypOrign(){
		dataType=1;
		return dataType;
	}
	
	public int setDataTypFilter(){
		dataType=2;
		return dataType;
	}
	
	public int getDataTypeNum(){
		return dataType;
	}
	
	public void clearFilterList(){
		newFile.getCase().clearFilterCaseList();
		newFile.getActivity().clearFilterActivityList();
		newFile.getEvent().clearFilterEventList();
		newFile.getResource().clearFilterResourceList();
		newFile.getTimeStemp().clearFilterTimeStampList();
	}
	
public HashMap<String,Integer> getDistinctCaseidQty(){
		
		String caseid = newFile.getCase().getCaseList().get(0);
		int cnt = 0;
		
		for(int i=0;i<newFile.getCase().getCaseList().size();i++){
			//System.out.println(newFile.getCase().getCaseList().get(i)+" "+caseid+" "+cnt);
			if(i==newFile.getCase().getCaseList().size()-1){
				DistinctCaseidQty.put(caseid, cnt+1);
			}
			if(newFile.getCase().getCaseList().get(i).equals(caseid)){
				cnt++;
			}
			else{
				DistinctCaseidQty.put(caseid, cnt);
				caseid = newFile.getCase().getCaseList().get(i);
				cnt=1;
			}
		}
		
		return DistinctCaseidQty;
	}
	
public HashMap<String,Integer> getFilterDistinctCaseidQty(){
	
	String caseid = newFile.getCase().getFilterCaseList().get(0);
	int cnt = 0;
	
	for(int i=0;i<newFile.getCase().getFilterCaseList().size();i++){
		//System.out.println(newFile.getCase().getCaseList().get(i)+" "+caseid+" "+cnt);
		if(i==newFile.getCase().getFilterCaseList().size()-1){
			DistinctFilterCaseidQty.put(caseid, cnt+1);
		}
		if(newFile.getCase().getFilterCaseList().get(i).equals(caseid)){
			cnt++;
		}
		else{
			DistinctFilterCaseidQty.put(caseid, cnt);
			caseid = newFile.getCase().getFilterCaseList().get(i);
			cnt=1;
		}
	}
	
	return DistinctFilterCaseidQty;
}
	public ArrayList<String> getHashCaseList(){
		return newFile.getCase().getHashCaseList();
	}

	
	/*public HashMap<String,Integer> getDistinctActQty(){
		
		String Actid = newFile.getActivity().getActivityList().get(0);
		int cnt = 0;
		
		for(int i=0;i<newFile.getActivity().getActivityList().size();i++){
			
			if(i==newFile.getActivity().getActivityList().size()-1){
				DistinctActQty.put(Actid, cnt+1);
			}
			if(newFile.getActivity().getActivityList().get(i).equals(Actid)){
				cnt++;
			}
			else{
				DistinctActQty.put(Actid, cnt);
				Actid = newFile.getActivity().getActivityList().get(i);
				cnt=1;
			}
		}
		
		return DistinctActQty;

	}*/
	
	public HashMap<String,Integer> getDistinctActQty(){
		
		//String Actid = newFile.getActivity().getActivityList().get(0);
		int cnt = 1;
		
		for(int i=0;i<newFile.getActivity().getActivityList().size();i++){
			if(DistinctActQty.containsKey(newFile.getActivity().getActivityList().get(i))){
				
				cnt = DistinctActQty.get(newFile.getActivity().getActivityList().get(i));
				cnt++;
				DistinctActQty.remove(newFile.getActivity().getActivityList().get(i));
				DistinctActQty.put(newFile.getActivity().getActivityList().get(i), cnt);
			}
			else{
				DistinctActQty.put(newFile.getActivity().getActivityList().get(i), cnt);
			}
			
		}
		
		return DistinctActQty;

	}
	public HashMap<String,Integer> getFilterDistinctActQty(){
		
		//String Actid = newFile.getActivity().getActivityList().get(0);
		int cnt = 1;
		
		for(int i=0;i<newFile.getActivity().getFilterActivityList().size();i++){
			if(DistinctFilterActQty.containsKey(newFile.getActivity().getFilterActivityList().get(i))){
				
				cnt = DistinctFilterActQty.get(newFile.getActivity().getFilterActivityList().get(i));
				cnt++;
				DistinctFilterActQty.remove(newFile.getActivity().getFilterActivityList().get(i));
				DistinctFilterActQty.put(newFile.getActivity().getFilterActivityList().get(i), cnt);
			}
			else{
				DistinctFilterActQty.put(newFile.getActivity().getFilterActivityList().get(i), cnt);
			}
			
		}
		
		return DistinctFilterActQty;

	}
	public void clearDistinctActQty(){
		DistinctActQty.clear();
	}
}
