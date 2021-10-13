<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.controller.FacultyCtl"%>
<%@page import="in.co.rays.proj4.bean.FacultyBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.controller.FacultyListCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty List View</title>
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

<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="POST">
<%@include file="Header.jsp"%>

<jsp:useBean id="bean" class="in.co.rays.proj4.bean.FacultyBean"
			scope="request"></jsp:useBean>

	<center>

		<h1>Faculty List</h1>

		<center>
			<font color="red" size="5px"><%=ServletUtility.getErrorMessage(request)%></font>
		</center>
		<center>
			<font color="green" size="5px"><%=ServletUtility.getSuccessMessage(request)%></font>
		</center>
		

		<%
			List list1 = (List) request.getAttribute("collegeList");
			List list2 = (List) request.getAttribute("courseList");
		%>
		
			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				
				List list = ServletUtility.getList(request);
				Iterator<FacultyBean> it = list.iterator();
				if (list.size() != 0) {
			%>
		<table>
				<tr>
					<td><label>First Name</label>&emsp;
					<input type="text" name="firstName" size="20" placeholder="First Name"
					value="<%=ServletUtility.getParameter("firstName", request)%>">&emsp;
					
					<label>College Name</label>
					<%=HTMLUtility.getSList("collegeId", String.valueOf(bean.getCollegeId()), list1)%>&emsp;
						
					<label>Course Name</label>
					<%=HTMLUtility.getSList("courseId", String.valueOf(bean.getCourseId()), list2)%>&emsp;&emsp;
						
					<label>Email_Id</label>&emsp;
					<input type="text" size="20" name="emailId" placeholder="Enter EmailId"
					value="<%=ServletUtility.getParameter("emailId", request)%>">&emsp;<br><br>
					<center>
					<input type="submit" name="operation" value="<%=FacultyListCtl.OP_SEARCH%>">
					<input type="submit" name="operation" value="<%=FacultyListCtl.OP_RESET%>">
					</center>
					</td>
				</tr>

			</table>
			<table border="1px" width="100%">
				<tr>
					<th align="center"><input type="checkbox" id="UNCHECK"
						onclick="checkAll(this)">Select</th>
					<th>S.NO</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Qualification</th>
					<th>Email Id</th>
					<th>Joining Date</th>
					<th>College Name</th>
					<th>Course Name</th>
					<th>Subject Name</th>
					<th>Edit</th>
				</tr>

				<%
					while (it.hasNext()) {
							bean = it.next();
				%>
				<tr>
					<td align="center"><input type="checkbox" name="ids" onclick="checkAl(this)"
						value="<%=bean.getId()%>"></td>
						
					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getFirstName()%></td>
					<td align="center"><%=bean.getLastName()%></td>
					<td align="center"><%=bean.getQualification()%></td>
					<td align="center"><%=bean.getEmailId()%></td>
					<%
						SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
								String date = formatter.format(bean.getJoiningDate());
					%>
					<td align="center"><%=date%></td> 
					<td align="center"><%=bean.getCollegeName()%></td>
					<td align="center"><%=bean.getCourseName()%></td>
					<td align="center"><%=bean.getSubjectName()%></td>
					<td align="center"><a href="FacultyCtl?id=<%=bean.getId()%>">Edit</a></td>


				</tr>
				<%
					}
				%>
			</table>
			<table width="80%">
				<tr>
					<td><input type="submit" name="operation" value="<%=FacultyCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" :"" %>></td>
					<td><input type="submit" name="operation" value="<%=FacultyCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation" value="<%=FacultyCtl.OP_DELETE%>"></td>
					<td align="right"><input type="submit" name="operation" value="<%=FacultyCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>

			</table>
			<%
				}
				if (list.size() == 0) {
			%>

			<input type="submit" name="operation" value="<%=FacultyCtl.OP_BACK%>">
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> 
			<input type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>
	</center>
	<br><br>	
	

</body>
<%@include file="Footer.jsp"%>
</html>