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
     ArrayList<String> FinalPatternActivityList = new ArrayList<String>();
     
     
     ArrayList<String> UpperHashActivity = new ArrayList<String>();
     ArrayList<String> Set2Activity = new ArrayList<String>();
     ArrayList<String> UpperSet2Activity = new ArrayList<String>();
     ArrayList<String> Set3Activity = new ArrayList<String>();
     ArrayList<String> UpperSet3Activity = new ArrayList<String>();
     ArrayList<String> Set4Activity = new ArrayList<String>();
     ArrayList<String> UpperSet4Activity = new ArrayList<String>();
     
     
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
     
     String tempcase = FinalCaseList.get(0);
     String temppattern ="";
     String temppattern2;
     ArrayList<String> tempAct = new ArrayList<String>();
     ArrayList<String> tempPattern = new ArrayList<String>();
     
      for(int i=0;i<FinalActivityList.size();i++){
    	  if(FinalCaseList.get(i).equals(tempcase)){
    		  temppattern += FinalActivityList.get(i);
        	  tempAct.add(FinalActivityList.get(i));         	 	
    	 }else{
		      if(tempAct.contains(temppattern)!=true){
		    	  for(String a:tempAct){
		    		  FinalPatternActivityList.add(a);
		    	  }
		      }
		      	for(int j=0;j<tempAct.size();j++){
    	 		tempAct.remove(j);
		      	}
    	 }    	   
      } 
     
      for(String k:FinalPatternActivityList){
    	  System.out.println(k);
      }
      System.out.println("l----");
     for(String k:FinalActivityList){
    	 System.out.println(k);
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
    <title>Sequence Analysis</title>
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
										<a href="ProAs_Start.jsp" class="btn btn-default btn-flat">Sign
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
                  <a href="ProAs_OriginalTable.jsp"><i class="fa fa-circle-o"></i> Original Data <i class="fa fa-angle-left pull-right"></i></a>
                  <a href="ProAs_OriginalTable.jsp"><i class="fa fa-circle-o"></i> LogReplay Data </a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="ProAs_OriginalTable.jsp"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
                </li>
                <li>
                  <a href="#"><i class="fa fa-circle-o"></i> Filter Data <i class="fa fa-angle-left pull-right"></i></a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="ProAs_FilterTable.jsp"><i class="fa fa-circle-o"></i> Data Table </a>
                    </li>
                  </ul>
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
				Sequence Analysis
            <small></small>
          </h1>
           File name : <%=session.getAttribute("filename") %>
          <ol class="breadcrumb">
            <li><a href="ProAs_Main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>ProAs_Analysis</li>
            <li class ="active"><a href="ProAs_Timeline.jsp">Log Replay</a></li>
         
          </ol>
        </section>

        <!-- Main content -->
      
     <section class="content">
            <!-- Info boxes -->
            
            <div class="row">
               <div class="col-md-12">
                  <div class="box">
                     <div class="box-header with-border">
                        <h3 class="box-title">Sequence Analysis</h3>
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
                              <li><a href="ProAs_setNumOne.jsp">Dashbord</a></li>
                              <li><a href="ProAs_setNumTwo.jsp">Filter</a></li>
                                 <li class="divider"></li>
                                 <li><a href="#">Separated link</a></li>
                              </ul>
                           </div>
                           <button class="btn btn-box-tool" data-widget="remove">
                              <i class="fa fa-times"></i>
                           </button>
                        </div>
                     </div>
                     <!-- /.box-header -->
                    
                     <div class="box-body">
                  <div class="row">
                    
                    
                    
                 	<form method="post" action ="ProAs_SequenceAnalysis.jsp">
                 	<font color ="black">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name = "minsup"/>
						<input type="submit" name ="Submit" value ="Submit" />
						
                    </font>
					</form> 
                    	
                      	<%
                      	String value = request.getParameter("minsup");
                      	
                      	if(value==null){
                      	
                      	String basecase = FinalCaseList.get(0);
                      	out.print("Case :"+basecase+" : ");
                      	
                      	for(int i=0;i<FinalActivityList.size();i++){
                      		if(FinalCaseList.get(i).equals(basecase)){
                      			out.print("    "+FinalActivityList.get(i)+" / ");
                      		}
                      		else{
                      			basecase = FinalCaseList.get(i);
                      			%><br><br><%
                      			out.print("    "+"Case :"+basecase+" : "+FinalActivityList.get(i));
                      		}
                      	}
                      	}
                      	// input 값 있을때 
                      	else{
                      		%>
                      		<div class="col-md-3">
                      		<center><font size="10">----------Set - 1----------</font></center><br>
                      		<%
                      		double minsup = Double.parseDouble(value);
                      		//double minsup = Math.round(Integer.parseInt(value)/(double)FinalActivityList.size()*1000);
                      		
                      		
                      		%><font size ="5" color="yellow">Minimum Support Percentage = <%=minsup %>%</font><br><br><%
                      		
                      		for(int j=0;j<FinalHashActivityList.size();j++){
                      			int qty = 0;
                      		for(int i=0;i<FinalActivityList.size();i++){
                      			if(FinalActivityList.get(i).equals(FinalHashActivityList.get(j))){
                      				qty++;
                      			}
                      		}
                      			
                      			double percent = qty/(double)FinalActivityList.size()*1000;
                      			//System.out.println(qty+" "+FinalActivityList.size()+" "+percent);
                      			if(qty>minsup){
                      			UpperHashActivity.add(FinalHashActivityList.get(j));
                      			out.print("{"+FinalHashActivityList.get(j)+"} / "+Math.round(percent)+"%");
                  				%><br><%
                      			}
                      		}
                      		
                      		%>
                      	 </div><!-- /.col -->	
                      	 <div class="col-md-3">	
                      	 <center><font size="10">----------Set - 2----------</font></center><br>
                      	 <br>
                      	 <%
                      	 
                      	 for(int i=0;i<UpperHashActivity.size();i++){
                      	
                      		 String set2 = null;
                      		 for(int j=0;j<FinalActivityList.size()-1;j++){
                      			if(UpperHashActivity.get(i).equals(FinalActivityList.get(j))){
                      				
                      				set2 = UpperHashActivity.get(i)+"-----"+FinalActivityList.get(j+1);
                      				
                      				if(Set2Activity.contains(set2)==false){
                      					
                      					Set2Activity.add(set2);
                      					
                      				}
                      				
                      			}
                      		}	 
                      	 }
                      	 
                      	
                      	 
                      	 for(int i=0;i<Set2Activity.size();i++){
                      		 int set2qty =0;
                      		 for(int j=0;j<FinalActivityList.size()-1;j++){
                      			 
                      			 if((FinalActivityList.get(j)+"-----"+FinalActivityList.get(j+1)).equals(Set2Activity.get(i))){
                      				 
                      				 set2qty++;
                      				 
                      			 }
                      			 
                      		 }
                   			double percent = set2qty/(double)FinalActivityList.size()*1000;

                      		 if(set2qty>minsup){
                      	     UpperSet2Activity.add(Set2Activity.get(i));
                      		 out.print("{"+Set2Activity.get(i)+"} / "+Math.round(percent)+"%");
                      		 %><br><br><%
                      		 }
                      	 }
                      	 
                      	 
                      	 %>
                      	 </div>	
                      	 
                      	 
                      	 <div class="col-md-3">	
                      	 <center><font size="10">----------Set - 3----------</font></center><br>
                      	  <%
                      	 
                      	 for(int i=0;i<UpperSet2Activity.size();i++){
                      	
                      		 String set3 = null;
                      		 for(int j=0;j<FinalActivityList.size()-2;j++){
                      			if(UpperSet2Activity.get(i).contains(FinalActivityList.get(j))){
                      				
                      				set3 = UpperSet2Activity.get(i)+"-----"+FinalActivityList.get(j+2);
                      				
                      				if(Set3Activity.contains(set3)==false){
                      					
                      					Set3Activity.add(set3);
                      					
                      				}
                      				
                      			}
                      		}	 
                      	 }
                      	 
                      	//for(String test:Set3Activity){
                      	//	out.println(test);
                      		%><br>
                      		<%
                      	//}
                      	 
                      	
                      	 for(int i=0;i<Set3Activity.size();i++){
                      		 int set3qty =0;
                      		 for(int j=0;j<FinalActivityList.size()-2;j++){
                      			 
                      			 if((FinalActivityList.get(j)+"-----"+FinalActivityList.get(j+1)+"-----"+FinalActivityList.get(j+2)).equals(Set3Activity.get(i))){
                      				 
                      				 set3qty++;
                      				 
                      			 }
                      			 
                      		 }
                   			double percent = set3qty/(double)FinalActivityList.size()*1000;

                      		 if(set3qty>minsup){
                      	     UpperSet3Activity.add(Set3Activity.get(i));
                      		 out.print("{"+Set3Activity.get(i)+"} / "+Math.round(percent)+"%");
                      		 %><br><br><%
                      		 }
                      	 }
                      	 
                      	
                      	 
                      	 %>
                      	
                      	 </div>	
                      	 
                      	 
                      	 <div class="col-md-3">	
                      	 <center><font size="10">----------Set - 4----------</font></center><br>
                      	   <%
                      	 
                      	 for(int i=0;i<UpperSet3Activity.size();i++){
                      	
                      		 String set4 = null;
                      		 for(int j=0;j<FinalActivityList.size()-3;j++){
                      			if(UpperSet3Activity.get(i).contains(FinalActivityList.get(j))){
                      				
                      				set4 = UpperSet3Activity.get(i)+"-----"+FinalActivityList.get(j+3);
                      				
                      				if(Set4Activity.contains(set4)==false){
                      					
                      					Set4Activity.add(set4);
                      					
                      				}
                      				
                      			}
                      		}	 
                      	 }
                      	 
                      	//for(String test:Set3Activity){
                      	//	out.println(test);
                      		%><br>
                      		<%
                      	//}
                      	 
                      	
                      	 for(int i=0;i<Set4Activity.size();i++){
                      		 int set4qty =0;
                      		 for(int j=0;j<FinalActivityList.size()-3;j++){
                      			 
                      			 if((FinalActivityList.get(j)+"-----"+FinalActivityList.get(j+1)+"-----"+FinalActivityList.get(j+2)+"-----"+FinalActivityList.get(j+3)).equals(Set4Activity.get(i))){
                      				 
                      				 set4qty++;
                      				 
                      			 }
                      			 
                      		 }
                   			double percent = set4qty/(double)FinalActivityList.size()*1000;

                      		 if(set4qty>minsup){
                      	     UpperSet4Activity.add(Set4Activity.get(i));
                      		 out.print("{"+Set4Activity.get(i)+"} / "+Math.round(percent)+"%");
                      		 %><br><br><%
                      		 }
                      	 }
                      	 
                      	
                      	 
                      	 %>
                      	 </div>
                      		<%
                      	}
                      	
                      	%>
                     
                     	
                   
                  </div><!-- /.row -->
                </div><!-- ./box-body -->
               
                     <!-- /.box-footer -->
                
                
                  </div>
                  <!-- /.box -->
               </div>
               <!-- /.col -->
            </div>
            <!-- /.row -->


				<div class="row">
               <div class="col-md-12">
                  <div class="box">
                     <div class="box-header with-border">
                        <h3 class="box-title">Sequence Result</h3>
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
                              <li><a href="ProAs_setNumOne.jsp">Dashbord</a></li>
                              <li><a href="ProAs_setNumTwo.jsp">Filter</a></li>
                                 <li class="divider"></li>
                                 <li><a href="#">Separated link</a></li>
                              </ul>
                           </div>
                           <button class="btn btn-box-tool" data-widget="remove">
                              <i class="fa fa-times"></i>
                           </button>
                        </div>
                     </div>
                     <!-- /.box-header -->
                    
                     <div class="box-body">
                  <div class="row">
                    <div class="col-md-12">
                    <font color="yellow" size ="5">Set 2</font><br>
                    <font size="5">
                    <%
                    for(String set2:UpperSet2Activity){
                    	out.print(set2);%><br><%
                    }
                    %>
                    </font>
                    <font color="yellow" size ="5">Set 3</font><br>
                    <font size="5">
                    <%
                    for(String set3:UpperSet3Activity){
                    	out.print(set3);%><br><%
                    }
                    %>
                    </font>
                    <font color="yellow" size ="5">Set 4</font><br>
                    <font size="5">
                    <%
                    for(String set4:UpperSet4Activity){
                    	out.print(set4);%><br><%
                    }
                    %>
                    </font>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
                    </div>
            <!-- Main row -->
            <div class="row">
               <!-- Left col -->
               <div class="col-md-8">
                  <!-- MAP & BOX PANE -->
                  <!-- /.box -->
                  <div class="row">
                  </div>
               </div>
            </div>
            <!-- /.row -->
         </section>
      
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
