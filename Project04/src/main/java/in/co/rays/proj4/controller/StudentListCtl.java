package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.model.CollegeModel;
import in.co.rays.proj4.model.StudentModel;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Student List functionality Controller. Performs operation for list, search
 * and delete operations of Student
 *
 * @author Arvind
 * @version 1.0
 * 
 */
@WebServlet(name="StudentListCtl",urlPatterns={"/ctl/StudentListCtl"})
public class StudentListCtl extends BaseCtl {

    private static Logger log = Logger.getLogger(StudentListCtl.class);
    
    protected void preload(HttpServletRequest request) {
		CollegeModel model=new CollegeModel();
		try {
			List list=model.list();
			request.setAttribute("collegeList", list);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
    

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {

        StudentBean bean = new StudentBean();

        bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));
        
        //bean.setLastName(DataUtility.getString(request.getParameter("lastName")));
        
        bean.setEmail(DataUtility.getString(request.getParameter("Email")));
        
        //bean.setDob(DataUtility.getDate(request.getParameter("dob")));
        
        //bean.setMobileNo(DataUtility.getString(request.getParameter("mobileNo")));
        
        //System.out.println("??????????????????????????? populate collegeId"+bean.getCollegeId());
        
        bean.setCollegeId(DataUtility.getLong(request.getParameter("CollegeId")));

       // populateDTO(bean, request);
        
        return bean;
    }

    /**
     * Contains Display logics
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	
        log.debug("StudentListCtl doGet Start");
                
		int pageNo=1;
		
				int pageSize=DataUtility.getInt(PropertyReader.getValue("page.size"));

        StudentBean bean = (StudentBean) populateBean(request);

        String op = DataUtility.getString(request.getParameter("operation"));
        List list = null;
        List next=null;

        StudentModel model = new StudentModel();
       
        try {
			list = model.list( pageNo, pageSize);
			ServletUtility.setBean(bean, request);
			next = model.list( pageNo+1, pageSize);
			} catch (ApplicationException e) {
			log.error(e);
			ServletUtility.handleException(e, request, response);
			return;
			}

			if (list == null || list.size() == 0) {
			ServletUtility.setErrorMessage("No record found ", request);
			}if(next==null||next.size()==0){
			request.setAttribute("nextListSize", 0);

			}else{
			request.setAttribute("nextListSize", next.size());
			}
			ServletUtility.setList(list, request);
			ServletUtility.setPageNo(pageNo, request);
			ServletUtility.setPageSize(pageSize, request);
			ServletUtility.forward(getView(), request, response);

		log.debug("StudentListCtl doGet End");
	}
        
        
    /**
     * Contains Submit logics
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        /*log.debug("StudentListCtl doPost Start");
        List list = null;
        List next=null;
        int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        int pageSize = DataUtility.getInt(request.getParameter("pageSize"));
        
        pageNo = (pageNo == 0) ? 1 : pageNo;
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader
                .getValue("page.size")) : pageSize;

        StudentBean bean = (StudentBean) populateBean(request);
        String op = DataUtility.getString(request.getParameter("operation"));
        
        String[] ids = request.getParameterValues("ids");
        StudentModel model = new StudentModel();

        try {

            if (OP_SEARCH.equalsIgnoreCase(op) || OP_NEXT.equalsIgnoreCase(op)
                    || OP_PREVIOUS.equalsIgnoreCase(op)) {

                if (OP_SEARCH.equalsIgnoreCase(op)) {
                    pageNo = 1;
                } else if (OP_NEXT.equalsIgnoreCase(op)) {
                    pageNo++;
                } else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) {
                    pageNo--;
                }
                else if (OP_NEW.equalsIgnoreCase(op)) 
    	            
	            {
	                ServletUtility.redirect(ORSView.STUDENT_CTL, request, response);
	                
	                return;
 	            }

            }
            else if (OP_DELETE.equalsIgnoreCase(op))
	            
            {
               pageNo = 1;
                if (ids != null && ids.length > 0) 
                
                {
                    StudentBean deletebean = new StudentBean();
                    for (String id : ids) 
                    
                    {
                        deletebean.setId(DataUtility.getInt(id));
                        model.delete(deletebean);
                        ServletUtility.setSuccessMessage("Data is successfully deleted",request);


                    }
                    
            }
                
                
                else
                
                {
                    ServletUtility.setErrorMessage("Select at least one record", request);
                }
            }
            else if (OP_RESET.equalsIgnoreCase(op))
			{
				ServletUtility.redirect(ORSView.STUDENT_LIST_CTL, request, response);
				return;
			}
            
            
            list = model.search(bean, pageNo, pageSize);
            ServletUtility.setList(list, request);
            if (list == null || list.size() == 0 &&!OP_DELETE.equalsIgnoreCase(op)) 
            
            {
                ServletUtility.setErrorMessage("No record found ", request);
            }
            ServletUtility.setBean(bean, request);
            ServletUtility.setList(list, request);

            ServletUtility.setPageNo(pageNo, request);
            ServletUtility.setPageSize(pageSize, request);
            ServletUtility.forward(getView(), request, response);

        } catch (ApplicationException e) {
            log.error(e);
            ServletUtility.handleException(e, request, response);
            return;
        }
        log.debug("StudentListCtl doPost End");
    }

    @Override
    protected String getView() {
        return ORSView.STUDENT_LIST_VIEW;
    }
}*/

    	
    	log.debug("StudentListCtl Method doPost Started");
		 
