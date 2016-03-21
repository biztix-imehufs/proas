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
<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/serial.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>

<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/serial.js"></script>
<script src="http://www.amcharts.com/lib/3/pie.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>

<style>
#chartdiv {
	width	: 100%;
	height	: 300px;
}
#chartdiv2 {
	width	: 100%;
	height	: 300px;
	font-size	: 11px;
}					
#chartdiv3 {
	width		: 100%;
	height		: 300px;
	font-size	: 11px;
}			
</style>
    <meta charset="UTF-8">
    <title>Pattern Analysis</title>
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
										HUFS_IME - Web Developer <small>JSP Class_Project</small>
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
					<!-- <li><a href="ProAs_Sequence.jsp"><i class="fa fa-book"></i> <span>Log Replay</span></a></li> -->
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
            Pattern Analysis
            <small></small>
          </h1>
           File name : <%=session.getAttribute("filename") %>
          <ol class="breadcrumb">
            <li><a href="ProAs_Main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>ProAs_Analysis</li>
            <li class ="active"><a href="ProAs_Timeline.jsp">Pattern Analysis</a></li>
         
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-12">
              <!-- AREA CHART -->
              <div class="box box-primary">
                <div class="box-header with-border">
                 <font color="#white blue"> <h3 class="box-title">Detail Pattern Information</h3></font>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                         <li><a href="ProAs_setNumOne.jsp">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="ProAs_setNumTwo.jsp">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                
                  <!--/////////////////////////////  -->
                  Input the Pattern Number that you want to Check Detail ! 
                  <font color="black">
		<form method="post" action ="ProAs_Pattern.jsp">
			<input type="text" name = "patternName"/>
			<input type="submit" name ="Submit" value ="Submit" />
		</form> </font>
                <%
                
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String patternName = request.getParameter("patternName");
				
                
				ArrayList<String> time = new ArrayList<String>();
                ArrayList<String> PatternList = new ArrayList<String>();
                HashMap<String,Float> PatternTime = new HashMap<String,Float>();
                HashMap<String,Integer> PatternQty = new HashMap<String,Integer>();
                ArrayList<Float> PatternTimeList = new ArrayList<Float>();
                HashMap<String,Float> CumPatternTime = new HashMap<String,Float>();// Pattern 간 cummulative , 안씀
                HashMap<String,String> PatternKey = new HashMap<String,String>(); // Pattern 이 무슨 case id 포함 하는지
                ArrayList<String> selActivityList = new ArrayList<String>(); // selected pattern's activity
                HashMap<String,Float> selActivityTime = new HashMap<String,Float>(); // selected pattern's processing time
                ArrayList<Float> selCumTime = new ArrayList<Float>(); //selected pattern's cummulative 
               
                int indexCounter = 1;
                int initialQty = 1;
                float cumSumtime = 0;
                String caseIndex = FinalCaseList.get(0);
                String Pattern = "";
                String PatternStartTime = FinalTimeStampList.get(0);
                String PatternEndTime;
                Date PatternStart;
                Date PatternEnd;
                float PatternTotalTime=0;
                int firstindex = 0;
              
                for(int i=0;i<FinalCaseList.size();i++){	
                	
                	time.add(FinalTimeStampList.get(i));
                	
                	if(FinalCaseList.get(i).equals(caseIndex)){
                		Pattern+="-"+FinalActivityList.get(i);
                	}
                	else{
                		
                		
                		PatternStartTime=FinalTimeStampList.get(FinalCaseList.indexOf(caseIndex));
                		PatternEndTime=FinalTimeStampList.get(FinalCaseList.lastIndexOf(caseIndex));
                		PatternStart = df.parse(PatternStartTime.substring(0,10)+" "+PatternStartTime.substring(11,19));
                		PatternEnd = df.parse(PatternEndTime.substring(0,10)+" "+PatternEndTime.substring(11,19));
                		PatternTotalTime = (PatternEnd.getTime()-PatternStart.getTime())/1000;
                		
                		
                		// 다음 거랑 케이스아이디가 다른데, 기존에 있던 패턴
                		if(PatternTime.containsKey(Pattern)){
                			
                			float temp; float temp1; int temp2; String temp3;
                			
                			temp = PatternTime.get(Pattern);
                			PatternTime.remove(Pattern);
                			PatternTime.put(Pattern, temp+PatternTotalTime);
                			
                			temp1 = CumPatternTime.get(Pattern);
                			CumPatternTime.remove(Pattern);
                			CumPatternTime.put(Pattern, temp1+PatternTotalTime);
                			cumSumtime+=PatternTotalTime;
                			
                			temp2 = PatternQty.get(Pattern);
                			PatternQty.remove(Pattern);
                			PatternQty.put(Pattern, temp2+1);
                			
                			temp3 = PatternKey.get(Pattern);
                			PatternKey.put(Pattern, caseIndex);
                			//PatternKey.remove(Pattern);
                			//PatternKey.put(Pattern, temp3+"-"+FinalCaseList.get(i));
                			
                			
                			
                		}
                		
                		// 다음 거랑 케이스아이디가 다른데, 기존에 없던 패턴
                		else{
                			
                			//PatternList.add(Pattern);
                    		PatternTime.put(Pattern, PatternTotalTime);
                    		PatternQty.put(Pattern, initialQty);
                    		cumSumtime+=PatternTotalTime;
                    		CumPatternTime.put(Pattern, cumSumtime);
                    		PatternKey.put(Pattern,caseIndex);
                		}
                		
                		indexCounter++;
                		Pattern =  ""+FinalActivityList.get(i);
                		
                		caseIndex=FinalCaseList.get(i);
                	}
                
                }
                
                ArrayList<String> keyset = new ArrayList<String>();
               
                // key 에 pattern 추가해주기 
                for(String key:PatternTime.keySet()){
                	keyset.add(key);
                	
                }
                
                int patternindex =1;
                for(String key:keyset){
                	
                	PatternList.add("Pattern"+patternindex+" :"+key);
                	PatternTime.put("Pattern"+patternindex+" :"+key, PatternTime.get(key));
                	PatternTime.remove(key);
                	
                	PatternQty.put("Pattern"+patternindex+" :"+key, PatternQty.get(key));
                	PatternQty.remove(key);
                	CumPatternTime.put("Pattern"+patternindex+" :"+key, CumPatternTime.get(key));
                	CumPatternTime.remove(key);
                	PatternKey.put("Pattern"+patternindex+" :"+key, PatternKey.get(key));
                	PatternKey.remove(key);
                	patternindex++;
                	
                 }
                
                //System.out.println("keyset"+PatternTime.keySet());
                //System.out.println(PatternKey);
               // System.out.println(PatternList);
                
               
                if(patternName==null){patternName=PatternList.get(0).substring(7,PatternList.get(0).indexOf(':'));} //default 패턴 값
                
                
                //System.out.println("a"+patternName);
                //System.out.println(PatternKey);
                //System.out.println(PatternList);
              // System.out.println(patternName+" "+PatternKey+" "+PatternKey.get(patternName));
                // choosen pattern each act time
				
                Date DStart;
                Date DEnd;
				float cumdiff=0;
				
				//System.out.println(PatternList + " "+patternName);
				
				String selectedPattern = null;
				for(int i=0;i<PatternList.size();i++){
					String pattern = PatternList.get(i);
					if(pattern.contains(patternName)){
						selectedPattern = PatternList.get(i);
					}
				}
				
				//System.out.println(patternName + " - "+ selectedPattern);
				
				 for(int i=0;i<FinalActivityList.size();i++){
					 
					//System.out.println(p.getCaseList().get(i)+" "+PatternKey.get(patternName));
                	if(FinalCaseList.get(i).equals(PatternKey.get(selectedPattern))){
                		
                		selActivityList.add(FinalActivityList.get(i));
                		
            				if(i<FinalActivityList.size()-1){
            					if(FinalCaseList.get(i).equals(FinalCaseList.get(i+1))){
            						String StartTime = time.get(i);
            						String EndTime = time.get(i+1);
            						DStart = df.parse(StartTime.substring(0,10)+" "+StartTime.substring(11,19));
            						DEnd = df.parse(EndTime.substring(0,10)+" "+EndTime.substring(11,19));
            						float diff = DEnd.getTime()-DStart.getTime();
            						cumdiff+=diff;
            						selActivityTime.put(FinalActivityList.get(i), diff/1000);
            						selCumTime.add(cumdiff/1000);
            				}
            				else{
            					float diff = 500;
            					cumdiff+=500;
            					selActivityTime.put(FinalActivityList.get(i), diff/1000);
        						selCumTime.add(cumdiff/1000);
            				}
            				}
            				else if(FinalCaseList.get(i).equals(FinalCaseList.get(i+1))==false){
            					float diff = 500;
            					cumdiff+=500;
            					selActivityTime.put(FinalActivityList.get(i), diff/1000);
        						selCumTime.add(cumdiff/1000);
            					
            			}
                		
                	}
				 }
                
              
				
				StringBuffer allPatternBar = new StringBuffer();
				StringBuffer patternQtyPie = new StringBuffer();
				StringBuffer selActTimeAll = new StringBuffer();
				int graphindex = 0;
				
				int basetime=0;;
				int baseqty=0;;
				
				if(session.getAttribute("filename").equals("detail_activity_cut.mxml")&&p.getDataTypeNum()==1 ){
				basetime = 400000;
				baseqty =2;
				}else if(session.getAttribute("filename").equals("DetailActivity600.mxml.mxml")&&p.getDataTypeNum()==1 ){
					basetime = 40000;
					baseqty =2;
				}else if(session.getAttribute("filename").equals("BPIC15_1_1000.mxml.mxml")&&p.getDataTypeNum()==1 ){
					basetime = 6500000;
					baseqty =1;
				}
				
				for(String key : PatternTime.keySet()){
					
					if(PatternTime.get(key)>basetime){
					PatternTimeList.add(PatternTime.get(key));
					allPatternBar.append("{").append('"').append("name").append('"').append(":").append('"').append(key.substring(0,key.indexOf(':'))).append('"').append(",")
					.append('"').append("points").append('"').append(":").append(PatternTime.get(key)).append("}").append(",");
					}
					
					if(PatternQty.get(key)>baseqty){
					patternQtyPie.append("{").append('"').append("name").append('"').append(":").append('"').append(key.substring(0,key.indexOf(':'))).append('"').append(",")
					.append('"').append("points").append('"').append(":").append(PatternQty.get(key)).append("}").append(",");
				    }
					
					//graphindex++;
					//if(graphindex==10)break;
				
				}
				
					allPatternBar.deleteCharAt(allPatternBar.lastIndexOf(",")); 
					patternQtyPie.deleteCharAt(patternQtyPie.lastIndexOf(","));
					
					Collections.sort(PatternTimeList);
					
				// selactivitylist 에러 
				
				selActTimeAll.append("{").append('"').append("Activity").append('"').append(":").append('"').append(selActivityList.get(0)).append('"').append(",")
				.append('"').append("Processing Time").append('"').append(":").append(selActivityTime.get(selActivityList.get(0))).append(",")
				.append('"').append("Total Process Time").append('"').append(":").append(selCumTime.get(0)).append("}");
				
				
				for(int i=1;i<selActivityList.size();i++){
				
				selActTimeAll.append(",").append("{").append('"').append("Activity").append('"').append(":").append('"').append(selActivityList.get(i)).append('"').append(",")
				.append('"').append("Processing Time").append('"').append(":").append(selActivityTime.get(selActivityList.get(i))).append(",")
				.append('"').append("Total Process Time").append('"').append(":").append(selCumTime.get(i)).append("}");
				
				}
			
				
				//System.out.println(selActTimeAll);
				
				
