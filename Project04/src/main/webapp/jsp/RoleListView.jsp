<%@page import="in.co.rays.proj4.controller.RoleListCtl" %>
<%@page import="in.co.rays.proj4.controller.BaseCtl" %>
<%@page import="in.co.rays.proj4.bean.RoleBean" %>
<%@page import="in.co.rays.proj4.util.ServletUtility" %>
<%@page import="in.co.rays.proj4.util.HTMLUtility" %>
<%@page import="in.co.rays.proj4.util.DataUtility" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Role List View</title>
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
	<form action="<%=ORSView.ROLE_LIST_CTL%>"method="post">
	<%@include file="Header.jsp" %>
		<jsp:useBean id="bean" class="in.co.rays.proj4.bean.RoleBean"
				scope="request"></jsp:useBean>
	
	<%
				List list1 = (List)request.getAttribute("roleList");
			    %>
	
<center>
	<h1>Role List</h1>
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
	  <label>Name</label>
	  <%=HTMLUtility.getSList("name", String.valueOf(bean.getId()), list1)%>&nbsp;
	  
	   <input type="submit" name="operation" value="<%=RoleListCtl.OP_SEARCH%>">&nbsp;
	  <input type="submit" name="operation"	value="<%=RoleListCtl.OP_RESET%>"></td>
			 
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
	    <th>S.No.</th>
	    <th>Name</th>
	    <th>Description</th>
	    <th>Edit</th>
	   </tr>
	    
	     <%
	     	int pageNo=ServletUtility.getPageNo(request);
	        int pageSize=ServletUtility.getPageSize(request);
	        int index=((pageNo-1)*pageSize)+1;
	        int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
	        Iterator<RoleBean> it=list.iterator();
	      					while (it.hasNext()) {
							bean = it.next();
				%>
	    
	      <tr>
	      <td align="center"><input type="checkbox" name="ids" onclick="checkAl(this)"
						value="<%=bean.getId()%>" 
						<%=(bean.getId() == 1) ? "disabled" : ""%>></td>
	        <td align="center"><%=index++%></td>
	        <td align="center"><%=bean.getName()%></td>
	        <td align="center"><%=bean.getDescription() %>
	        <td align="center"><a href="RoleCtl?id=<%=bean.getId() %>"
	        <%if (bean.getId() == RoleBean.ADMIN) {%> onclick="return false;"<%}%>>Edit</a></td>
	       </tr>
	       <%
	        } 
	       %>
	     
	</table>
	<table width="80%">
	<tr>
	<td><input type="submit" name="operation" value="<%=RoleListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
		<td><input type="submit" name="operation" value="<%=RoleListCtl.OP_NEW%>"></td>
		<td><input type="submit" name="operation" value="<%=RoleListCtl.OP_DELETE%>"></td>				
	  <td align="right"><input type="submit" name="operation" value="<%=RoleListCtl.OP_NEXT%>"
						<%=/* (nextPageSize != 0) ? "" :  */"disabled"%>></td>
	  </tr>
	</table>
			<%-- <%
				}
				if (list.size() == 0) {
			%>
			<input type="submit" name="operation"
				value="<%=RoleListCtl.OP_BACK%>">
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

</body>
<%@include file="Footer.jsp"%>
</html>