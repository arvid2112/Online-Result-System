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
import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.model.CourseModel;
import in.co.rays.proj4.model.SubjectModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;

/**
 * subject functionality controller.perfrom search and show list operation
 * @author Arvind
 * @version 1.0
 */
@WebServlet(name="SubjectListCtl",urlPatterns={"/ctl/SubjectListCtl"})
public class SubjectListCtl extends BaseCtl{

	private static final long serialVersionUID = 1L;
	private static Logger log=Logger.getLogger(SubjectListCtl.class);
	
	@Override
	protected void preload(HttpServletRequest request){
		CourseModel model=new CourseModel();
		try {
			List list=model.list();
			request.setAttribute("courseList", list);
		} catch (Exception e) {
			log.error(e);
			// TODO: handle exception
		}
	}
	
	@Override
	protected BaseBean populateBean(HttpServletRequest request){
		
		log.debug(" Subjectlist populate bean start");
		SubjectBean bean=new SubjectBean();
		
		bean.setSubjectName(DataUtility.getString(request.getParameter("subjectName")));
		bean.setCourseName(DataUtility.getString(request.getParameter("courseName")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));
	 
		 bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
		 bean.setSubjectId(DataUtility.getLong(request.getParameter("subjectId")));
		
		populateDTO(bean, request);
		log.debug("Subjectlist populate bean end");
		return bean;
	}
	
	/**
     * Display Logics inside this method
     */
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		
		log.debug("Subjectlist do get start");
		int pageNo=1;
		int pageSize=DataUtility.getInt(PropertyReader.getValue("page.size"));
		
		SubjectBean bean=(SubjectBean)populateBean(request);
		List list=null;
		List next=null;
		SubjectModel model=new SubjectModel();
		
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

		log.debug("SubjectListCtl doGet End");
	}
	
	/**
     * Submit logic inside it
     */
		protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
			
			log.debug("SubjectListCtl doPost Start");
			List list=null;
			List next=null;
			
			int pageNo=DataUtility.getInt(request.getParameter("pageNo"));
			int pageSize=DataUtility.getInt(request.getParameter("pageSize"));
			

			
			SubjectBean bean=(SubjectBean)populateBean(request);
			String op=DataUtility.getString(request.getParameter("operation"));
			SubjectModel model=new SubjectModel();
			String[] ids = request.getParameterValues("ids");
			
			try{
				if(OP_SEARCH.equalsIgnoreCase(op)||OP_NEXT.equalsIgnoreCase(op)||OP_PREVIOUS.equalsIgnoreCase(op)){
					
					if(OP_SEARCH.equalsIgnoreCase(op)){
						pageNo=1;
					}else if(OP_NEXT.equalsIgnoreCase(op)){
						pageNo++;
					}else if(OP_PREVIOUS.equalsIgnoreCase(op)&&pageNo>1){
						pageNo--;
					}
				} else if (OP_NEW.equalsIgnoreCase(op)) {
					ServletUtility.redirect(ORSView.SUBJECT_CTL, request, response);
					return;
				} else if (OP_RESET.equalsIgnoreCase(op)) {

					ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
					return;
				} else if (OP_DELETE.equalsIgnoreCase(op)) {
					pageNo = 1;
					if (ids != null && ids.length > 0) {
						SubjectBean deletebean = new SubjectBean();
						for (String id : ids) {
							deletebean.setId(DataUtility.getInt(id));
							model.delete(deletebean);
							ServletUtility.setSuccessMessage("Data is successfully deleted", request);
						}
					} else {
						ServletUtility.setErrorMessage("Select at least one record", request);
					}
				}if (OP_BACK.equalsIgnoreCase(op)) {
					ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
					return;
				}
			    	bean = (SubjectBean) populateBean(request);
					list=model.search(bean, pageNo, pageSize);
					 next=model.search(bean, pageNo+ 1, pageSize);
					

					
					if(list==null||list.size()==0&&!OP_DELETE.equalsIgnoreCase(op)){
						ServletUtility.setErrorMessage("No record Found", request);
						
					}
					if (next == null || next.size() == 0) {
						request.setAttribute("nextListSize", 0);
					} else {
						request.setAttribute("nextListSize", next.size());
					}

					ServletUtility.setBean(bean, request);
					ServletUtility.setList(list, request);
					ServletUtility.setPageNo(pageNo, request);
					ServletUtility.setPageSize(pageSize, request);
					ServletUtility.forward(getView(), request, response);
				
				}catch(ApplicationException e){
					log.error(e);
					ServletUtility.handleException(e, request, response);
					return;
				}catch(Exception e){
					
				}
			
				log.debug("SubjectListCtl doPost End");
			}

		@Override
		protected String getView() {
			// TODO Auto-generated method stub
			return ORSView.SUBJECT_LIST_VIEW;
		}


}