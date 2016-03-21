package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class ActivityClass {

	ArrayList<String> activityList = new ArrayList<String>();
	ArrayList<String> filterActivityList = new ArrayList<String>();

	public void setArrayList(String caseid) {
		this.activityList.add(caseid);
	}

	public ArrayList<String> getActivityList() {
		return activityList;
	}

	public void setFilterArrayList(String caseid) {
		this.filterActivityList.add(caseid);
	}

	public ArrayList<String> getFilterActivityList() {
		return filterActivityList;
	}
	
	public ArrayList<String> clearFilterActivityList() {
		this.filterActivityList.clear();
		return filterActivityList;
	}
	
	public ArrayList<String> getHashActivityList() {
		ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(activityList));
		return HashCase;
	}
	
	public ArrayList<String> getFilterHashActivityList() {
		ArrayList<String> Hashact = new ArrayList<String>(new HashSet<String>(filterActivityList));
		return Hashact;
	}
}
