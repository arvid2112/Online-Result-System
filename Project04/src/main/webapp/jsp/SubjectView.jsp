<%@page import="in.co.rays.proj4.controller.SubjectCtl" %>
<%@page import="in.co.rays.proj4.util.ServletUtility" %>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="in.co.rays.proj4.util.HTMLUtility" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<form action="<%=ORSView.SUBJECT_CTL%>" method="post">
	<%@include file="Header.jsp" %>
	
	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.SubjectBean" scope="request"></jsp:useBean>
	
	<%
            List l = (List) request.getAttribute("courseList");
        	System.out.println("courselist:"+l);
        %>

        <center>
          
              <%
			if (bean.getId() > 0) {
		%>

		<h1 align="center">Update Subject</h1>

		<%
			}

			else

			{
		%>
		<h1 align="center">Add Subject</h1>

		<%
			}
		%>
        
        <center>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>

            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>
	
		
	<input type="hidden" name="id" value="<%=bean.getId() %>">
	<input type="hidden" name="createdBy" value="<%=bean.getCreatedBy() %>">
	<input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy() %>">
	<input type="hidden" name="createdDateTime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime()) %>">
	<input type="hidden" name="modifiedDateTime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime()) %>">

		
	<table align="center" style="margin-left: 40%" >
 		<tr>
			<th align="left">Subject Name<font color="red">*</font></th>
			<td><input type="text" name="subjectName" size="41%" placeholder="Enter Subject" 
			value="<%=DataUtility.getStringData(bean.getSubjectName())%>"></td>
			<td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("subjectName", request)%></font></td>
 		</tr>
 
 		<tr>
   	    	<th align="left"><b>Course Name<font color="red">*</font></b></th>
	    	<td><%=HTMLUtility.getList("courseId", String.valueOf(bean.getCourseId()), l)%></td>
   			<a><td style="position: fixed;"> <font color="red"><%=ServletUtility.getErrorMessage("courseName",request) %></font>
   			</a>
   			</td>
   		</tr>
   
   		<tr>
   		   <th align="left">Description<font color="red">*</font></th>
		   <td><textarea name="description"  placeholder="Enter Description" style="width: 320px;height:50px; resize: none;">
		   <%=DataUtility.getStringData(bean.getDescription())%></textarea></td>
  		   <td style="position: fixed;"><font color="red"><%=ServletUtility.getErrorMessage("description",request) %></font></td>
   		</tr>
   
  			    
<tr>
       <th></th>
       <td colspan="2">
	
       
       <%
		if (bean.getId() > 0)
		{
		%>

       <input type="submit" name="operation" value="<%=SubjectCtl.OP_UPDATE%>">
    	<input type="submit" name="operation" value="<%=SubjectCtl.OP_CANCEL%>">
    	 
    	 <%
 		} 
     	else
     	
     	{
 		%>
						
                    <input type="submit" name="operation" value="<%=SubjectCtl.OP_SAVE%>">
                    <input type="submit" name="operation" value="<%=SubjectCtl.OP_RESET%>">
               </td>
               
               <% 
    	 
     }
 %>&emsp;
</tr>
    </table>
    </form>
    </center>
    <br><br>
    </body>
    <%@ include file="Footer.jsp"%>
</html>