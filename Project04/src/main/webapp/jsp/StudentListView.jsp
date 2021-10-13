<%@page import="in.co.rays.proj4.controller.StudentListCtl"%>
<%@page import="in.co.rays.proj4.model.CollegeModel"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
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



	<form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">
		<%@include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.rays.proj4.bean.StudentBean"
			scope="request"></jsp:useBean>
		<%
			List l = (List) request.getAttribute("collegeList");
			System.out.println("collegelist:" + l);
		%>



		<center>
			<h1>Student List</h1>

			<tr>
				<h2>
					<td colspan="8"><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></td>
				</h2>
			</tr>


			<tr>
				<h2>
					<td colspan="8"><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></td>
				</h2>
			</tr>

			<table width="100%">
				<tr>
					<td align="center"><label> FirstName :</label> <input
						type="text" name="firstName" placeholder="First Name"
						value="<%=DataUtility.getStringData(bean.getFirstName())%>">&emsp;

						<label>Email ID:</label> <input type="text" name="Email"
						placeholder="Email ID"
						value="<%=DataUtility.getStringData(bean.getEmail())%>">&emsp;

						<label>College Name:</label> <%=HTMLUtility.getSList("CollegeId", String.valueOf(bean.getCollegeId()), l)%>

						<input type="submit" name="operation"
						value="<%=StudentListCtl.OP_SEARCH %>"> <input
						type="submit" name="operation"
						value="<%=StudentListCtl.OP_RESET%>"></td>
				</tr>
			</table>
			<br>
			<%
				List list = ServletUtility.getList(request);
					if (list.size() == 0) {
					} 
					
					else {
			%>


			<table border="1" width="100%">
				<tr>
					<th align="center"><input type="checkbox" id="UNCHECK"
						onclick="checkAll(this)">Select</th>

					<th>S.No.</th>
					<!-- <th>ID.</th> -->
					<th>College Name.</th>
					<th>First Name.</th>
					<th>Last Name.</th>
					<th>Date Of Birth.</th>
					<th>Mobile No.</th>
					<th>Email ID.</th>
					<th>Edit</th>
				</tr>
				<%
					int pageNo = ServletUtility.getPageNo(request);

					int pageSize = ServletUtility.getPageSize(request);
					int nextPageSize =  DataUtility.getInt(DataUtility.getStringData(request.getAttribute("nextListSize")));

					int index = ((pageNo - 1) * pageSize) + 1;

							/*   List list = ServletUtility.getList(request); */

							Iterator<StudentBean> it = list.iterator();

							while (it.hasNext()) {
								bean = it.next();
								
				%>

				<tr>
					<td align="center"><input type="checkbox" name="ids" onclick="checkAl(this)"
						value="<%=bean.getId()%>"></td>

					<td align="center"><%=index++%></td>
					<td align="center"><%=bean.getCollegeName()%></td>
					<td align="center"><%=bean.getFirstName()%></td>
					<td align="center"><%=bean.getLastName()%></td>
					<td align="center"><%=bean.getDob()%></td>
					<td align="center"><%=bean.getMobileNo()%></td>
					<td align="center"><%=bean.getEmail()%></td>
					<td align="center"><a href="StudentCtl?id=<%=bean.getId()%>">Edit</a>


					</td>
				</tr>
				<% }
				 %>
			</table>
			<table width="80%">
				<tr>
					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" : ""%>></td>

					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEW%>"></td>

					<td><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						value="<%=StudentListCtl.OP_NEXT%>"
						<%=  (nextPageSize != 0) ? "" :   "disabled"%>></td>

				</tr>
			</table>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
			<%
		}
		 %>
		
	</form>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>