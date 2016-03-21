<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="Run.*"%>
<%
	ProAs p = (ProAs)session.getAttribute("ProAs");
	p.clearFilterList();
	String[] cas=request.getParameterValues("cas");
	String casg;
	if(cas!=null){
      for(int i=0; i< cas.length; i++) {
		casg = cas[i];
		p.getData().getCase().setFilterArrayList(casg);
	  }
	}
	String[] act=request.getParameterValues("act");
	String actg;
	if(act!=null){
	for(int i=0; i< act.length; i++) {
		actg= act[i];
		p.getData().getActivity().setFilterArrayList(actg);
	  }
	}
	String[] eve=request.getParameterValues("eve");
	String eveg;
	if(eve!=null){
	for(int i=0; i< eve.length; i++) {
		 eveg = eve[i];
		 p.getData().getEvent().setFilterArrayList(eveg);
	  }
	}
	String[] time=request.getParameterValues("time");
	String timeg;
	if(time!=null){
	for(int i=0; i< time.length; i++) {
		timeg= time[i];
		p.getData().getTimeStemp().setFilterArrayList(timeg);
	  }
	}
	String[] res=request.getParameterValues("res");
	String resg;
	if(res!=null){
	for(int i=0; i< res.length; i++) {
		 resg = res[i];
		 p.getData().getResource().setFilterArrayList(resg);
	  }
	}
	p.setPageNumOne();
	p.setDataTypFilter();
	p.getData().getff().setFilter();
	p.getData().getff().getNewFi();
	System.out.println(p.getDataTypeNum());
	System.out.println(p.getData().getff().getfilterlist());
%>
    <script>location.href = "ProAs_Main.jsp"; </script>