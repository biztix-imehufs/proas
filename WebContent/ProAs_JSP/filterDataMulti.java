package Run;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

public class filterDataMulti {

	ArrayList<ArrayList<String>> filterE = new ArrayList<ArrayList<String>>();
	ArrayList<ArrayList<String>> newFilterE = new ArrayList<ArrayList<String>>();
	CaseClass caseClass;
	ActivityClass activityClass; 
	EventClass eventClass; 
	ResourceClass resourceClass;
	 public filterDataMulti(ArrayList<ArrayList<String>> allEvents, CaseClass c, ActivityClass a, EventClass e, ResourceClass r){
		this.filterE = allEvents;
		this.caseClass=c;
		this.activityClass=a;
		this.eventClass=e;
		this.resourceClass=r;
	}
	 
	public void setFilter(){
		newFilterE.clear();
		System.out.println("WHY!!!!!!!!!!"+newFilterE);
		System.out.println(caseClass.getFilterCaseList());
		System.out.println(activityClass.getFilterActivityList());
		System.out.println(eventClass.getFilterEventList());
		System.out.println(resourceClass.getFilterResourceList());
		if(caseClass.getFilterCaseList().size()!=0){
			for(int i=0; i<caseClass.getFilterCaseList().size();i++){
				for(int j=0; j<filterE.size();j++){
					if(caseClass.getFilterCaseList().get(i).equals(filterE.get(j).get(0)))
					{
						newFilterE.add(filterE.get(j));
					}
				}
			}
			if(activityClass.getFilterActivityList()!=null){
				for(int i=0; i<activityClass.getFilterActivityList().size();i++){
					for(int j=0; j<newFilterE.size();j++){
						if(!activityClass.getFilterActivityList().get(i).equals(newFilterE.get(j).get(1)))
						{
							newFilterE.remove(j);
							System.out.println("BbbB");
							j--;
						}
					}
				}
			}
				if(eventClass.getFilterEventList()!=null){
					for(int i=0; i<eventClass.getFilterEventList().size();i++){
						for(int j=0; j<newFilterE.size();j++){
							if(!eventClass.getFilterEventList().get(i).equals(newFilterE.get(j).get(2)))
							{
								newFilterE.remove(j);
								System.out.println("cCccc");
								j--;
							}
						}
					}
				}
					if(resourceClass.getFilterResourceList()!=null){
						for(int i=0; i<resourceClass.getFilterResourceList().size();i++){
							for(int j=0; j<newFilterE.size();j++){
								if(!resourceClass.getFilterResourceList().get(i).equals(newFilterE.get(j).get(4)))
								{
									newFilterE.remove(j);
									j--;
								}
							}
						}
					}
					System.out.println("finish");
				}
		if(caseClass.getFilterCaseList().size()==0){
		if(activityClass.getFilterActivityList().size()!=0){
			System.out.println("????");
			for(int i=0; i<activityClass.getFilterActivityList().size();i++){
				for(int j=0; j<filterE.size();j++){
					if(activityClass.getFilterActivityList().get(i).equals(filterE.get(j).get(1)))
					{
						newFilterE.add(filterE.get(j));
						System.out.println();
					}
				}
			}
			if(eventClass.getFilterEventList()!=null){
				for(int i=0; i<eventClass.getFilterEventList().size();i++){
					for(int j=0; j<newFilterE.size();j++){
						if(!eventClass.getFilterEventList().get(i).equals(newFilterE.get(j).get(2)))
						{
							newFilterE.remove(j);
							j--;
						}
					}
				}
			}System.out.println(newFilterE);
				if(resourceClass.getFilterResourceList()!=null){
					for(int i=0; i<resourceClass.getFilterResourceList().size();i++){
						for(int j=0; j<newFilterE.size();j++){
							if(resourceClass.getFilterResourceList().get(i).equals(newFilterE.get(j).get(4)))
							{
								newFilterE.remove(j);
								j--;
							}
						}
					}
				}
			}
		}
		if(caseClass.getFilterCaseList().size()==0){
			if(activityClass.getFilterActivityList().size()==0){
		
		if(eventClass.getFilterEventList()!=null){
			for(int i=0; i<eventClass.getFilterEventList().size();i++){
				for(int j=0; j<newFilterE.size();j++){
					if(eventClass.getFilterEventList().get(i).equals(newFilterE.get(j).get(2)))
					{
						newFilterE.remove(j);
						j--;
					}
				}
			}
			if(resourceClass.getFilterResourceList()!=null){
				for(int i=0; i<resourceClass.getFilterResourceList().size();i++){
					for(int j=0; j<newFilterE.size();j++){
						if(resourceClass.getFilterResourceList().get(i).equals(newFilterE.get(j).get(4)))
						{
							newFilterE.remove(j);
							j--;
						}
					}
				}
			}
		}}}
		
		if(caseClass.getFilterCaseList().size()==0){
			if(activityClass.getFilterActivityList().size()==0){
				if(eventClass.getFilterEventList().size()==0){
			
		if(resourceClass.getFilterResourceList()!=null){
			for(int i=0; i<resourceClass.getFilterResourceList().size();i++){
				for(int j=0; j<filterE.size();j++){
					if(resourceClass.getFilterResourceList().get(i).equals(filterE.get(j).get(4)))
					{
						newFilterE.add(filterE.get(j));
					}
				}
			}
		}}}}
		caseClass.getFilterCaseList().clear();
     	activityClass.getFilterActivityList().clear();
     	eventClass.getFilterEventList().clear();
     	resourceClass.getFilterResourceList().clear();
		for(int k=0; k<newFilterE.size();k++){
			caseClass.getFilterCaseList().add(newFilterE.get(k).get(0));
			activityClass.getFilterActivityList().add(newFilterE.get(k).get(1));
	     	eventClass.getFilterEventList().add(newFilterE.get(k).get(2));
	     	resourceClass.getFilterResourceList().add(newFilterE.get(k).get(4));
		}
	}
	
	public void getNewFi(){
		System.out.println("whafkhwkhfhl"+newFilterE);
		System.out.println("size"+ newFilterE.size());
	}
	
	public ArrayList<ArrayList<String>> getfilterlist(){
		return newFilterE;
	}
}

