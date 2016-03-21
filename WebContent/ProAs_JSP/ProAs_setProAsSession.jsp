<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.io.File"%>
	<%@ page import ="Run.*"%>
<%
	String path =request.getParameter("file");
	if(path!=null){
	ProAs p = new ProAs(path);
	p.setPageNumOne();
	p.setDataTypOrign();
	session.setAttribute("filename",path);
	session.setAttribute("ProAs", p);
	}
%>
    <script>location.href = "ProAs_Main.jsp"; </script>