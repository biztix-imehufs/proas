<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import ="java.io.File"%>
<%@ page import ="Run.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<form method="post" class="sidebar-form">
					<div class="input-group">
						<span> <input type="file" name="file" class="btn btn-flat"
							placeholder="Search..." />
							<button type='submit' name='search' value="submit"
								class="btn btn-flat" onclick="form.action='ProAs_setProAsSession.jsp';" />
								 <i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
</body>
</html>