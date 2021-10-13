<%@page import="in.co.rays.proj4.controller.CourseListCtl" %>
<%@page import="in.co.rays.proj4.util.ServletUtility" %>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="in.co.rays.proj4.util.HTMLUtility" %>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.bean.SubjectBean"%>
<%@page import="in.co.rays.proj4.bean.CourseBean" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CourseList View</title>
</head>
<body>
<script type="text/javascript">
		function checkAll(bx) {

			var form = bx.form;
			var isChecked = bx.checked;
			for (var i = 0; i < form.length; i++) {

				if (form[i].type == 'checkbox') {

					form[i].checked = isChecked;

				}

			}

		}

		function checkAl(bx) {

			document.getElementById("UNCHECK").checked = false;

		}
	</script>


<form action="<%=ORSView.COURSE_LIST_CTL%>"method="POST" >
<%@include file="Header.jsp" %>

<jsp:useBean id="bean" class="in.co.rays.proj4.bean.CourseBean"
		scope="request"></jsp:useBean>

			<%
				List l = (List) request.getAttribute("courseList");
				System.out.println("courselist:" + l);
			%>



	<center>
			<h1>Course List</h1>
	
	<tr>
		<h2>
			<td colspan="8"><font color="red" size="5px"><%=ServletUtility.getErrorMessage(request)%></font></td>
			</h2>
		</tr>
		<tr>
		<h2>
			<td colspan="8"><font color="green" size="5px"><%=ServletUtility.getSuccessMessage(request)%></font></td>
			</h2>
		</tr>

<table width="100%">
				<tr>
					<td align="center">
										
						
	<label>Course Name</label>&emsp;
	<%-- <input type="text" name="courseName" placeholder="Enter Course Name"
					value="<%=DataUtility.getStringData(bean.getCourseName())%>">&emsp; --%>
	
	<%=HTMLUtility.getSList("courseId", String.valueOf(bean.getId()), l)%>
	
	<label>Duration</label>&emsp;
						<%
							HashMap map = new HashMap();
							map.put("","------select------");
							map.put("1year","1year");
							map.put("2year","2year");
							map.put("3year","3year");
							map.put("4year","4year");
							map.put("5year","5year");
							
					String HtmlList = HTMLUtility.getList("duration", bean.getDuration(), map);
					%><%=HtmlList%>&emsp;
					
					
			<input type="submit" name="operation" value="<%=CourseListCtl.OP_SEARCH%>">&emsp;
			<input type="submit" name="operation" value="<%=CourseListCtl.OP_RESET%>"></td>
				</tr>
		</table>

<%
				List list = ServletUtility.getList(request);
					if (list.size() == 0) {
					
			
					} 
					
					else {
			%>
				<table border="1px" width="100%">
				<tr>
					<th align="center"><input type="checkbox" id="UNCHECK"
						onclick="checkAll(this)">Select</th>
					<th>S.No</th>
					<th>Course Name</th>
					<th>Duration</th>
					<th>Description</th>
					<th>Edit</th>
				</tr>
											

	<%
		int pageNo = ServletUtility.getPageNo(request);
		int pageSize = ServletUtility.getPageSize(request);
		int nextPageSize =  DataUtility.getInt(DataUtility.getStringData(request.getAttribute("nextListSize")));
		int index = ((pageNo - 1) * pageSize) + 1;
		
		Iterator<CourseBean> it = list.iterator();
		while (it.hasNext()) {
		bean = it.next();
		
				
		
	%>
	<tr>
	<td align="center"><input type="checkbox" name="ids" onclick="checkAl(this)"
						value="<%=bean.getId()%>"></td>

					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getCourseName()%></td>
					<td align="center"><%=bean.getDuration()%></td>
					<td align="center"><%=bean.getDescription()%></td>
					<td align="center"><a href="CourseCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>
				
				<%
					}
				%>
				</table>
		
				<table width="80%">
				<tr>
					<td><input type="submit" name="operation" value="<%=CourseListCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" :"" %>></td>
					<td><input type="submit" name="operation" value="<%=CourseListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation" value="<%=CourseListCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation" value="<%=CourseListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>

		</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> 
			<input type="hidden" name="pageSize" value="<%=pageSize%>">
<%
					}
%>
					
			
		</form>
		
	</center>
</body>
<%@include file="Footer.jsp"%>
</html>