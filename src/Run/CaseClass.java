package Run;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;

public class CaseClass {

	ArrayList<String> caseList = new ArrayList<String>();
	ArrayList<String> filterCaseList = new ArrayList<String>();

	
	public void setArrayList(String caseid){
		this.caseList.add(caseid);
	}
	
	public ArrayList<String> getCaseList(){
		return caseList;
	}
	
	public void setFilterArrayList(String caseid){
		this.filterCaseList.add(caseid);
	}
	
	public ArrayList<String> getFilterCaseList(){
		return filterCaseList;
	}
	
	public ArrayList<String> clearFilterCaseList() {
		this.filterCaseList.clear();
		return filterCaseList;
	}
	
	public ArrayList<String> getHashCaseList() {
		ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(caseList));
		return HashCase;
	}
	
	public ArrayList<String> getFilterHashCaseList() {
		ArrayList<String> HashCases = new ArrayList<String>(new HashSet<String>(filterCaseList));
		return HashCases;
	}
	public void print(){
		System.out.println(caseList);
		System.out.println(getHashCaseList());
	}

	
}
