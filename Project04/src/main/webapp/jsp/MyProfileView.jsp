<%@page import="in.co.rays.proj4.controller.MyProfileCtl"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<body>

<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

        <%@ include file="Header.jsp"%>
        <script type="text/javascript" src="../js/calendar.js"></script>
        <jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean" scope="request"></jsp:useBean>

		<center>
          
             <%--  <%
			if (bean.getId() > 0) {
		%>
 --%>
		<h1 align="center">My Profile</h1>

		<%-- <%
			}

			else

			{
		%>
		<h1 align="center">Update MyProfile</h1>

		<%
			}
		%>
         --%>
        
            <H2>
                <font color="red"> <%=ServletUtility.getErrorMessage(request)%>
                </font>
            </H2>

            <H2>
                <font color="green"> <%=ServletUtility.getSuccessMessage(request)%>
                </font>
            </H2>

        
            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
            

            <table align="center" style="margin-left: 40%" >
            
                <tr>
                    <th align="left">Login Id <font color="red">*</font></th>
                    <td><input type="text" name="login" 
                    value="<%=DataUtility.getStringData(bean.getLogin())%>"readonly="readonly">
                    <font color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>

                <tr>
                    
                    <th align="left">First Name <font color="red">*</font></th>
                    <td><input type="text" name="firstName"
                        value="<%=DataUtility.getStringData(bean.getFirstName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Last Name<font color="red">*</font></th>
                    <td><input type="text" name="lastName"
                        value="<%=DataUtility.getStringData(bean.getLastName())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
                              
                <tr>
                    <th align="left">Gender<font color="red">*</font></th>
                    <td>
                         <%
                            HashMap map = new HashMap();
                         	map.put("", "--------------select-------------");
                         	map.put("Male", "Male");
                            map.put("Female", "Female");

                            String htmlList = HTMLUtility.getList("gender", bean.getGender(), map);
                        %> <%=htmlList%><font color="red"><%=ServletUtility.getErrorMessage("gender",
                    request)%></font>
                    
                    </td>
                    </tr>
                
				<tr>
                 <th align="left">Mobile Number <font color="red">*</font></th>
	              <td><input type="text" name="mobileNo" size="19" maxlength="10" placeholder="Mobile No"
	              value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
	              <font color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font>
                   </td>
                </tr>


                <tr>
                    
                    <th align="left">Date Of Birth (mm/dd/yyyy)<font color="red">*</font></th>
                    <td><input type="text"  name="dob" placeholder="yyyy/mm/dd" id="datepicker" readonly="readonly" 
                    value="<%=DataUtility.getDateString(bean.getDob())%>" >
                   <font color="red"><%=ServletUtility.getErrorMessage("dob", request)%></font></td>
               </tr>
                
                <%-- <tr>
                    <th></th>
                    <td colspan="2">
          <%
     	if (bean.getId() > 0)
     {
     		
 		%>
 		<input type="submit" name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD %>"> &nbsp;
        <input type="submit" name="operation" value="<%=MyProfileCtl.OP_UPDATE %>"> &nbsp;
 		<input type="submit" name="operation" value="<%=MyProfileCtl.OP_CANCEL%>">
    	 </td>
    	 <%
 		} 
     	else
     	
     	{
 		%>
                    
                    <input type="submit" name="operation" value="<%=MyProfileCtl.OP_SAVE%>"> 
                    <input type="submit" name="operation" value="<%=MyProfileCtl.OP_RESET%>">
                    </td>
                            
               <% 
    	 
     }
 %>&emsp;
               
               
               
               
               
                </tr>
            </table>
    </form>
    </center>
    
</body>
<%@ include file="Footer.jsp"%>
</html> --%>

<tr>
      <th></th>
      <td colspan="2"><input type="submit" name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>">&nbsp;
      <input type="submit" name="operation" value="<%=MyProfileCtl.OP_SAVE%>">&nbsp;</td>
	</tr>
	
 </table>
 
 </center>
 </form>
<%@include file="Footer.jsp" %>
</body>
</html>
