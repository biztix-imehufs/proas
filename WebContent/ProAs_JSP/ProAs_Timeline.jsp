<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import ="java.io.File" %>
       <%@ page import ="java.util.*" %>
       <%@ page import ="java.text.*" %>
    <%@ page import ="Run.*" %>
     <%ProAs p = (ProAs)session.getAttribute("ProAs");%>
    <%
     
     System.out.println("현재 데이터 타입 :"+p.getDataTypeNum());
     //Data pre-set
     
     ArrayList<String> FinalCaseList = new ArrayList<String>();
     ArrayList<String> FinalActivityList = new ArrayList<String>();
     ArrayList<String> FinalEventTypeList = new ArrayList<String>();
     ArrayList<String> FinalResourceList = new ArrayList<String>();
     ArrayList<String> FinalTimeStampList = new ArrayList<String>();
     ArrayList<String> FinalHashCaseList = new ArrayList<String>();
     ArrayList<String> FinalHashActivityList = new ArrayList<String>();
     ArrayList<String> FinalHashEventTypeList = new ArrayList<String>();
     ArrayList<String> FinalHashResourceList = new ArrayList<String>();
     ArrayList<String> FinalHashTimeStampList = new ArrayList<String>();
     HashMap<String,Integer> FinalDistinctCaseQty = new HashMap<String,Integer>();
     HashMap<String,Integer> FinalDistinctActivityQty = new HashMap<String,Integer>();
     
     
     if(p.getDataTypeNum()==1){
    	 FinalCaseList = p.getData().getCase().getCaseList();
    	 FinalActivityList = p.getData().getActivity().getActivityList();
    	 FinalEventTypeList = p.getData().getEvent().getEventList();
    	 FinalResourceList = p.getData().getResource().getResourceList();
    	 FinalTimeStampList = p.getData().getTimeStemp().getTimeStempList();
    	 FinalHashCaseList = p.getData().getCase().getHashCaseList();
    	 FinalHashActivityList = p.getData().getActivity().getHashActivityList();
    	 FinalHashEventTypeList = p.getData().getEvent().getHashEventList();
    	 FinalHashResourceList = p.getData().getResource().getHashResourceList();
    	 FinalHashTimeStampList = p.getData().getTimeStemp().getHashTimeStempList();
    	 FinalDistinctCaseQty = p.getDistinctCaseidQty();
    	 FinalDistinctActivityQty = p.getDistinctActQty();
     }
     else{
    	 FinalCaseList = p.getData().getCase().getFilterCaseList();
    	 FinalActivityList = p.getData().getActivity().getFilterActivityList();
    	 FinalEventTypeList = p.getData().getEvent().getFilterEventList();
    	 FinalResourceList = p.getData().getResource().getFilterResourceList();
    	 FinalTimeStampList = p.getData().getTimeStemp().getFilterTimeStempList();
    	 FinalHashCaseList = p.getData().getCase().getFilterHashCaseList();
    	 FinalHashActivityList = p.getData().getActivity().getFilterHashActivityList();
    	 FinalHashEventTypeList = p.getData().getEvent().getFilterHashEventList();
    	 FinalHashResourceList = p.getData().getResource().getFilterHashResourceList();
    	 FinalHashTimeStampList = p.getData().getTimeStemp().getHashTimeStempList();
    	 FinalDistinctCaseQty = p.getFilterDistinctCaseidQty();
    	 FinalDistinctActivityQty = p.getFilterDistinctActQty();
     } 
     
     
     
     
     %>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8">
    <title>TimeLine Analysis</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link href="dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<!-- iCheck -->
    <link href="plugins/iCheck/flat/blue.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue sidebar-mini">
    <div class="wrapper">

     <header class="main-header">
			<!-- Logo -->
			<a href="ProAs_Main.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>ProAs-</b>Home</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>ProAs_</b>Home</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="dist/img/hufs.jpg" class="user-image" alt="User Image" />
								<span class="hidden-xs">HUFS_IME</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img src="dist/img/hufs.jpg"
									class="img-circle" alt="User Image" />
									<p>
										HUFS_IME - I am E <small>DataMining_Project</small>
									</p></li>
								<!-- Menu Body -->
								<li class="user-body">
									<div>User By IME Students</div>
								</li>
								<!-- Menu Footer-->
								<li class="user-footer">

									<div class="pull-right">
										<a href="ProAs_Login.jsp" class="btn btn-default btn-flat">Sign
											out</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
					</ul>
				</div>
			</nav>
		</header>
      
    
      <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="dist/img/IamE.jpg" />
					</div>
			
				</div>




				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">ProAs_Menu</li>
			   <li><a href="ProAs_Main.jsp"><i class="fa fa-dashboard"></i> <span>ProAs_Home</span></a></li>
               <li><a href="ProAs_BasicAnalysis.jsp"><i class="fa fa-book"></i> <span>Basic Analysis </span></a></li>
               <li><a href="ProAs_Timeline.jsp"><i class="fa fa-book"></i> <span>TimeLine Analysis</span></a></li>
               <li><a href="ProAs_Utilization.jsp"><i class="fa fa-book"></i> <span>Utilization Analysis</span></a></li>
               <li><a href="ProAs_Pattern.jsp"><i class="fa fa-book"></i> <span>Pattern Analysis</span></a></li>
               <li><a href="ProAs_SequenceAnalysis.jsp"><i class="fa fa-book"></i> <span>Sequence Analysis</span></a></li>
					 <li class="treeview">
             		 <a href="#">
                <i class="fa fa-pie-chart"></i> <span>Data Type</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
               <ul class="treeview-menu">
                <li>
                  <a href="ProAs_setDTNumOne.jsp"><i class="fa fa-circle-o"></i> Original Data </a>
                  <a href="ProAs_setDTNumTwo.jsp"><i class="fa fa-circle-o"></i> Filter Data </a>
                  <a href="ProAs_Start.jsp"><i class="fa fa-circle-o"></i> Change Data </a>
                </li>
              </ul>
            </li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            TimeLine Analysis
            <small> </small>
          </h1>
          File name : <%=session.getAttribute("filename") %>
          <ol class="breadcrumb">
            <li><a href="ProAs_Main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>ProAs_Analysis</li>
            <li class ="active"><a href="ProAs_Timeline.jsp">TimeLine</a></li>
         
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-12">
              <!-- AREA CHART -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <font color="white blue"><h3 class="box-title">TimeLine</h3></font>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  
                  Input the Case Number that you want to Check Detail !<br>
                  <font color="black">
                  <form method="post" action ="ProAs_Timeline.jsp">
			<input type="text" name = "casename"/>
			<input type="submit" name ="Submit" value ="Submit" />
		</form></font>
		<Br>
                  <%	
			
			String casname = request.getParameter("casename");
			//System.out.println(casname);
			
			if(casname==null){casname=FinalCaseList.get(0);}
			else if(FinalCaseList.contains(casname)==false){casname=FinalCaseList.get(0);}
			StringBuffer data = new StringBuffer();
			
			ArrayList<String> cas = new ArrayList<String>();
			ArrayList<String> tim = new ArrayList<String>();
			ArrayList<String> act = new ArrayList<String>();
			
			for(int i =0; i< FinalCaseList.size();i++){
				//System.out.println(i+"aaa");
				if(FinalCaseList.get(i).equals(casname)){
					//System.out.println(i);
					cas.add(FinalCaseList.get(i));
					act.add(FinalActivityList.get(i));
					tim.add(FinalTimeStampList.get(i));
					//System.out.println(cas.get(0)+" "+act.get(0)+" "+tim.get(0) );
				}
			}
		
			int k = tim.size()-1;
			String last = tim.get(k);
			tim.add(last);
			
			//42	4	reject request	2011-01-12 15:44:00	Ellen	complete
			 ArrayList<String> inyear = new ArrayList<String>();
			 ArrayList<String> inmonth = new ArrayList<String>();
			 ArrayList<String> indate = new ArrayList<String>();
			 ArrayList<String> inhour = new ArrayList<String>();
			 ArrayList<String> inmin = new ArrayList<String>();
			 //ArrayList insec = new ArrayList();
			
			 ArrayList<String> outyear = new ArrayList<String>();
			 ArrayList<String> outmonth = new ArrayList<String>();
			 ArrayList<String> outdate = new ArrayList<String>();
			 ArrayList<String> outhour = new ArrayList<String>();
			 ArrayList<String> outmin = new ArrayList<String>();
			 //ArrayList outsec = new ArrayList();
			 
			 
			 for(int i =0;i<tim.size()-1;i++){
				
				 String time = (String)tim.get(i);
				 String syear = time.substring(0,4);
				 String smonth = time.substring(5,7);
				 String sdate = time.substring(8,10);
				 String shour = time.substring(11,13);
				 String smin = time.substring(14,16);
				 
				 inyear.add(syear);inmonth.add(smonth);indate.add(sdate);inhour.add(shour);inmin.add(smin);
				 
			 }
			 
			 for(int i =1;i<tim.size();i++){
				
				 String time = (String)tim.get(i);
				 String syear = time.substring(0,4);
				 String smonth = time.substring(5,7);
				 String sdate = time.substring(8,10);
				 String shour = time.substring(11,13);
				 String smin = time.substring(14,16);
				 
				 outyear.add(syear);outmonth.add(smonth);outdate.add(sdate);outhour.add(shour);outmin.add(smin);
				 
			 }
			 
			
			
			data.append('[').append("'").append(act.get(0)).append("'")
				.append(',').append("'").append("Case_"+cas.get(0)).append("'")
				.append(',').append("new Date(").append(inyear.get(0)).append(",")
				.append(inmonth.get(0)).append(",").append(indate.get(0)).append(",")
				.append(inhour.get(0)).append(",").append(inmin.get(0)).append(",").append(0).append(")")
				.append(',').append("new Date(").append(outyear.get(0)).append(",")
				.append(outmonth.get(0)).append(",").append(outdate.get(0)).append(",")
				.append(outhour.get(0)).append(",").append(outmin.get(0)).append(",").append(0).append(")")
				.append(']');

			 for(int i =1 ;i< tim.size()-1;i++){
				    data.append(",").append('[').append("'").append(act.get(i)).append("'")
					.append(',').append("'").append("Case_"+cas.get(i)).append("'")
					.append(',').append("new Date(").append(inyear.get(i)).append(",")
					.append(inmonth.get(i)).append(",").append(indate.get(i)).append(",")
					.append(inhour.get(i)).append(",").append(inmin.get(i)).append(",").append(i).append(")")
					.append(',').append("new Date(").append(outyear.get(i)).append(",")
					.append(outmonth.get(i)).append(",").append(outdate.get(i)).append(",")
					.append(outhour.get(i)).append(",").append(outmin.get(i)).append(",").append(i).append(")")
					.append(']');
				    }
			 %>
			

 <script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization',
       'version':'1','packages':['timeline']}]}"></script>
