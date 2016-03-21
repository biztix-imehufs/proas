package Run;

import java.util.ArrayList;
import java.util.HashSet;

public class ResourceClass {

		ArrayList<String> resourceList = new ArrayList<String>();
		ArrayList<String> filterResourceList = new ArrayList<String>();
		
		public void setArrayList(String caseid){
			this.resourceList.add(caseid);
		}

		public ArrayList<String> getResourceList() {
			return resourceList;
		}
		
		public void setFilterArrayList(String caseid){
			this.filterResourceList.add(caseid);
		}

		public ArrayList<String> getFilterResourceList() {
			return filterResourceList;
		}
		
		public ArrayList<String> clearFilterResourceList() {
			this.filterResourceList.clear();
			return filterResourceList;
		}
		
		public ArrayList<String> getHashResourceList() {
			ArrayList<String> HashCase = new ArrayList<String>(new HashSet<String>(resourceList));
			return HashCase;
		}
		public ArrayList<String> getFilterHashResourceList() {
			ArrayList<String> HashCases = new ArrayList<String>(new HashSet<String>(filterResourceList));
			return HashCases;
		}
}
