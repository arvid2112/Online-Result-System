package in.co.rays.proj4.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.MarksheetBean;
import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.model.CollegeModel;
import in.co.rays.proj4.model.MarksheetModel;
import in.co.rays.proj4.model.StudentModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;


/**
 * marksheet functionality ctl.to show list of marksheet
 * @author Arvind
 * @version 1.0
 */
@WebServlet(name="MarksheetListCtl",urlPatterns={"/ctl/MarksheetListCtl"})
public class MarksheetListCtl extends BaseCtl {

	private static final long serialVersionUID = 1L;
	private static Logger log=Logger.getLogger(MarksheetListCtl.class);
	
	
	/* (non-Javadoc)
	 * @see in.co.rays.project_4.ctl.BaseCtl#preload(javax.servlet.http.HttpServletRequest)
	 */
	@Override
    protected void preload(HttpServletRequest request){
    	log.debug("MarksheetListCtl Method preload start");
    	List<StudentBean>list = new ArrayList<StudentBean>();
    	StudentModel model = new StudentModel();
    	try {
			list= model.list();
			request.setAttribute("studentList", list);
		} catch (ApplicationException e) {
			log.error(e);
		}
    	log.debug("MarksheetListCtl Method preload end");
	}
	
	
	/* (non-Javadoc)
	 * @see in.co.rays.project_4.ctl.BaseCtl#populateBean(javax.servlet.http.HttpServletRequest)
	 */
	protected BaseBean populateBean(HttpServletRequest request){
		log.debug(" Marksheetlist populate bean start");
		System.out.println("populate method in MarksheetCtl");
		
		MarksheetBean bean=new MarksheetBean();
		bean.setId(DataUtility.getLong(request.getParameter("rollId")));
		bean.setRollNo(DataUtility.getString(request.getParameter("rollNo")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setStudentId(DataUtility.getLong(request.getParameter("studentId")));
		
		populateDTO(bean, request);
		return bean;
	}

	/**
     * ContainsDisplaylogics
     */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("Marksheet	list do get start");
/*		int pageNo = DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize = DataUtility.getInt(request.getParameter("pageSize"));

		pageNo = (pageNo == 0) ? 1 : pageNo;

		pageSize = (pageSize == 0) ? DataUtility.getInt(PropertyReader
		.getValue("page.size")) : pageSize;

		MarksheetBean bean = (MarksheetBean) populateBean(request);

		List list = null;
		List next = null;
		MarksheetModel model = new MarksheetModel();
		try {
		list = model.search(bean, pageNo, pageSize);
		ServletUtility.setBean(bean, request);
		next = model.search(bean, pageNo+1, pageSize);
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
		log.debug("MarksheetListCtl doGet End");
		
	}*/
		
		int pageNo=1;
		int pageSize=DataUtility.getInt(PropertyReader.getValue("page.size"));
		
		MarksheetBean bean=(MarksheetBean)populateBean(request);
		List list=null;
		List next=null;
		MarksheetModel model=new MarksheetModel();
		
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

		log.debug("MarksheetListCtl doGet End");
	}
		
	/**
     * Contains Submit logics
     */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		log.debug("MarksheetListCtl doPost Started");
		
		List list=null;
		List next=null;
		
		int pageNo=DataUtility.getInt(request.getParameter("pageNo"));
		int pageSize=DataUtility.getInt(request.getParameter("pageSize"));
		
		pageNo=(pageNo==0)?1:pageNo;
		pageSize=(pageSize==0)?DataUtility.getInt(PropertyReader.getValue("page.size")):pageSize;
		
		MarksheetBean bean=(MarksheetBean)populateBean(request);
		String op=DataUtility.getString(request.getParameter("operation"));
		
		String[] ids=request.getParameterValues("ids");
		
		MarksheetModel model=new MarksheetModel();
		
		try{
			if(OP_SEARCH.equalsIgnoreCase(op)||OP_NEXT.equalsIgnoreCase(op)||OP_PREVIOUS.equalsIgnoreCase(op)){
				
				if(OP_SEARCH.equalsIgnoreCase(op)){
					pageNo=1;
				}else if(OP_NEXT.equalsIgnoreCase(op)){
					pageNo++;	
				}else if(OP_PREVIOUS.equalsIgnoreCase(op)&&pageNo>1){
					pageNo--;
				}
			}else if (OP_NEW.equalsIgnoreCase(op)) {
                ServletUtility.redirect(ORSView.MARKSHEET_CTL, request,response);
              
                return;
            } else if (OP_RESET.equalsIgnoreCase(op)) {

    			ServletUtility.redirect(ORSView.MARKSHEET_LIST_CTL, request, response);
    			return;
    		}else if (OP_BACK.equalsIgnoreCase(op)) {
				ServletUtility.redirect(ORSView.WELCOME_CTL, request, response);
				
				return;
			}
			else if(OP_NEXT.equalsIgnoreCase(op)){
				ServletUtility.redirect(ORSView.MARKSHEET_CTL, request, response);
				return;
			}else if(OP_DELETE.equalsIgnoreCase(op)){
				pageNo=1;
				
			if(ids!=null&&ids.length>0){
				MarksheetBean deletebean=new MarksheetBean();
				for(String id:ids){
					deletebean.setId(DataUtility.getInt(id));
					System.out.println("do post......."+op);
					model.delete(deletebean);
					ServletUtility.setSuccessMessage("Data Delete Successfully", request);
				}
			}else{
				ServletUtility.setErrorMessage("Select at leat one record", request);
			}
		}
		bean = (MarksheetBean) populateBean(request);	
		list=model.search(bean, pageNo, pageSize);
		
		
		next = model.search(bean, pageNo+1, pageSize);
        
        
		if(list==null||list.size()==0&&!OP_DELETE.equalsIgnoreCase(op)){
			ServletUtility.setErrorMessage("No record found", request);
			
		}if(next==null||next.size()==0){
			request.setAttribute("nextListSize", 0);
			
		}else{
			request.setAttribute("nextListSize", next.size());
		}
		ServletUtility.setBean(bean, request);
		ServletUtility.setList(list, request);
		ServletUtility.setPageNo(pageNo, request);
		ServletUtility.setPageSize(pageSize, request);
		ServletUtility.forward(getView(), request,response);
	
	}catch(ApplicationException e){
		log.error(e);
	
		ServletUtility.handleException(e, request, response);
	return;
	}
	log.debug("MarksheetListCtl doPost End");
}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.MARKSHEET_LIST_VIEW;
	}
	
}
