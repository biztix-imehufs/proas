<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
<style>
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);


.header div span{
	color: #5379fa !important;
}

.header{
	position: absolute;
	top: calc(50% - 195px);
	left: calc(50% - 300px);
	z-index: 2;
}

.header div{
	float: left;
	color: red;
	font-family: 'Exo', sans-serif;
	font-size: 100px;
	font-weight: 200;
}

.header div span{
	color: #ffffff !important;
}
.header div mini{
	position: absolute;
	top: calc(50% - 195px);
	left: calc(50% - 195px);
	z-index: 2;
}
.user-panell>.image>img {
	width: 150x;
	max-width: 150px;
	height: 150x
}
.copyright{
  padding: 115px 0px 0px 0px;
  text-align: center;

}
.copyright p{
  font-size: 25px;
  font-weight: 400;
  color: #fff;
}
.copyright p a{
  color: #BA0303;
}
.copyright p a:hover{
  color: #fff;
  transition: 0.5s all;
  -webkit-transition: 0.5s all;
  -moz-transition: 0.5s all;
  -o-transition: 0.5s all;
}
</style> 
</head>
<body style="background-image: url('dist/img/backg.jpg');
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;"><!-- 뒷 배경 자리 

<body style="background-color: black; "> // 칼라
<body style="background-image: url('background.jpg')">; // 이미지 

  -->
<div class="header">
			<div><strong>ProA</strong><span> System
				
						<img src="dist/img/IamE.jpg" width="100px", height="100px"  />
				
				
				</span></div><br>
			<br><br><br><br><br><br><br><br>
<center>
			<ul>
			
			
				<form method="post">		
						<span>
						<font color="red">
						<input style = "background-image: url('dist/img/backgg.JPG'); border :0px" type="file" name="file" class="btn btn-flat" />	
						</font><br>
						
						<font color="white" size=20px>
						<input style = "background-color: black; border :0px" size ="4" type="submit" name="submit" value ="submit" onclick ="form.action='ProAs_setProAsSession.jsp';">
						</font>
						
						</span>
						
				</form><br>
			
			</ul>
			
		</center>	
			
			<center>
			<ul class="copyright" >
				<p>한국외국어대학교 산업경영공학과 </p>
			</ul>
			</center>
		</div>
	<br>
	



</body>
</html>