    	List list = null;
        
    	int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        
    	int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        /*pageNo = (pageNo == 0) ? 1 : pageNo;
        */
        /*pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader .getValue("page.size")) : pageSize;
        */
        StudentBean bean = (StudentBean) populateBean(request);
        
        System.out.println(bean.getCollegeId()+"College ID is this for student");
       String op = DataUtility.getString(request.getParameter("operation"));
       
        // get the selected checkbox ids array for delete list
          
        String[] ids = request.getParameterValues("ids");
        
        StudentModel model = new StudentModel();
        try {

            /*if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)
                    || "Previous".equalsIgnoreCase(op)) 
            {*/

                if (OP_SEARCH.equalsIgnoreCase(op))
	                {
	                    pageNo = 1;
	                }
                
                else if (OP_NEXT.equalsIgnoreCase(op))
                
	                {
	                    pageNo++;
	                } 
	                
                
                else if (OP_PREVIOUS.equalsIgnoreCase(op) && pageNo > 1) 
                
	                {
	                    pageNo--;
	               
	                }
                 
            else if (OP_NEW.equalsIgnoreCase(op)) 
            
            {
                ServletUtility.redirect(ORSView.STUDENT_CTL, request, response);
                
                return;
	            } 
            
            
            else if (OP_DELETE.equalsIgnoreCase(op))
            
            {
               pageNo = 1;
                if (ids != null && ids.length > 0) 
                
                {
                    StudentBean deletebean = new StudentBean();
                    for (String id : ids) 
                    
                    {
                        deletebean.setId(DataUtility.getInt(id));
                        model.delete(deletebean);
                        ServletUtility.setSuccessMessage("Data is successfully deleted",request);


                    }
                    
            }
                
                
                else
                
                {
                    ServletUtility.setErrorMessage("Select at least one record", request);
                }
            }
            else if (OP_RESET.equalsIgnoreCase(op))
			{
				ServletUtility.redirect(ORSView.STUDENT_LIST_CTL, request, response);
				return;
			}

         
            list = model.search(bean, pageNo, pageSize);
            System.out.println("hpppppyyyyyyyy newwwww yearrrrrrrrrr"+list);
            //ServletUtility.setList(list, request);
            
            if (list == null || list.size() == 0 &&!OP_DELETE.equalsIgnoreCase(op)) 
            
            {
                ServletUtility.setErrorMessage("No record found ", request);
            }
            
            
            System.out.println("hpppppyyyyyyyy newwwww yearrrrrrrrrr 22222222"+list);
            ServletUtility.setBean(bean, request);
            
            ServletUtility.setList(list, request);
            
            ServletUtility.setPageNo(pageNo, request);
            
            ServletUtility.setPageSize(pageSize, request);
            
            ServletUtility.forward(getView(), request, response);

        } 
        
        catch (ApplicationException e) 
	        {
	            log.error(e);
	            ServletUtility.handleException(e, request, response);
	            return;
	        }
        log.debug("StudentListCtl dopost End");
    }

@Override
protected String getView() {
	
	return ORSView.STUDENT_LIST_VIEW;
}

}