<script type="text/javascript">

google.setOnLoadCallback(drawChart);
function drawChart() {

  var container = document.getElementById('example5.1');
  var chart = new google.visualization.Timeline(container);
  var dataTable = new google.visualization.DataTable();
  dataTable.addColumn({ type: 'string', id: 'CaseID' });
  dataTable.addColumn({ type: 'string', id: 'Activity' });
  dataTable.addColumn({ type: 'date', id: 'StartTimetime' });
  dataTable.addColumn({ type: 'date', id: 'EndTime' });
  dataTable.addRows([<%=data%>]);
  

  var options = {
    timeline: { colorByRowLabel: true },

    backgroundColor : "#0d0d0d",
  };

  chart.draw(dataTable, options);
}
</script> 
     	
     	<div id="example5.1" style="width: 100%; height: 350px;"></div>          
                  
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (LEFT) -->
            
          </div><!-- /.row -->


  <div class="row">
            <div class="col-md-4">
              <!-- AREA CHART -->
              <div class="box box-primary" style="background-color:black; ">
                <div class="box-header with-border">
                  <font color="white blue"><h3 class="box-title">Work Event Quantity by Day</h3></font>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  
                 <%
                  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                  ArrayList<String> time = new ArrayList<String>();
                  HashMap<String,Integer> WorkbyDay = new HashMap<String,Integer>();
                  ArrayList<String> week = new ArrayList<String>();
                  ArrayList<String> weekAll = new ArrayList<String>();
                  
                  for(String a:FinalTimeStampList){
          			time.add(a.substring(0,10)+" "+a.substring(11,19));
          		}
                  WorkbyDay.put("Monday", 0);
                  WorkbyDay.put("Tuesday", 0);
                  WorkbyDay.put("Wednesday", 0);
                  WorkbyDay.put("Thursday", 0);
                  WorkbyDay.put("Friday", 0);
                  WorkbyDay.put("Saturday", 0);
                  WorkbyDay.put("Sunday", 0);
                  
                  week.add("Monday"); week.add("Tuesday"); week.add("Wednesday"); week.add("Thursday");
                  week.add("Friday"); week.add("Saturday"); week.add("Sunday");
                  
                  for(int i=0;i<time.size();i++){
                  Date dt1=df.parse(time.get(i));
                  DateFormat format2=new SimpleDateFormat("EEEE",Locale.ENGLISH); 
                  String finalDay=format2.format(dt1);
				
                  int temp;
                  
                  switch (finalDay) {
                  case "Monday"    :
                	  temp = WorkbyDay.get("Monday");
                	  WorkbyDay.remove("Monday");
                	  WorkbyDay.put("Monday", temp+1);
                	  weekAll.add("Monday");
                                break;
                  case "Tuesday"   : 
                	  temp = WorkbyDay.get("Tuesday");
                	  WorkbyDay.remove("Tuesday");
                	  WorkbyDay.put("Tuesday", temp+1);
                	  weekAll.add("Tuesday");
                                break;
                  case "Wednesday"  : 
                	  temp = WorkbyDay.get("Wednesday");
                	  WorkbyDay.remove("Wednesday");
                	  WorkbyDay.put("Wednesday", temp+1);
                	  weekAll.add("Wednesday");
                                break;
                  case "Thursday"  : 
                	  temp = WorkbyDay.get("Thursday");
                	  WorkbyDay.remove("Thursday");
                	  WorkbyDay.put("Thursday", temp+1);
                	  weekAll.add("Thursday");
                  				break;
                  case "Friday"  : 
                	  temp = WorkbyDay.get("Friday");
                	  WorkbyDay.remove("Friday");
                	  WorkbyDay.put("Friday", temp+1);
                	  weekAll.add("Friday");
                  				break;
                  case "Saturday"  : 
                	  temp = WorkbyDay.get("Saturday");
                	  WorkbyDay.remove("Saturday");
                	  WorkbyDay.put("Saturday", temp+1);
                	  weekAll.add("Saturday");
                  				break;
                  case "Sunday"  : 
                	  temp = WorkbyDay.get("Sunday");
                	  WorkbyDay.remove("Sunday");
                	  WorkbyDay.put("Sunday", temp+1);
                	  weekAll.add("Sunday");
                  				break;
                  default    : 
                                break;
                }
                  
                  
                  }
                  
                  StringBuffer wdRadar = new StringBuffer();
                 	 wdRadar.append('{').append('"').append("day").append('"').append(':').append('"').append(week.get(0)).append('"')
					.append(',').append('"').append("work").append('"').append(':').append(WorkbyDay.get(week.get(0))).append('}'); 
					
					for(int i=1;i<week.size();i++){
						
					 wdRadar.append(',').append('{').append('"').append("day").append('"').append(':').append('"').append(week.get(i)).append('"')
					.append(',').append('"').append("work").append('"').append(':').append(WorkbyDay.get(week.get(i))).append('}'); 
							
					}
                  %>
                  
                  <style>
                  #chartdiv {
					width		: 100%;
					height		: 300px;
					font-size	: 11px;
				  }				
                  </style>
                  <script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
			 	  <script src="http://www.amcharts.com/lib/3/radar.js"></script>
				  <script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>
                  <div id="chartdiv"></div>			
                  <script type="text/javascript">
                  var chart = AmCharts.makeChart( "chartdiv", {
                	  "type": "radar",
                	  "theme": "dark",
                	  "dataProvider": [ <%=wdRadar%>],
                	  "valueAxes": [ {
                	    "axisTitleOffset": 20,
                	    "minimum": 0,
                	    "axisAlpha": 0.15
                	  } ],
                	  "startDuration": 0,
                	  "graphs": [ {
                	    "balloonText": "[[value]] work per day",
                	    "bullet": "round",
                	    "valueField": "work"
                	  } ],
                	  "categoryField": "day",
                	  "export": {
                	    "enabled": true
                	  }
                	} );</script>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (LEFT) -->
            
            
            <div class="col-md-8">
              <!-- AREA CHART -->
              <div class="box box-primary" style="background-color:black; ">
                <div class="box-header with-border">
 					<font color="white blue"><h3 class="box-title">Work Event Time by Day</h3></font>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  
             			    <script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
							<script src="http://www.amcharts.com/lib/3/serial.js"></script>
							<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>

							
														
							<style>
							#chartdiv3 {
								width	: 100%;
								height	: 300px;
							}									
																			
							</style>
							
							<%
							
							
							Date StartActTime = null;
							Date EndActTime = null;
							
							int LastIndex = 0;

							
						
							HashMap<String,Float> DistinctDayWorkTime = new HashMap<String,Float>();
							
						
							
							
							time.add(time.get(time.size()-1));
							
							float initial = 0;
							
							DistinctDayWorkTime.put(weekAll.get(0),initial);
							
							//float CwTime = 0;
							
							for(int i=0;i<weekAll.size()-1;i++){
								
								float CwTime;
								StartActTime = df.parse(time.get(i));
								EndActTime = df.parse(time.get(i+1));
								
								CwTime = (EndActTime.getTime()-StartActTime.getTime())/1000;
								
								if(CwTime>0){
									
								
								//System.out.println(CwTime);
								if(DistinctDayWorkTime.containsKey(weekAll.get(i))){
									float temp;
									temp = DistinctDayWorkTime.get(weekAll.get(i));
									DistinctDayWorkTime.remove(weekAll.get(i));
									DistinctDayWorkTime.put(weekAll.get(i), temp+CwTime);
									//System.out.println(CwTime+temp);
								}
								else{
									DistinctDayWorkTime.put(weekAll.get(i), CwTime);
								}
								}
								//System.out.println(DistinctDayWorkTime);
							}
							
							
							StringBuffer TimeLine = new StringBuffer();
							TimeLine.append('{').append('"').append("date").append('"').append(':').append('"').append(week.get(0)).append('"')
							.append(',').append('"').append("value").append('"').append(':').append(DistinctDayWorkTime.get(week.get(0))).append('}'); 
							
							for(int i=1;i<week.size();i++){
								
							TimeLine.append(',').append('{').append('"').append("date").append('"').append(':').append('"').append(week.get(i)).append('"')
							.append(',').append('"').append("value").append('"').append(':').append(DistinctDayWorkTime.get(week.get(i))).append('}'); 
									
							//System.out.println(TimeLine);
							} 
							
							//System.out.println(TimeLine);
							%>
							
							
							<div id="chartdiv3"></div>	
											
							
							<script>
							  var chart = AmCharts.makeChart( "chartdiv3", {
							  "type": "serial",
							  "theme": "dark",
							  "dataProvider": [ <%=TimeLine%>],
							  "valueAxes": [ {
							    "gridColor": "#FFFFFF",
							    "gridAlpha": 0.2,
							    "dashLength": 0
							  } ],
							  "gridAboveGraphs": true,
							  "startDuration": 1,
							  "graphs": [ {
							    "balloonText": "[[date]]: <b>[[value]]</b>",
							    "fillAlphas": 0.8,
							    "lineAlpha": 0.2,
							    "type": "column",
							    "valueField": "value"
							  } ],
							  "chartCursor": {
							    "categoryBalloonEnabled": false,
							    "cursorAlpha": 0,
							    "zoomable": false
							  },
							  "categoryField": "date",
							  "categoryAxis": {
							    "gridPosition": "start",
							    "gridAlpha": 0,
							    "tickPosition": "start",
							    "tickLength": 20
							  },
							  "export": {
							    "enabled": true
							  }
							
							} );
							  </script>
                 
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (LEFT) -->
            
            
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
 
      
      <!-- Control Sidebar -->      
      <aside class="control-sidebar control-sidebar-dark">                
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Home tab content -->
          <div class="tab-pane" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-birthday-cake bg-red"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
                    <p>Will be 23 on April 24th</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-user bg-yellow"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>
                    <p>New phone +1(800)555-1234</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>
                    <p>nora@example.com</p>
                  </div>
                </a>
              </li>
              <li>
                <a href='javascript::;'>
                  <i class="menu-icon fa fa-file-code-o bg-green"></i>
                  <div class="menu-info">
                    <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>
                    <p>Execution time 5 seconds</p>
                  </div>
                </a>
              </li>
            </ul><!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3> 
            <ul class='control-sidebar-menu'>
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Custom Template Design
                    <span class="label label-danger pull-right">70%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Update Resume
                    <span class="label label-success pull-right">95%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-success" style="width: 95%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Laravel Integration
                    <span class="label label-waring pull-right">50%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
                  </div>                                    
                </a>
              </li> 
              <li>
                <a href='javascript::;'>               
                  <h4 class="control-sidebar-subheading">
                    Back End Framework
                    <span class="label label-primary pull-right">68%</span>
                  </h4>
                  <div class="progress progress-xxs">
                    <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
                  </div>                                    
                </a>
              </li>               
            </ul><!-- /.control-sidebar-menu -->         

          </div><!-- /.tab-pane -->
          <!-- Stats tab content -->
          <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div><!-- /.tab-pane -->
          <!-- Settings tab content -->
          <div class="tab-pane" id="control-sidebar-settings-tab">            
            <form method="post">
              <h3 class="control-sidebar-heading">General Settings</h3>
              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Report panel usage
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Some information about this general settings option
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Allow mail redirect
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Other sets of options are available
                </p>
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Expose author name in posts
                  <input type="checkbox" class="pull-right" checked />
                </label>
                <p>
                  Allow the user to show his name in blog posts
                </p>
              </div><!-- /.form-group -->

              <h3 class="control-sidebar-heading">Chat Settings</h3>

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Show me as online
                  <input type="checkbox" class="pull-right" checked />
                </label>                
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Turn off notifications
                  <input type="checkbox" class="pull-right" />
                </label>                
              </div><!-- /.form-group -->

              <div class="form-group">
                <label class="control-sidebar-subheading">
                  Delete chat history
                  <a href="javascript::;" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
                </label>                
              </div><!-- /.form-group -->
            </form>
          </div><!-- /.tab-pane -->
        </div>
      </aside><!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class='control-sidebar-bg'></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- ChartJS 1.0.1 -->
    <script src="plugins/chartjs/Chart.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
    <!-- page script -->

  </body>
</html>
