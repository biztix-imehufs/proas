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
<script src="http://www.amcharts.com/lib/3/gauge.js"></script>
<script src="http://www.amcharts.com/lib/3/themes/light.js"></script>
<script src="http://www.amcharts.com/lib/3/pie.js"></script>


<style>
#chartdiv {
	width: 100%;
	height: 400px;
	font-size: 13px;
}

#chartdiv2 {
	width: 100%;
	height: 500px;
	font-size: 11px;
}
</style>




<meta charset="UTF-8">
<title>Basic Analysis</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
	<!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link href="dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link href="dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css" />
<!-- iCheck -->
<link href="plugins/iCheck/flat/blue.css" rel="stylesheet"
	type="text/css" />
<!-- Morris chart -->
<link href="plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link href="plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link href="plugins/datepicker/datepicker3.css" rel="stylesheet"
	type="text/css" />
<!-- Daterange picker -->
<link href="plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />
<!-- DataTables -->
    <link rel="stylesheet" href="dataTables.bootstrap.css">	
	
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
						<img src="dist/img/IamE.jpg"  />
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
					Basic Analysis <small></small>
				</h1>
				
				File name : <%=session.getAttribute("filename") %>
				<ol class="breadcrumb">
					<li><a href="MPAS_Main.jsp"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li>ProAs_Analysis</li>
					<li class="active"><a href="MPAS_Timeline.jsp">Basic</a></li>
					
					

				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			
			
			
			<!-- row start dddddd -->
			<div class="row">
            <div class="col-md-8">
              <!-- AREA CHART -->
              <div class="box box-primary" >
                <div class="box-header with-border">
                  <font color="white blue"><h3 class="box-title">Data Table</h3></font>
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
                <div class="box-body" >
								

								<table id="example1" class="table table-bordered">
                    <thead>
                      <tr>
                        <th>Event</th>
                        <th>CaseID</th>
                        <th>Activity</th>
                        <th>EventType</th>
                        <th>Resource</th>
                        <th>TimeStamp</th>
                      </tr>
                    </thead>
                    <tbody>
                    <%
					for(int i=0;i<FinalCaseList.size();i++){%>
                      <tr>
                        <td><%=i+1 %></td>
                        <td><%=FinalCaseList.get(i) %></td>
                        <td><%=FinalActivityList.get(i) %></td>
                        <td><%=FinalEventTypeList.get(i) %></td>
                        <td><%=FinalResourceList.get(i) %></td>
                        <td><%=FinalTimeStampList.get(i) %></td>
                       
                      </tr>
                      <%} %>
                     
                    </tbody>
                    <tfoot>
                      <tr>
                        <th>Event</th>
                        <th>CaseID</th>
                        <th>Activity</th>
                        <th>EventType</th>
                        <th>Resource</th>
                        <th>TimeStamp</th>
                      </tr>
                    </tfoot>
                  </table>
				
                
					</div>

                  <!--/////////////////////////////  -->
                </div><!-- /.box-body -->
              </div><!-- /.box --> 
              
                 <div class="col-md-4">
              <!-- AREA CHART -->
              <div class="box box-primary" style="background-color:black; ">
                <div class="box-header with-border">
                  <font color="white blue"><h3 class="box-title">Distinct Data Quantity</h3></font>
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
                <div class="box-body" >
				<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
				<script src="http://www.amcharts.com/lib/3/serial.js"></script>
				<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>
							
				<%
				StringBuffer DistinctQtyBar = new StringBuffer();
				DistinctQtyBar.append('{').append('"').append("Attributes").append('"').append(':').append('"').append("Event").append('"')
				.append(',').append('"').append("Quantity").append('"').append(':').append(FinalCaseList.size()).append('}').append(','); 
				DistinctQtyBar.append('{').append('"').append("Attributes").append('"').append(':').append('"').append("Case").append('"')
				.append(',').append('"').append("Quantity").append('"').append(':').append(FinalHashCaseList.size()).append('}').append(','); 
				DistinctQtyBar.append('{').append('"').append("Attributes").append('"').append(':').append('"').append("Activity").append('"')
				.append(',').append('"').append("Quantity").append('"').append(':').append(FinalHashActivityList.size()).append('}').append(','); 
				DistinctQtyBar.append('{').append('"').append("Attributes").append('"').append(':').append('"').append("EventType").append('"')
				.append(',').append('"').append("Quantity").append('"').append(':').append(FinalHashEventTypeList.size()).append('}').append(','); 
				DistinctQtyBar.append('{').append('"').append("Attributes").append('"').append(':').append('"').append("TimeStamp").append('"')
				.append(',').append('"').append("Quantity").append('"').append(':').append(FinalHashTimeStampList.size()).append('}'); 
				
				//System.out.println(DistinctQtyBar);
				//    {"year": 2005,"income": 23.5,"expenses": 18},
				// [{"year": 2005,"income": 23.5,"expenses": 18.1},
				%>
							
				<style>
				#chartdiv5 {
					width		: 100%;
					height		: 500px;
					font-size	: 11px;
				}						
				</style>
				<div id="chartdiv5"></div>		
			
				<script type="text/javascript">
				var chart = AmCharts.makeChart("chartdiv5", {
					"type": "serial",
				     "theme": "dark",
					"categoryField": "Attributes",
					"rotate": true,
					"startDuration": 1,
					"categoryAxis": {
						"gridPosition": "start",
						"position": "left"
					},
					"trendLines": [],
					"graphs": [
						
						{
							"balloonText": "Quantity:[[value]]",
							"fillAlphas": 0.8,
							"id": "AmGraph-2",
							"lineAlpha": 0.2,
							"title": "Quantity",
							"type": "column",
							"valueField": "Quantity"
						}
					],
					"guides": [],
					"valueAxes": [
						{
							"id": "ValueAxis-1",
							"position": "top",
							"axisAlpha": 0
						}
					],
					"allLabels": [],
					"balloon": {},
					"titles": [],
					"dataProvider": [
						<%=DistinctQtyBar%>
					],
				    "export": {
				    	"enabled": true
				     }

				});
				</script>						
					</div>

                  <!--/////////////////////////////  -->
                </div><!-- /.box-body -->
              </div><!-- /.box --> 
              
		   </div>
		   
				<div class="row">
					<div class="col-md-4" >
						<!-- AREA CHART -->
						<div class="box box-primary" style="background-color:black; ">
							<div class="box-header with-border">
								<font color="white blue"><h3 class="box-title">Event Information</h3></font>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-box-tool dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-wrench"></i>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="MPAS_setNumOne.jsp">Original Data</a></li>
											<li class="divider"></li>
											<li><a href="MPAS_setNumTwo.jsp">Filter Data</a></li>
										</ul>
									</div>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body">

							<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
							<script src="http://www.amcharts.com/lib/3/serial.js"></script>
							<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>

							<style>
							#chartdiv {
							width		: 100%;
							height		: 400px;
							font-size	: 11px;
							}					
							</style>
							
							<%
							HashMap<String,Integer> DistinctCaseidQty = FinalDistinctCaseQty;
							
							
							StringBuffer EntityBar = new StringBuffer();
							EntityBar.append('{').append('"').append("CaseID").append('"').append(':').append('"').append("Case"+FinalHashCaseList.get(0)).append('"')
							.append(',').append('"').append("Qty").append('"').append(':').append(DistinctCaseidQty.get(FinalHashCaseList.get(0))).append('}'); 
							
							for(int i=1;i<FinalHashCaseList.size();i++){
								
							//if(DistinctCaseidQty.get(FinalHashCaseList.get(i))>5){
							EntityBar.append(',').append('{').append('"').append("CaseID").append('"').append(':').append('"').append("Case"+FinalHashCaseList.get(i)).append('"')
							.append(',').append('"').append("Qty").append('"').append(':').append(DistinctCaseidQty.get(FinalHashCaseList.get(i))).append('}'); 
							}
							
							//}
						
							%>
							<div id="chartdiv"></div>				
															
							<script type="text/javascript">
							var chart = AmCharts.makeChart( "chartdiv", {
								  "type": "serial",
								  "theme": "dark",
								  "dataProvider": [ <%=EntityBar%>],
								  "valueAxes": [ {
								    "gridColor": "#FFFFFF",
								    "gridAlpha": 0.2,
								    "dashLength": 0,
								    
								  } ],
								  "gridAboveGraphs": true,
								  "startDuration": 1,
								  "graphs": [ {
								    "balloonText": "[[category]]: <b>[[value]]</b>",
								    "fillAlphas": 0.8,
								    "lineAlpha": 0.2,
								    "type": "column",
								    "valueField": "Qty"
								  } ],
								  "chartCursor": {
								    "categoryBalloonEnabled": false,
								    "cursorAlpha": 0,
								    "zoomable": false
								  },
								  "categoryField": "CaseID",
								  "categoryAxis": {
								    "gridPosition": "start",
								    "gridAlpha": 0,
								    "tickPosition": "start",
								    "tickLength": 20,
								    "labelsEnabled": false

								  },
								  "export": {
								    "enabled": true
								  }

								} );
								</script>				
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
						
						<!-- DONUT CHART -->
						
						<!-- /.box -->

					</div>
					<!-- /.col (LEFT) -->
					<div class="col-md-4">
						<!-- LINE CHART -->
						<div class="box box-info" style="background-color:black; ">
							<div class="box-header with-border">
								<font color="white blue"><h3 class="box-title">Activity Information</h3></font>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-box-tool dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-wrench"></i>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="MPAS_setNumOne.jsp">Original Data</a></li>
											<li class="divider"></li>
											<li><a href="MPAS_setNumTwo.jsp">Filter Data</a></li>
										</ul>
									</div>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body">
							
							<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
							<script src="http://www.amcharts.com/lib/3/pie.js"></script>
							<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>
														
							<style>
							#chartdiv2 {
								width		: 100%;
								height		: 400px;
								font-size	: 11px;
							}							
							</style>
							
							<%
							HashMap<String,Integer> DistinctActidQty = FinalDistinctActivityQty;
							
							StringBuffer ActivityPie = new StringBuffer();
							ActivityPie.append('{').append('"').append("ActID").append('"').append(':').append('"').append(FinalHashActivityList.get(0)).append('"')
							.append(',').append('"').append("Qty").append('"').append(':').append(DistinctActidQty.get(FinalHashActivityList.get(0))).append('}'); 
							
							for(int i=1;i<FinalHashActivityList.size();i++){
								
							ActivityPie.append(',').append('{').append('"').append("ActID").append('"').append(':').append('"').append(FinalHashActivityList.get(i)).append('"')
							.append(',').append('"').append("Qty").append('"').append(':').append(DistinctActidQty.get(FinalHashActivityList.get(i))).append('}'); 
									
							}
							
							
							%>
							
							<div id="chartdiv2"></div>	
											
							<%p.clearDistinctActQty(); %>
							<script type="text/javascript">
							var chart = AmCharts.makeChart( "chartdiv2", {
								  "type": "pie",
								  "theme": "dark",
								  "color": "white",
								  "dataProvider": [ <%=ActivityPie%>],
								  "valueField": "Qty",
								  "titleField": "ActID",
								   "balloon":{
								   "fixedPosition":false,
								   
								   
								  },
								  "export": {
								    "enabled": true
								  }
								} );
							</script>
								

							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
							


					</div>
					<!-- /.col (RIGHT) -->
					
					
					<div class="col-md-4">
						<!-- LINE CHART -->
						<div class="box box-info" style="background-color:black; ">
							<div class="box-header with-border">
								<font color="white blue"><h3 class="box-title">Time Information</h3></font>
								<div class="box-tools pull-right">
									<button class="btn btn-box-tool" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<div class="btn-group">
										<button class="btn btn-box-tool dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-wrench"></i>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="MPAS_setNumOne.jsp">Original Data</a></li>
											<li class="divider"></li>
											<li><a href="MPAS_setNumTwo.jsp">Filter Data</a></li>
										</ul>
									</div>
									<button class="btn btn-box-tool" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body">
							
							<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
							<script src="http://www.amcharts.com/lib/3/serial.js"></script>
							<script src="http://www.amcharts.com/lib/3/themes/dark.js"></script>
							
														
							<style>
							#chartdiv3 {
								width	: 100%;
								height	: 400px;
							}									
																			
							</style>
							
							<%
							
							
							Date StartActTime = null;
							Date EndActTime = null;
							
							int LastIndex = 0;

							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							ArrayList<String> Date = new ArrayList<String>();
							ArrayList<String> fulltime = new ArrayList<String>();
						
							HashMap<String,Float> DistinctDayWorkTime = new HashMap<String,Float>();
							ArrayList<String> DistinctDate = new ArrayList<String>();
							
							for(String a:FinalTimeStampList){
								Date.add(a.substring(0,10));
								fulltime.add(a.substring(0,10)+" "+a.substring(11,19));
							}
							
							fulltime.add(fulltime.get(fulltime.size()-1));
							Date.add(Date.get(Date.size()-1));
							
							float initial = 0;
							
							DistinctDayWorkTime.put(Date.get(0),initial);
							DistinctDate.add(Date.get(0));
							
							//float CwTime = 0;
							
							for(int i=0;i<fulltime.size()-1;i++){
								
								float CwTime;
								StartActTime = df.parse(fulltime.get(i));
								EndActTime = df.parse(fulltime.get(i+1));
								
								CwTime = (EndActTime.getTime()-StartActTime.getTime())/1000;
								
								if(CwTime>0){
									
								
								//System.out.println(CwTime);
								if(DistinctDayWorkTime.containsKey(Date.get(i))){
									float temp;
									temp = DistinctDayWorkTime.get(Date.get(i));
									DistinctDayWorkTime.remove(Date.get(i));
									DistinctDayWorkTime.put(Date.get(i), temp+CwTime);
									//System.out.println(CwTime+temp);
								}
								else{
									DistinctDayWorkTime.put(Date.get(i), CwTime);
									DistinctDate.add(Date.get(i));
								}
								}
							}
							
							Collections.sort(DistinctDate);
							
							StringBuffer TimeLine = new StringBuffer();
							TimeLine.append('{').append('"').append("date").append('"').append(':').append('"').append(DistinctDate.get(0)).append('"')
							.append(',').append('"').append("value").append('"').append(':').append(DistinctDayWorkTime.get(DistinctDate.get(0))).append('}'); 
							
							for(int i=1;i<DistinctDate.size();i++){
								
							TimeLine.append(',').append('{').append('"').append("date").append('"').append(':').append('"').append(DistinctDate.get(i)).append('"')
							.append(',').append('"').append("value").append('"').append(':').append(DistinctDayWorkTime.get(DistinctDate.get(i))).append('}'); 
									
							} 
							
							//System.out.println(TimeLine);
							%>
							
							
							<div id="chartdiv3"></div>	
											
							
							<script type="text/javascript">
							var chart = AmCharts.makeChart("chartdiv3", {
							    "type": "serial",
							    "theme": "dark",
							    "marginRight": 80,
							    "autoMarginOffset": 20,
							    "dataDateFormat": "YYYY-MM-DD",
							    "valueAxes": [{
							        "id": "v1",
							        "axisAlpha": 0,
							        "position": "left"
							    }],
							    "balloon": {
							        "borderThickness": 1,
							        "shadowAlpha": 0
							    },
							    "graphs": [{
							        "id": "g1",
							        "bullet": "round",
							        "bulletBorderAlpha": 1,
							        "bulletColor": "#FFFFFF",
							        "bulletSize": 5,
							        "hideBulletsCount": 50,
							        "lineThickness": 2,
							        "title": "red line",
							        "useLineColorForBulletBorder": true,
							        "valueField": "value",
							        "balloonText": "<div style='margin:5px; font-size:19px;'><span style='font-size:13px;'>[[category]]</span><br>[[value]]</div>"
							    }],
							    "chartScrollbar": {
							        "graph": "g1",
							        "oppositeAxis":false,
							        "offset":30,
							        "scrollbarHeight": 80,
							        "backgroundAlpha": 0,
							        "selectedBackgroundAlpha": 0.1,
							        "selectedBackgroundColor": "#888888",
							        "graphFillAlpha": 0,
							        "graphLineAlpha": 0.5,
							        "selectedGraphFillAlpha": 0,
							        "selectedGraphLineAlpha": 1,
							        "autoGridCount":true,
							        "color":"#AAAAAA"
							    },
							    "chartCursor": {
							        "pan": true,
							        "valueLineEnabled": true,
							        "valueLineBalloonEnabled": true,
							        "cursorAlpha":0,
							        "valueLineAlpha":0.2
							    },
							    "categoryField": "date",
							    "categoryAxis": {
							        "parseDates": true,
							        "dashLength": 1,
							        "minorGridEnabled": true
							    },
							    "export": {
							        "enabled": true
							    },
							    "dataProvider": [<%=TimeLine%>]
							});

							chart.addListener("rendered", zoomChart);

							zoomChart();

							function zoomChart() {
							    chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1);
							}
							</script>
								

							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
							

					</div>
				</div>
				
				
				<!-- /.row -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>

				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class='control-sidebar-menu'>
						<li><a href='javascript::;'> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href='javascript::;'> <i
								class="menu-icon fa fa-user bg-yellow"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>
									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href='javascript::;'> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>
									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href='javascript::;'> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>
									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class='control-sidebar-menu'>
						<li><a href='javascript::;'>
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href='javascript::;'>
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href='javascript::;'>
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span class="label label-waring pull-right">50%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href='javascript::;'>
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>
						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked />
							</label>
							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked />
							</label>
							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked />
							</label>
							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked />
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right" />
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript::;" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class='control-sidebar-bg'></div>
	</div>
	<!-- ./wrapper -->

	
    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- page script -->
<script type="text/javascript">
									$(function() {
										$("#example1").DataTable();
										$('#example2').DataTable({
											"paging" : true,
											"lengthChange" : false,
											"searching" : false,
											"ordering" : true,
											"info" : true,
											"autoWidth" : false
										});
									});
								</script>
</body>
</html>
