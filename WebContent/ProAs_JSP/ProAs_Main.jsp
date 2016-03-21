<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import ="Run.*"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="http://www.amcharts.com/lib/3/pie.js"></script>

<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ProAs_Process | Main</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<meta
   content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
   name='viewport'>
<!-- DATA TABLES -->
<link href="plugins/datatables/dataTables.bootstrap.css"
   rel="stylesheet" type="text/css" />
<!-- Bootstrap 3.3.4 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
   type="text/css" />
<!-- FontAwesome 4.3.0 -->
<link
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
   rel="stylesheet" type="text/css" />
<!-- Ionicons 2.0.0 -->
<link
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
   rel="stylesheet" type="text/css" />
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
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
<link href="plugins/datepicke
    r/datepicker3.css" rel="stylesheet"
   type="text/css" />
<!-- Daterange picker -->
<link href="plugins/daterangepicker/daterangepicker-bs3.css"
   rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
   rel="stylesheet" type="text/css" />

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
         <a href="ProAs_setNumOne.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
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
                     <%
                     ProAs p = (ProAs)session.getAttribute("ProAs");
                     
                     if(session.getAttribute("filename")!=null)
                     {
                        //System.out.println("first   :"+p.getsome());
                     }
                     %>

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
               
              <!--  <li><a href="ProAs_Sequence.jsp"><i class="fa fa-book"></i> <span>Log Replay</span></a></li> -->
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
               File name : <%=session.getAttribute("filename") %>
            </h1>
            <ol class="breadcrumb">
               <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            </ol>
         </section>

         <!-- Main content -->
         <section class="content">
            <!-- Info boxes -->
            <div class="row">
               <div class="col-lg-3 col-xs-6">
                  <!-- small box -->
                  <div class="small-box ">
                     <div class="inner">
                     <%if(p.getDataTypeNum()==1){ %>
                        <h3><%=p.getContantsSize() %></h3><%}else{ %>
                        <h3><%=p.getData().getCase().getFilterCaseList().size() %></h3><%} %>
                        <p>Contents</p>
                     </div>
                     <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                     </div>
                  </div>
               </div>
               <!-- ./col -->
               <div class="col-lg-3 col-xs-6">
                  <!-- small box -->
                  <div class="small-box ">
                     <div class="inner">
                     <%if(p.getDataTypeNum()==1){ %>
                        <h3><%=p.getCaseSize() %></h3><%}else{ %>
                        <h3><%=p.getData().getCase().getFilterHashCaseList().size() %></h3><%} %>
                        <p>Case</p>
                     </div>
                     <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                     </div>
                  </div>
               </div>
               <!-- ./col -->
               <div class="col-lg-3 col-xs-6">
                  <!-- small box -->
                  <div class="small-box ">
                     <div class="inner">
                     <%if(p.getDataTypeNum()==1){ %>
                        <h3><%=p.getActivitySize() %></h3><%}else{ %>
                        <h3><%=p.getData().getActivity().getFilterHashActivityList().size() %></h3><%} %>
                        <p>Activity</p>
                     </div>
                     <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                     </div>
                  </div>
               </div>
               <!-- ./col -->
               <div class="col-lg-3 col-xs-6">
                  <!-- small box -->
                  <div class="small-box ">
                     <div class="inner">
                     <%if(p.getDataTypeNum()==1){ %>
                        <h3><%=p.getResourceSize() %></h3><%}else{ %>
                        <h3><%=p.getData().getResource().getFilterHashResourceList().size() %></h3><%} %>
                        <p>Resource</p>
                     </div>
                     <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                     </div>
                  </div>
               </div>
               <!-- ./col -->
            </div>
            <!-- /.row -->

            <div class="row">
               <div class="col-md-12">
                  <div class="box">
                     <div class="box-header with-border">
                        <h3 class="box-title">Process Model</h3>
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
                     <%if(p.getPageNum()==1){ 
                                          System.out.println("pagenum:  "+p.getPageNum());%>
                     <div class="box-body">
                  <div class="row">
                    <div class="col-md-12">
                   
                      <script type="text/javascript">
                      	 function OpenWindow(url,intWidth,intHeight) { 
     						 window.open(url, "_blank", "width="+intWidth+",height="+intHeight+",resizable=1,scrollbars=1") ; 
							} 
                      	 </script>
                      	 <a href="javascript:OpenWindow('../indexForProA.jsp','1280','1200')">	
                      	 <img src="dist/img/process.jpg" width ="100%" height="700px" /></a>
                     
                    </div><!-- /.col -->
                  </div><!-- /.row -->
                </div><!-- ./box-body -->
               
                     <!-- /.box-footer -->
                                     <%}if(p.getPageNum()==2){
                   System.out.println("pagenum:  "+p.getPageNum());
                %>
                <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Filter Data Table</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                 <form  method=post>
                 <table class="table table-bordered text-center">
                    <thead>
                      <tr>
                        <th style="font-size:2em;"><p align="center">Case</p></th>
                        <th style="font-size:2em;"><p align="center">Activity</p></th>
                        <th style="font-size:2em;"><p align="center">Event</p></th>
                        <th style="font-size:2em;"><p align="center">Resource</p></th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                       <td style="background-color:black; font-color:white;"align="center">
                       <select name="cas" multiple style="background-color:black; font-color:white; 
                                size:100;height:250px;font-size:2em;border:none;align:center;"  >
                           <%for(int i =0; i<p.getData().getCase().getHashCaseList().size();i++){%>
                           <option value="<%=p.getData().getCase().getHashCaseList().get(i)%>">
                           Case: <%=p.getData().getCase().getHashCaseList().get(i) %>
                           &nbsp;&nbsp;&nbsp;</option>
                           <%} %>
                         </select></td>
                        <td style="background-color:black; font-color:white;"align="center">
                        <select name="act" multiple style="background-color:black; font-color:white; 
                                size:90;height:250px; font-size:2em;border:none;align:center;"  >
                        <%for(int i =0; i<p.getData().getActivity().getHashActivityList().size();i++){%>
                        <option value="<%=p.getData().getActivity().getHashActivityList().get(i)%>"><%=p.getData().getActivity().getHashActivityList().get(i) %>
                        &nbsp;&nbsp;&nbsp;</option>
                        <%} %>
                      </select></td>
                       <td style="background-color:black; font-color:white; "align="center">
                       <select name="eve" multiple style="background-color:black; font-color:white; 
                                size:100;height:100px; font-size:2em;border:none;align:center;"  >
                        <%for(int i =0; i<p.getData().getEvent().getHashEventList().size();i++){%>
                        <option value="<%=p.getData().getEvent().getHashEventList().get(i)%>"><%=p.getData().getEvent().getHashEventList().get(i) %>
                        &nbsp;&nbsp;&nbsp;</option>
                        <%} %>
                      </select></td>
                       <td style="background-color:black; font-color:white; "align="center">
                       <select name="res" multiple style="background-color:black; font-color:white;
                                size:100;height:250px; font-size:2em;border:none;align:center;"  >
                           <%for(int i =0; i<p.getData().getResource().getHashResourceList().size();i++){%>
                           <option value="<%=p.getData().getResource().getHashResourceList().get(i)%>"><%=p.getData().getResource().getHashResourceList().get(i) %>
                           &nbsp;&nbsp;&nbsp;</option>
                           <%} %>
                      </select></td>
                      </tr>
                      </tbody>
                  </table>
                  <button class="btn btn-block btn-default btn-sm" style="width:100px;" type=submit value="Filter"  onclick="form.action='ProAs_select.jsp';">
                  <h4><b>Submit</b></h4></button>
                  <%} %>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
                  </div>
                  <!-- /.box -->
               </div>
               <!-- /.col -->
            </div>
            <!-- /.row -->

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
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>

   </div>
   <!-- ./wrapper -->

   <!-- jQuery 2.1.4 -->
   <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
   <!-- Bootstrap 3.3.5 -->
   <script src="bootstrap/js/bootstrap.min.js"></script>
   <!-- FastClick -->
   <script src="plugins/fastclick/fastclick.min.js"></script>
   <!-- AdminLTE App -->
   <script src="dist/js/app.min.js"></script>
   <!-- Sparkline -->
   <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
   <!-- jvectormap -->
   <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
   <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
   <!-- SlimScroll 1.3.0 -->
   <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
   <!-- ChartJS 1.0.1 -->
   <script src="plugins/chartjs/Chart.min.js"></script>
   <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
   <script src="dist/js/pages/dashboard2.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="dist/js/demo.js"></script>
</body>
</html>