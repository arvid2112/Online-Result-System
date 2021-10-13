<%@page import="in.co.rays.proj4.controller.CollegeCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<html>
<body>
    <form action="<%=ORSView.COLLEGE_CTL%>" method="POST">
        <%@ include file="Header.jsp"%>

        <jsp:useBean id="bean" class="in.co.rays.proj4.bean.CollegeBean"
            scope="request"></jsp:useBean>
                 
            
            <center>
          
              <%
			if (bean.getId() > 0) {
		%>

		<h1 align="center">Update College</h1>

		<%
			}

			else

			{
		%>
		<h1 align="center">Add College</h1>

		<%
			}
		%>
        
        
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
                    
                    <th align="left">Name<font color="red">*</font></th>
                    <td>
                    <input type="text" name="name" size="19" placeholder="Name" 
                    value="<%=DataUtility.getStringData(bean.getName())%>"><font
                    color="red"> <%=ServletUtility.getErrorMessage("name", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">Address<font color="red">*</font></th>
                    <td>
                    <input type="text" name="address" size="19" placeholder="Address"
                     value="<%=DataUtility.getStringData(bean.getAddress())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("address", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">State<font color="red">*</font></th>
                    <td>
                    <input type="text" name="state" size="19" placeholder="State"
                        value="<%=DataUtility.getStringData(bean.getState())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("state", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">City<font color="red">*</font></th>
                    <td>
                    <input type="text" name="city" size="19" placeholder="City" 
                        value="<%=DataUtility.getStringData(bean.getCity())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("city", request)%></font></td>
                </tr>
                <tr>
                    <th align="left">PhoneNo<font color="red">*</font></th>
                    <td>
                    <input type="text" name="phoneNo" size="19" maxlength="10" placeholder="Phone Number"
                        value="<%=DataUtility.getStringData(bean.getPhoneNo())%>"><font
                        color="red"> <%=ServletUtility.getErrorMessage("phoneNo", request)%></font></td>
                </tr>

                <tr>
                    <th></th>
                    <td colspan="2">
                    
         <%
     	if (bean.getId() > 0)
     {
 		%>
 		<input type="submit" name="operation" value="<%=CollegeCtl.OP_UPDATE%>">
    	<input type="submit" name="operation" value="<%=CollegeCtl.OP_CANCEL%>">
    	 <%
 		} 
     	else
     	{
 		%>
                    <input type="submit" name="operation" value="<%=CollegeCtl.OP_SAVE%>"> 
                    <input type="submit" name="operation" value="<%=CollegeCtl.OP_RESET%>"></td>

               <% 
     }
 %>&emsp;

                </tr>
            </table>
    </form>
    </center>
    <br><br>
    <%@ include file="Footer.jsp"%>
</body>
</html>