<%@page import="in.co.rays.proj4.bean.RoleBean"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<html>

<%
    UserBean userBean = (UserBean) session.getAttribute("user");

    boolean userLoggedIn = userBean != null;

    String welcomeMsg = "Hi, ";

    if (userLoggedIn) 
    {
        String role = (String) session.getAttribute("role");
        welcomeMsg += userBean.getFirstName() + " (" + role + ")";
    }
    
    else
    {
        welcomeMsg += "Guest";
    }
%>


  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  

 
  

 
 <style>

.head{
 height:70px; 
color:black;
}
</style>
<body>



<table width="100%" border="0" class="head" >
    <tr>
        <td width="100%" ><a href="<%=ORSView.WELCOME_CTL%>"><b>Welcome</b></a> ||
            <%
            if (userLoggedIn) 
            {
        %> <a href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>"><b>Logout</b></a>
            <%
                } 
            else
            {
            %> <a href="<%=ORSView.LOGIN_CTL%>"><b>Login</b></a> <%
     }
 %></td>
        <td rowspan="2" align="right">
            
                <img src="<%=ORSView.APP_CONTEXT%>/img/sunrays.png" width="80"
                    height="60">
            
        </td>

    </tr>
    
    <tr>
         <td> 
            <h4><%=welcomeMsg%></h4>
        </td> 
    </tr>
    

    <%
        if (userLoggedIn) {
    %>

    <tr>
        <td colspan="2">
        
        		<a href="<%=ORSView.MY_PROFILE_CTL%>">MyProfile</a> ||
               
        	   	<a href="<%=ORSView.CHANGE_PASSWORD_CTL%>">Change Password</a> ||
        
           	
           		<a href="<%=ORSView.GET_MARKSHEET_CTL%>">Get Marksheet</b></a> ||
            	
             
             	<a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>">Marksheet MeritList</b> </a> ||
        	
           
        	 
        	    	    
        	    <%
           		 if (userBean.getRoleId() == RoleBean.ADMIN || userBean.getRoleId() == RoleBean.COLLEGE_SCHOOL) {
                 %>
            	<a href="<%=ORSView.USER_CTL%>">Add User</a> ||
            	
            	<a href="<%=ORSView.USER_LIST_CTL%>">User List</a> || 
            	
            	<a href="<%=ORSView.STUDENT_CTL%>">Add Student</a> ||
            
            	<a href="<%=ORSView.STUDENT_LIST_CTL%>">Student List</a> ||
            	
            	<a href="<%=ORSView.COLLEGE_CTL%>">Add College</a> ||
            
            	<a href="<%=ORSView.COLLEGE_LIST_CTL%>">College List</a> ||
            	
            	<a href="<%=ORSView.SUBJECT_CTL%>">Add Subject</a> || 
	
				<a href="<%=ORSView.SUBJECT_LIST_CTL%>">Subject List</a> || 
            	
            	<a href="<%=ORSView.COURSE_CTL%>">Add Course</a> ||
	
				<a href="<%=ORSView.COURSE_LIST_CTL%>">Course List</a> || 
				
				<a href="<%=ORSView.FACULTY_CTL%>">Add Faculty</a> || 
	
				<a href="<%=ORSView.FACULTY_LIST_CTL%>">Faculty List</a> ||
				
			
				<a href="<%=ORSView.MARKSHEET_CTL%>">Add Marksheet</b></a> ||
       
       			<a href="<%=ORSView.MARKSHEET_LIST_CTL%>">Marksheet List</b></a> ||
              
				<%-- <a href="<%=ORSView.GET_MARKSHEET_CTL%>" ><font color="blue">Get Marksheet</b></a> ||
            	
            	<a href="<%=ORSView.MARKSHEET_LIST_CTL%>"><font color="blue">Marksheet List</b></a> ||
               
             	<a href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><font color="blue">Marksheet MeritList</b> </a> ||
         --%>
				
				<a href="<%=ORSView.TIMETABLE_CTL%>">Add Timetable</b></a> ||
	
				<a href="<%=ORSView.TIMETABLE_LIST_CTL%>">TimeTable List</b></a> ||
          
				
        		<a href="<%=ORSView.ROLE_CTL%>">Add Role</b></a> ||
            
            	<a href="<%=ORSView.ROLE_LIST_CTL%>">Role List</b></a> || 
            	
            	<a href="<%=ORSView.JAVA_DOC_VIEW%>" target="blank">Java Doc</b></a> ||
    
            	<%
     				}
        	   
        	   
 				%>
 
 </td>
    
    </tr>
 <%
        }
    %>

</table>
 
<hr>

</body>
</html>
