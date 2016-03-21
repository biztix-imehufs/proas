package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class EventClass {

	ArrayList<String> eventList = new ArrayList<String>();
	ArrayList<String> filterEventList = new ArrayList<String>();
	
	public void setArrayList(String caseid){
		this.eventList.add(caseid);
	}

	public ArrayList<String> getEventList() {
		return eventList;
	}
	
	public void setFilterArrayList(String caseid){
		this.filterEventList.add(caseid);
	}

	public ArrayList<String> getFilterEventList() {
		return filterEventList;
	}
	
	public ArrayList<String> clearFilterEventList() {
		this.filterEventList.clear();
		return filterEventList;
	}
	
	public ArrayList<String> getHashEventList() {
		ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(eventList));
		return HashCase;
	}
	public ArrayList<String> getFilterHashEventList() {
		ArrayList<String> Hasheve = new ArrayList<String>(new HashSet<String>(filterEventList));
		return Hasheve;
	}
	
}
