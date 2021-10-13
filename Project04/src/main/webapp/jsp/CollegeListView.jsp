<%@page import="in.co.rays.proj4.controller.CollegeListCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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

    
    

        <form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="POST">
		<%@include file="Header.jsp"%>
		<jsp:useBean id="bean" class="in.co.rays.proj4.bean.CollegeBean"
			scope="request"></jsp:useBean>
			
			<center>
        <h1>College List</h1>
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
                    <td align="center"><b>
                    <label> Name:</b></label>
                    <input type="text" name="name" placeholder="Name" 
                   value="<%=DataUtility.getStringData(bean.getName())%>">&emsp; 
                    
                    <label><b>City:</b></label> 
                    <input type="text" name="city" placeholder="City"
                    value="<%=DataUtility.getStringData(bean.getCity())%>">&emsp;
                    
                    <input type="submit" name="operation" value="<%=CollegeListCtl.OP_SEARCH%>">
                    <input type="submit" name="operation" value="<%=CollegeListCtl.OP_RESET%>">
                    </td>
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
                    <th>Name.</th>
                    <th>Address.</th>
                    <th>State.</th>
                    <th>City.</th>
                    <th>PhoneNo.</th>
                    <th>Edit</th>
                </tr>
                <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int nextPageSize =  DataUtility.getInt(DataUtility.getStringData(request.getAttribute("nextListSize")));
                    int index = ((pageNo - 1) * pageSize) + 1;


                    Iterator<CollegeBean> it = list.iterator();

                    while (it.hasNext()) {
                         bean = it.next();
                %>
                <tr>
                	<td align="center"><input type="checkbox" name="ids" onclick="checkAl(this)"
						value="<%=bean.getId()%>"></td>
                
                    <td align="center"><%=index++%></td>
                   <%--  <td align="center"><%=bean.getId()%></td> --%>
                    <td align="center"><%=bean.getName()%></td>
                    <td align="center"><%=bean.getAddress()%></td>
                    <td align="center"><%=bean.getState()%></td>
                    <td align="center"><%=bean.getCity()%></td>
                    <td align="center"><%=bean.getPhoneNo()%></td>
                    <td align="center">
                   <%--  <%
							if (bean.getName() != null) {
						%> --%> <a href="CollegeCtl?id=<%=bean.getId()%>">Edit</a>
						
				<%--  <%
				 	} else {
				 %>
						---
				
				<%
					}
					
				%> --%>
                </td>
                </tr>
				<%
				}
				%>
            </table>
            <table width="80%">
                <tr>
                    <td><input type="submit" name="operation" value="<%=CollegeListCtl.OP_PREVIOUS%>"
						<%=(pageNo == 1) ? "disabled" : ""%>></td>

					<td><input type="submit" name="operation" value="<%=CollegeListCtl.OP_NEW%>"></td>

					<td><input type="submit" name="operation" value="<%=CollegeListCtl.OP_DELETE%>"></td>
					
					<td align="right"><input type="submit" name="operation"	value="<%=CollegeListCtl.OP_NEXT%>"
						<%= (nextPageSize != 0) ? "" :  "disabled"%>></td>
                </tr>
            </table>
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> 
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
            <%
			}
            %>
            
        </form>
    </center>
    <%@include file="Footer.jsp"%>
</body>
</html>