<%@page import="in.co.rays.proj4.controller.CourseCtl"  %>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility" %>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<form action="<%=ORSView.COURSE_CTL%>" method="POST">
<%@include file="Header.jsp" %>
	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.CourseBean" scope="request"></jsp:useBean>
	
	<center>
	
		<%
				if (bean.getId() > 0) {
			%>
			<h1 align="center">Update Course</h1>
			<%
				} else {
			%>
			<h1 align="center">Add Course</h1>
			<%
				}
			%>	
	<h2>
	<font color="green"><%=ServletUtility.getSuccessMessage(request) %></font>
	
	</h2>
	<h2>
	<font color="red"><%=ServletUtility.getErrorMessage(request) %></font>
	</h2>
	
		
	<input type="hidden" name="id" value="<%=bean.getId() %>">
	<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy() %>">
	<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy() %>">
	<input type="hidden" name="createdDateTime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime()) %>">
	<input type="hidden" name="modifiedDateTime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime()) %>">
	
	<table align="center" style="margin-left: 40%">
	<tr>
	    <th align="left">Course Name<font color="red">*</font></th>
	    <td><input type="text" name="courseName" size="40" placeholder="Enter course "
		value="<%=DataUtility.getStringData(bean.getCourseName())%>">
		<font color="red"> <%=ServletUtility.getErrorMessage("courseName", request)%></font>
		</td>
	</tr>
	
	<tr>
		<th align="left">Description<font color="red">*</font></th>
		<td><textarea name="description" placeholder="Enter Description" style="width: 320px;height:50px; resize: none;"><%=DataUtility.getStringData(bean.getDescription())%></textarea></td>
		<!-- <td style="position: fixed;"> -->
		<font color="red"> <%=ServletUtility.getErrorMessage("description", request)%></font>
		</td>
	</tr>
		
	<tr>
		<th align="left">Duration<font color="red">*</font></th>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("1Year", "1Year");
							map.put("2Year", "2Year");
							map.put("3Year", "3Year");
							map.put("4Year", "4Year");
							map.put("5Year", "5Year");
							
							String HtmlList = HTMLUtility.getList("duration", bean.getDuration(), map);
						%> <%=HtmlList%></td>
					<font color="red"> <%=ServletUtility.getErrorMessage("duration", request)%></font>
					</td>
	</tr>
				
				
				<tr>
					<th></th>
					<td colspan="2">
					
					<%
						if (bean.getId() > 0) {
					%>
					
					
					<input type="submit" name="operation" value="<%=CourseCtl.OP_UPDATE%>" style="padding: 5px;">&emsp; 
					<input type="submit" name="operation" value="<%=CourseCtl.OP_CANCEL%>" style="padding: 5px;">
				
				<%
					}
					else {
				%>
				
					<input type="submit" name="operation" value="<%=CourseCtl.OP_SAVE%>">&emsp;
					<input type="submit" name="operation" value="<%=CourseCtl.OP_RESET%>"></td>
				
				<%
					}
				%>
				</tr>
				</table>
				</form>
				</center>
					
</body>
<%@include file="Footer.jsp"%>
</html>