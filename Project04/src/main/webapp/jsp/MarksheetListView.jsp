<%@page import="in.co.rays.proj4.controller.MarksheetListCtl"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.MarksheetCtl"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<body>

<script type="text/javascript">
	function selectAll(source)
	{
		var checkboxes = document.getElementsByName('ids');
		  for(var i=0,n=checkboxes.length;i<n;i++) {
				checkboxes[i].checked = source.checked;
		  }
	}
	</script> 
    

        <form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="POST">
		<%@include file="Header.jsp"%>
		
		<jsp:useBean id="bean" class="in.co.rays.proj4.bean.MarksheetBean"
		scope="request"></jsp:useBean>
		
		<center>
        <h1>Marksheet List</h1>
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
        	
        	<%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int nextPageSize =  DataUtility.getInt(DataUtility.getStringData(request.getAttribute("nextListSize")));
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<MarksheetBean> it = list.iterator();

                    if (list.size() != 0) {
                %>
        	
            <table width="100%">
                <tr>
                    <td align="center">
                    
                    <label><b>Student Name : </b></label>
                    <%=HTMLUtility.getSList("studentId",DataUtility.getStringData(request.getAttribute("studentId")), (List<StudentBean>) request.getAttribute("studentList")) %>
                                        
                    <label> Name :</label> 
                    <input type="text" name="name" placeholder="Enter Name" value="<%=ServletUtility.getParameter("name", request)%>">&emsp;
                    
                    <label>Roll No :</label>
                    <input type="text" name="rollNo" placeholder="Enter Roll No" value="<%=ServletUtility.getParameter("rollNo", request)%>">&emsp;
                    
                    <input type="submit" name="operation" value="<%=MarksheetListCtl.OP_SEARCH %>">&emsp;
                    <input type="submit" name="operation" value="<%=MarksheetListCtl.OP_RESET%>"></td>
                </tr>
            </table>
            <br>
            <table border="1" width="100%">
                <tr>
                    <th align="center"><input type="checkbox" 
					onclick="selectAll(this)">SelectAll</th>
                    <th>S.No</th>
                    <th>Roll No</th>
                    <th>Name</th>
                    <th>Physics</th>
                    <th>Chemistry</th>
                    <th>Maths</th>
                    <th>Edit</th>
                </tr>
                <%
					while (it.hasNext()) {
							bean = it.next();
				%>
                
                <tr>
                    <td align="center"><input type="checkbox" name="ids" 
						value="<%=bean.getId()%>"></td>
                    <td align="center"><%=index++%></td>
                    <td align="center"><%=bean.getRollNo()%></td>
                    <td align="center"><%=bean.getName()%></td>
                    <td align="center"><%=bean.getPhysics()%></td>
                    <td align="center"><%=bean.getChemistry()%></td>
                    <td align="center"><%=bean.getMaths()%></td>
                    <td align="center"><a href="MarksheetCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>

                <%
                    }
                %>
            </table>
            <table width="80%">
                <tr>
                    <td><input type="submit" name="operation" value="<%=MarksheetListCtl.OP_PREVIOUS%>"
                    <%=(pageNo == 1) ? "disabled" :"" %>></td>
                    <td><input type="submit" name="operation" value="<%=MarksheetListCtl.OP_NEW%>"></td>
                    <td><input type="submit" name="operation" value="<%=MarksheetListCtl.OP_DELETE%>"></td>
                    <td align="right"><input type="submit" name="operation" value="<%=MarksheetListCtl.OP_NEXT%>"
                    <%=(nextPageSize != 0) ? "" : "disabled"%>></td>
                </tr>
            </table>
            <%
				}
				if (list.size() == 0) {
			%>

			<input type="submit" name="operation" value="<%=MarksheetCtl.OP_BACK%>">
			<%
				}
			%>
            
            <input type="hidden" name="pageNo" value="<%=pageNo%>">
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
    </center>
    
</body>
<%@include file="Footer.jsp"%>
</html>