%>
<script>
var chart = AmCharts.makeChart("chartdiv3", {
	  "type": "serial",
	  "addClassNames": true,
	  "theme": "light",
	  "path": "http://www.amcharts.com/lib/3/",
	  "autoMargins": false,
	  "marginLeft": 30,
	  "marginRight": 8,
	  "marginTop": 10,
	  "marginBottom": 26,
	  "balloon": {
	    "adjustBorderColor": false,
	    "horizontalPadding": 10,
	    "verticalPadding": 8,
	    "color": "#ffffff"
	  },

	  "dataProvider": [<%=selActTimeAll%>],
	  "valueAxes": [{
	    "axisAlpha": 0,
	    "position": "left"
	  }],
	  "startDuration": 1,
	  "graphs": [{
	    "alphaField": "alpha",
	    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	    "fillAlphas": 1,
	    "title": "Processing Time",
	    "type": "column",
	    "valueField": "Processing Time",
	    "dashLengthField": "dashLengthColumn"
	  }, {
	    "id": "graph2",
	    "balloonText": "<span style='font-size:12px;'>[[title]] in [[category]]:<br><span style='font-size:20px;'>[[value]]</span> [[additional]]</span>",
	    "bullet": "round",
	    "lineThickness": 3,
	    "bulletSize": 7,
	    "bulletBorderAlpha": 1,
	    "bulletColor": "#FFFFFF",
	    "useLineColorForBulletBorder": true,
	    "bulletBorderThickness": 3,
	    "fillAlphas": 0,
	    "lineAlpha": 1,
	    "title": "Total Process Time",
	    "valueField": "Total Process Time"
	  }],
	  "categoryField": "Activity",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "axisAlpha": 0,
	    "tickLength": 0
	  },
	  "export": {
	    "enabled": true
	  }
	});
	</script>
	<font size="2" color="white"><h3>Pattern <%=patternName %>'s Detail Activity</h3></font>
