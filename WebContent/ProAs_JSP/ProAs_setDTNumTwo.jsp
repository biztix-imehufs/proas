<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import ="Run.*"%>
<%
	ProAs p = (ProAs)session.getAttribute("ProAs");
	if(p.getDataTypeNum()==1){
		p.setDataTypFilter();
				String referer = request.getHeader("referer");
		System.out.println(referer);
		StringBuffer buffer = new StringBuffer();
		buffer.append("'").append(referer).append("'");
		%> 
	 	      <script>
    var resite = <%=buffer%>
    location.href = resite; </script>
	<%} else{
		p.setPageNumTWo();%>
		<script>location.href = history.back(); </script>
		<%}%>