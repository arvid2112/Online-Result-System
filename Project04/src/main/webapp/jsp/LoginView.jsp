<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<form action="<%=ORSView.LOGIN_CTL%>" method="post">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean" scope="request"></jsp:useBean>

        <center>
        <div style="height:70px!important">
            <h1>Login</h1>

            <H2>
                <font color="red"> <%=DataUtility.getStringData(request.getAttribute("message"))%>
                </font>
            </H2>
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
                
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
                <br>
            </H2>
             </div>
              
              <input type="hidden" name="id" value="<%=bean.getId()%>">
              <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
              <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
              <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
              <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
              
 <%
				String path = (String)request.getAttribute("repath");
			%>
			<input type="hidden"
				value=<%=((path != null) ? path : "")%> name="repath">
          
          	 <table align="center" style="margin-left: 40%">
               
                <tr>
                    <th align="left">LoginId<font color="red">*</font></th>
                    <td><input type="text" name="login" placeholder="Enter LoginId" size=30 value="<%=DataUtility.getStringData(bean.getLogin())%>">
                    <font color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
               
                <tr>
                    <th align="left">Password<font color="red">*</font></th>
                    <td><input type="password" name="password" placeholder="Enter Password" size=30 value="<%=DataUtility.getStringData(bean.getPassword())%>">
                    <font color="red"> <%=ServletUtility.getErrorMessage("password", request)%></font></td>
                </tr>
               
                <tr>
                    <th></th>
                    <td colspan="2">
                     <input type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_IN %>"> &nbsp;
                     <input type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_UP %>" > &nbsp;</td>
               
               
                </tr>
               
                <tr><th></th>
                	<td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>"><b>Forget my password</b></a></td> &nbsp;
            	</tr>
            </table>
    </form>
    </center>
    <%@ include file="Footer.jsp"%>
	



</body>
</html>