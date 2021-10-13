<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.controller.MarksheetCtl" %>
<%@page import="in.co.rays.proj4.util.HTMLUtility" %>
<%@page import="in.co.rays.proj4.util.ServletUtility" %>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Marksheet View</title>


</head>
<body>
   <%@include file="Header.jsp" %>
   <form action="<%=ORSView.MARKSHEET_CTL%>" method="post">
   
   <jsp:useBean id="bean" class="in.co.rays.proj4.bean.MarksheetBean" scope="request"></jsp:useBean>
   
   <%
   List l=(List)request.getAttribute("studentList");
   %>
   
   <center>
      
   <input type="hidden" name="id" value="<%=bean.getId()%>">
   <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy() %>">
   <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy() %>">
   <input type="hidden" name="createdDateTime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
   <input type="hidden" name="modifiedDateTime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime()) %>">
   
  		    <%
				if (bean.getId() > 0) {
			%>

			<h1>Update Marksheet</h1>
			<%
				} else {
			%>

			<h1>Add Marksheet</h1>
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
        <th align="left" class="p1">RollNo<span style="color:red">*</span></th>
        <td><input type="text" name="rollNo" size="40px"  class="p2" maxlength="6" placeholder="Enter RollNo" 
        value="<%=DataUtility.getStringData(bean.getRollNo()) %>"<%=(bean.getId()>0)?"readonly" : "" %>></td>
        <td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("rollNo", request) %></font></td> 
     </tr>
     <tr>
       <th align="left" class="p1">Name<span style="color:red">*</span></th>
       <td><%=HTMLUtility.getList("studentId",String.valueOf(bean.getStudentId()),l) %></td>
       <td style="position: fixed;"><font color="red"> <%=ServletUtility.getErrorMessage("studentId", request)%></font></td>
       </tr>
        
       <tr>
         <th align="left" class="p1">Physics<span style="color:red">*</span></th>
         <td><input type="text" name="physics" size="40px"  class="p2" placeholder="Enter Marks" 
         value="<%=DataUtility.getStringData(bean.getPhysics()).equals("0") ? ""
					: DataUtility.getStringData(bean.getPhysics())%>"></td>
         <td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("physics", request) %></font>
         </td></tr>
         <tr>
         <th align="left" class="p1">Chemistry<span style="color:red">*</span></th>
         <td><input type="text" name="chemistry" size="40px"  class="p2" placeholder="Enter Marks" 
         value="<%=DataUtility.getStringData(bean.getChemistry()).equals("0") ? ""
					: DataUtility.getStringData(bean.getChemistry())%>"></td>
         <td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("chemistry", request) %></font>
         </td></tr>
         <tr>
         <th align="left" class="p1">Maths<span style="color:red">*</span></th>
         <td><input type="text" name="maths" size="40px"  class="p2" placeholder="Enter Marks" 
         value="<%=DataUtility.getStringData(bean.getMaths()).equals("0") ? ""
					: DataUtility.getStringData(bean.getMaths())%>"></td>
         <td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("maths", request) %></font>
         </td></tr>
         <%
					if (bean.getId() > 0) {
		 %>
         
         <tr>
       <th></th>
       <td colspan="2" align="center">
       <input type="submit" name="operation" value="<%=MarksheetCtl.OP_UPDATE%>">
						&emsp;
                        &emsp; 
       <input type="submit" name="operation" value="<%=MarksheetCtl.OP_CANCEL%>"></td>
       </tr>
       
       <%
       }else{
       %>
       <tr><td colspan="2" align="center">
       <input type="submit" name="operation" value="<%=MarksheetCtl.OP_SAVE%>">&emsp;&emsp;
       <input type="submit" name="operation" value="<%=MarksheetCtl.OP_RESET%>">
       </td>
       </tr>
				<%
					}
				%>


			</table>

   </center>
   
   </form>
	<%@include file="Footer.jsp" %>
</body>
</html>                                                                                                                                                                                          