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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * College List functionality Controller. Performs operation for list, search
 * and delete operations of College
 *
 * @author Arvind
 * @version 1.0
 * 
 */
@ WebServlet(name="CollegeListCtl",urlPatterns={"/ctl/CollegeListCtl"})
public class CollegeListCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;
    private static Logger log = Logger.getLogger(CollegeListCtl.class);

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
    	
        CollegeBean bean = new CollegeBean();

        bean.setName(DataUtility.getString(request.getParameter("name")));
        
        bean.setAddress(DataUtility.getString(request.getParameter("address")));
        bean.setState(DataUtility.getString(request.getParameter("state")));
        bean.setCity(DataUtility.getString(request.getParameter("city")));
        bean.setPhoneNo(DataUtility.getString(request.getParameter("phoneNo")));

        return bean;
    }

    /**
     * Contains display logic
     */
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

    	log.debug("CollegeListCtl doGet Start");
       /*    	
    	List list = new ArrayList();
        
	    	        
	    	int pageNo = 1;
	        
	    	int pageSize = DataUtility.getInt(PropertyReader.getValue("page.size"));

	    	CollegeBean bean = (CollegeBean) populateBean(request);
	        
      
	    	CollegeModel model = new CollegeModel();
	        try 
	        
		        {
	        	 
		            list = model.search(bean, pageNo, pageSize);

		            
		            if (list == null || list.size() == 0) 
			            {
		            	 
			                ServletUtility.setErrorMessage("No record found ", request);
			            }
		            
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
	        log.debug("CollegeListCtl doGet End");
    }*/
    	int pageNo = 1;
    	int pageSize=DataUtility.getInt(PropertyReader.getValue("page.size"));

        CollegeBean bean = (CollegeBean) populateBean(request);

        String op = DataUtility.getString(request.getParameter("operation"));
        List list = null;
        List next=null;

        CollegeModel model = new CollegeModel();
        

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
     * Contains submit logic
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

       /* log.debug("CollegeListCtl doPost Start");

                
        List list = null;
        
    	int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        
    	int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        pageNo = (pageNo == 0) ? 1 : pageNo;
        
        pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader .getValue("page.size")) : pageSize;
        
        CollegeBean bean = (CollegeBean) populateBean(request);
        
       String op = DataUtility.getString(request.getParameter("operation"));
       
        // get the selected checkbox ids array for delete list
          
        String[] ids = request.getParameterValues("ids");
        
        CollegeModel model = new CollegeModel();
        try {

            if (OP_SEARCH.equalsIgnoreCase(op) || "Next".equalsIgnoreCase(op)
                    || "Previous".equalsIgnoreCase(op)) 
            {

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
                ServletUtility.redirect(ORSView.COLLEGE_CTL, request, response);
                
                return;
	            } 
            
            
            else if (OP_DELETE.equalsIgnoreCase(op))
            
            {
               pageNo = 1;
                if (ids != null && ids.length > 0) 
                
                {
                    CollegeBean deletebean = new CollegeBean();
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
				ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request, response);
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
        log.debug("CollegeListCtl dopost End");
    }*/
    	
    	
    	log.debug("CollegeListCtl Method doPost Started");
		 
    	List list = null;
        
    	int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
        
    	int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

        CollegeBean bean = (CollegeBean) populateBean(request);
        
       String op = DataUtility.getString(request.getParameter("operation"));

          
        String[] ids = request.getParameterValues("ids");
        
        CollegeModel model = new CollegeModel();
        try {

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
                ServletUtility.redirect(ORSView.COLLEGE_CTL, request, response);
                
                return;
	            } 
            
            
            else if (OP_DELETE.equalsIgnoreCase(op))
            
            {
               pageNo = 1;
                if (ids != null && ids.length > 0) 
                
                {
                    CollegeBean deletebean = new CollegeBean();
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
				ServletUtility.redirect(ORSView.COLLEGE_LIST_CTL, request, response);
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
        log.debug("CollegeListCtl dopost End");
    }
    

    @Override
    protected String getView() {
        return ORSView.COLLEGE_LIST_VIEW;
    }
}