<div id="chartdiv3"></div>
 
                  <!--/////////////////////////////  -->
                </div><!-- /.box-body -->
              </div><!-- /.box --> 
		   </div>
          </div>
        
            
            <!-- /.col (LEFT) -->
            <div class="row">
            <div class="col-md-6">
              <!-- LINE CHART -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <font color="#white blue"><h3 class="box-title">Pattern's Total Processing Time</h3></font>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="ProAs_setNumOne.jsp">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="ProAs_setNumTwo.jsp">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  <!-- ///////////////////////////-->
                  <%System.out.println(allPatternBar); %>
                  
               <script>						
var chart = AmCharts.makeChart("chartdiv",
		{
		    "type": "serial",
			"theme": "dark",
		    "path": "http://www.amcharts.com/lib/3/",
		    "dataProvider": [
		                     <%=allPatternBar%>
		                     ],
		    "valueAxes": [{
		        "maximum": <%=PatternTimeList.get(PatternTimeList.size()-1)%>,
		        "minimum": 0,
		        "axisAlpha": 0,
		        "dashLength": 4,
		        "position": "left"
		    }],
		    "startDuration": 1,
		    "graphs": [{
		        "balloonText": "<span style='font-size:13px;'>[[category]]: <b>[[value]]</b></span>",
		        "bulletOffset": 16,
		        "bulletSize": 34,
		        "colorField": "color",
		        "cornerRadiusTop": 8,
		        "customBulletField": "bullet",
		        "fillAlphas": 0.8,
		        "lineAlpha": 0,
		        "type": "column",
		        "valueField": "points"
		    }],
		    "marginTop": 0,
		    "marginRight": 0,
		    "marginLeft": 0,
		    "marginBottom": 0,
		    "autoMargins": false,
		    "categoryField": "name",
		    "categoryAxis": {
		        "axisAlpha": 0,
		        "gridAlpha": 0,
		        "inside": true,
		        "tickLength": 0
		    },
		    "export": {
		    	"enabled": true
		     }
		});
		</script>   
                  <div id="chartdiv"></div>	
                  
                   <!-- ///////////////////////////-->
                   
                </div><!-- /.box-body -->
              </div><!-- /.box -->
				</div>
				
				
              <!-- BAR CHART -->
              
              <div class="col-md-6">
              <div class="box box-success">
                <div class="box-header with-border">
                 <font color="#white blue"> <h3 class="box-title">Pattern's Quantity</h3></font>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                        <div class="btn-group">
                      <button class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i></button>
                      <ul class="dropdown-menu" role="menu">
                         <li><a href="ProAs_setNumOne.jsp">Original Data</a></li>
                        <li class="divider"></li>
                        <li><a href="ProAs_setNumTwo.jsp">Filter Data</a></li>
                      </ul>
                    </div>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                <div class="box-body">
                  <!--//////////////////////////  -->
                  
                  <%


