<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.bean.SubjectBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.controller.SubjectListCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subject List View</title>
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

		<form action="<%=ORSView.SUBJECT_LIST_CTL%>" method="post">
		<%@include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.rays.proj4.bean.SubjectBean"
		scope="request"></jsp:useBean>
		
			<%
				List l = (List) request.getAttribute("courseList");
				System.out.println("courselist:" + l);
			%>
			
			<center>
		<h1>Subject List</h1>
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
					<label> Subject Name </label>&emsp;
					<input type="text" name="subjectName" placeholder="Enter Subject Name"
					value="<%=DataUtility.getStringData(bean.getSubjectName())%>">&emsp;
						
						
	<label>Course Name</label>
	<%=HTMLUtility.getSList("courseId", String.valueOf(bean.getCourseId()), l)%>
						 

				   <input type="submit" name="operation" value="<%=SubjectListCtl.OP_SEARCH%>">&emsp;
				   <input type="submit" name="operation" value="<%=SubjectListCtl.OP_RESET%>"></td>
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
					<th>SubjectName</th>
					<th>CourseName</th>
					<th>Description</th>
					<th>Edit</th>
				</tr>



				<%
				
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int nextPageSize =  DataUtility.getInt(DataUtility.getStringData(request.getAttribute("nextListSize")));
				int index = ((pageNo - 1) * pageSize) + 1;
				
				
				 Iterator<SubjectBean> it = list.iterator();
					while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>
				<td align="center"><input type="checkbox" name="ids" onclick="checkAl(this)"
						value="<%=bean.getId()%>"></td>
					
					<td align="center"><%=index++%></td>
					
					<td align="center"><%=bean.getSubjectName()%></td>
					
					<td align="center"><%=bean.getCourseName()%></td>
					
					<td align="center"><%=bean.getDescription()%></td>
					
					<td align="center"><a href="SubjectCtl?id=<%=bean.getId()%>">Edit</a></td>
				</tr>
				<%
					}
				%>
				</table>
			<table width="80%">
				<tr>
					<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" :"" %>></td>
					<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation" value="<%=SubjectListCtl.OP_DELETE%>"></td>
					<td align="right">
					<input type="submit" name="operation" value="<%=SubjectListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				
				</tr>
			</table>
			<%-- <%
				}
				if (list.size() == 0) {
			%>
			<table>
				<input type="submit" name="operation" value="<%=SubjectListCtl.OP_BACK%>">
			
			<% 
				}
			%> --%>
			
			
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> 
			<input type="hidden" name="pageSize" value="<%=pageSize%>">

			<%
			}
			%>
		</form>	
	    	</center>
	
<br>

			

</body>
<%@include file="Footer.jsp"%>
</html>