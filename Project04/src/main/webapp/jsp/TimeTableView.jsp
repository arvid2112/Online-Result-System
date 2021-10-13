<%@page import="in.co.rays.proj4.controller.TimeTableCtl"%>
<%@page import="in.co.rays.proj4.controller.SubjectCtl"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Time Table View</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
	
	$(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1970:2030',
			dateFormat : 'dd/mm/yy',
			endDate : '-18y',
		});
	});
	
</script>



</head>
<body>
	<form action="<%=ORSView.TIMETABLE_CTL%>" method="POST">
		<%@ include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.rays.proj4.bean.TimeTableBean"
			scope="request"></jsp:useBean>
		<center>

		<input type="hidden" name="id" value="<%=bean.getId()%>"> 
		<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
		<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
	    <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
		<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
			<%
				List l = (List) request.getAttribute("courseList");
				List li = (List) request.getAttribute("subjectList");
			%>


			<%
				if (bean.getId() > 0) {
			%>
			<h1>Update TimeTable</h1>
			<%
				} else {
			%>
			<h1>Add TimeTable</h1>
			<%
				}
			%>
			<h2>
				<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
			</h2>
			<h2>
				<font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
			</h2>
			<table>
				<tr>
					<th align="left" class="p1">Course<span style="color: red;">*</span></th>
					<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), l)%>

					</td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("courseId", request)%></font></td>


				</tr>
				<tr>
					<th align="left" class="p1">Subject<span style="color: red;">*</span></th>
					<td><%=HTMLUtility.getList("subjectId", String.valueOf(bean.getSubId()), li)%>

					</td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("subjectId", request)%></font></td>


				</tr>
				<tr>
					<th align="left" class="p1">Semester<span style="color: red;">*</span></th>
					<td>
						<%
							HashMap map = new HashMap();
							map.put("", "----------select----------");
							map.put("1", "1");
							map.put("2", "2");
							map.put("3", "3");
							map.put("4", "4");
							map.put("5", "5");
							map.put("6", "6");
							map.put("7", "7");
							map.put("8", "8");
							map.put("9", "9");
							map.put("10", "10");
							String htmlList = HTMLUtility.getList("semesterId", bean.getSemester(), map);
						%><%=htmlList%>

					</td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("semesterId", request)%></font></td>

				</tr>
				<tr>
					<th align="left" class="p1">Exam Date<span style="color: red;">*</span></th>
					<td><input type="text" name="examDate" id="datepicker" size="40" class="p2"
						 readonly="readonly" placeholder="Enter Exam Date"
						value="<%=DataUtility.getDateString(bean.getExamDate())%>">
					</td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("examDate", request)%></font></td>

				</tr>
				<tr>
					<th align="left" class="p1">Exam Time<span style="color: red;">*</span></th>
					<td>
						<%
							HashMap map1 = new HashMap();
							map1.put("08:00 AM to 11:00 AM", "08:00 AM to 11:00 AM");
							map1.put("12:00PM to 3:00PM", "12:00PM to 3:00PM");
							map1.put("3:00PM to 6:00PM", "3:00PM to 6:00PM");
							String examList = HTMLUtility.getList("examId", bean.getExamTime(), map1);
						%>
						<%=examList%>

					</td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("examId", request)%></font></td>
				</tr>
				</tr>
				<tr>
					<th align="left" class="p1">Description<span
						style="color: red;">*</span></th>
					<td><textarea name="description" placeholder="Enter Description" style="width: 320px;height:50px; resize: none;"><%=DataUtility.getStringData(bean.getDescription())%></textarea></td>
					<td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("description", request)%></font>

					</td>
				</tr>
				<%
					if (bean.getId() > 0) {
				%>

				<tr>
					<th></th>
					<td colspan="2" align="center">
					<input type="submit" name="operation" style="padding: 5px;"
						value="<%=TimeTableCtl.OP_UPDATE%>">&emsp;
						
						 <input	style="padding: 5px;" type="submit" name="operation"
						value="<%=TimeTableCtl.OP_CANCEL%>"></td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<th></th>
					<td colspan="2" align="center"><input type="submit"
						name="operation" style="padding: 5px;"
						value="<%=TimeTableCtl.OP_SAVE%>">&emsp; <input
						type="submit" name="operation" value="<%=TimeTableCtl.OP_RESET%>"
						style="padding: 5px;"></td>
				</tr>



				<%
					}
				%>

			</table>



		</center>
	</form>
</body>
<%@ include file="Footer.jsp"%>
</html>