ArrayList<String> Pattern2 = new ArrayList<String>();
StringBuffer data2 = new StringBuffer();
Pattern2=null;//jbean.getPattern();
/* {"name": "John","points": 35654}, {"name": "Damon","points": 65456},
   {"name": "Mark","points": 13654,"color": "#DAF0FD"} */
/* for(int i=0;i<Pattern2.size();i++){
	data2.append("{").append('"').append("name").append('"').append(":").append('"').append(Pattern2.get(i).substring(0, 8)).append('"').append(",")
	.append('"').append("points").append('"').append(":").append(1).append("}").append(",");
	}
	data2.deleteCharAt(data2.lastIndexOf(",")); */

%>
<script>
var chart = AmCharts.makeChart( "chartdiv2", {
	  "type": "pie",
	  "theme": "dark",
	  "path": "http://www.amcharts.com/lib/3/",
	  "legend": {
	    "markerType": "circle",
	    "position": "right",
	    "marginRight": 80,
	    "autoMargins": false
	  },
	  "dataProvider": [
	                   <%=patternQtyPie%>
	                   ],
	  "valueField": "points",
	  "titleField": "name",
	  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
	  "export": {
	    "enabled": true
	  }
	} );
	
	
	
	
</script>
<div id="chartdiv2"></div>
<%
                  %>
                  
                  <!--///////////////////////////  -->
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            </div><!-- /.col (RIGHT) -->
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
