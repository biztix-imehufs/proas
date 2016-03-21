package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class TimeStempClass {

	ArrayList<String> timeStempList = new ArrayList<String>();
	ArrayList<String> filterTimeStempList = new ArrayList<String>();
	
	public void setArrayList(String caseid){
		this.timeStempList.add(caseid);
	}
	
	public ArrayList<String> getTimeStempList() {
		return timeStempList;
	}
	
	public void setFilterArrayList(String caseid){
		this.filterTimeStempList.add(caseid);
	}
	
	public ArrayList<String> getFilterTimeStempList() {
		return filterTimeStempList;
	}
	
	public ArrayList<String> clearFilterTimeStampList() {
		this.filterTimeStempList.clear();
		return filterTimeStempList;
	}
	
	public ArrayList<String> getHashTimeStempList() {
		ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(timeStempList));
		return HashCase;
	}
	public ArrayList<String> getFilterHashTimeStempList() {
		ArrayList<String> HashCases = new ArrayList<String>(new HashSet<String>(filterTimeStempList));
		return HashCases;
	}
}
