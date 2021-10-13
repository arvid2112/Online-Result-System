package in.co.rays.proj4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.CourseBean;
import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.model.CourseModel;
import in.co.rays.proj4.model.SubjectModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;

/**
 * course functionality ctl.to perform add,delete ,update operation
 * @author Arvind
 * @version 1.0
 */
@WebServlet(name="CourseCtl",urlPatterns={"/ctl/CourseCtl"})
public class CourseCtl extends BaseCtl {

    private static final long serialVersionUID=1L;
	
	private static Logger log=Logger.getLogger(CourseCtl.class);

	
	
	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("CourseCtl Method validate Started");
		
		boolean pass=true;
		
		if(DataValidator.isNull(request.getParameter("courseName"))){
			request.setAttribute("courseName",PropertyReader.getValue("error.require","Course name"));
			pass=false;
		}
		else if (!DataValidator.isName(request.getParameter("courseName"))) {
			request.setAttribute("courseName", "please enter correct Course Name");
			pass = false;
	}
		if(DataValidator.isNull(request.getParameter("description"))){
			request.setAttribute("description",PropertyReader.getValue("error.require","Description"));
			pass=false;
		}
		else if (!DataValidator.isString(request.getParameter("description"))) {
			request.setAttribute("description", "Description cannot be left blank");
			pass = false;
	}
		
		if(DataValidator.isNull(request.getParameter("duration"))){
			request.setAttribute("duration",PropertyReader.getValue("error.require","Duration"));
			pass=false;
		}
		/*if(DataValidator.isNull(request.getParameter("courseName"))){
			request.setAttribute("courseName",PropertyReader.getValue("error.require","Course Name"));
			pass=false;
			
		}*/
		log.debug("CourseCtl Method validate Ended");
		return pass;
	
	}



	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		log.debug("CourseCtl Method populatebean Started");
		 CourseBean bean=new CourseBean();
		
		 bean.setId(DataUtility.getLong(request.getParameter("id")));
		 bean.setCourseName(DataUtility.getString(request.getParameter("courseName")));
		 bean.setDescription(DataUtility.getString(request.getParameter("description")));
		 bean.setDuration(DataUtility.getString(request.getParameter("duration")));

		 populateDTO(bean,request);
		 log.debug("CourseCtl Method populatebean Ended");
		 return bean;
	}



   /**
	* Display Logics inside this method
	*/
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String op=DataUtility.getString(request.getParameter("operation"));
		
		CourseModel model=new CourseModel();
		
		long id=DataUtility.getLong(request.getParameter("id"));
		
		if(id>0||op!=null){
			 CourseBean bean;
			 try{
				 bean=model.findByPK(id);
				 ServletUtility.setBean(bean, request);
				 System.out.println("Inside of doget try under coursectl");
			 }catch(ApplicationException e){
				 e.printStackTrace();
				 log.error(e);
				 ServletUtility.handleException(e, request,response);
				 return;
				 
			 }
		 }
		 ServletUtility.forward(getView(), request, response);
		 log.debug("course ctl Method doget Ended");
	 }	
	
	
	/**
     * Submit logic inside it
     */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*log.debug("CourseCtl Method doPost Started");
		 
		 String op=DataUtility.getString(request.getParameter("operation"));
		 
		 CourseModel model=new CourseModel();
		 long id=DataUtility.getLong(request.getParameter("id"));
		 if(OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)){
			 CourseBean bean=(CourseBean)populateBean(request);
			 
			 try{
				 if(id>0){
					 model.update(bean);
					 bean.setId(id);
					 ServletUtility.setSuccessMessage("Data is successfully updated", request);
					 ServletUtility.setBean(bean, request);
				 }else{
					 
					 try {
						 model.add(bean);
						ServletUtility.setSuccessMessage("Data is Successfully saved", request);
						ServletUtility.setBean(bean, request);
					} catch (ApplicationException e) {
						log.error(e);
						ServletUtility.handleException(e, request, response);
						return;
					} catch (DuplicateRecordException e) {
						ServletUtility.setBean(bean, request);
						ServletUtility.setErrorMessage("Course Name already exists", request);
					}					 
					 
				 }
				 
				 
			 }catch(ApplicationException e){
				 e.printStackTrace();
				 log.error(e);
				 ServletUtility.handleException(e, request, response);
				 return;
			 }catch(DuplicateRecordException e){
				 ServletUtility.setBean(bean, request);
				 ServletUtility.getErrorMessage("Course Name already exist",request);
				 
			 } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }else if(OP_DELETE.equalsIgnoreCase(op)){
			 
			 CourseBean bean=(CourseBean)populateBean(request);
			 try{
				 model.delete(bean);
				 ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request, response);
				 return;
				 
			 }catch(ApplicationException e){
				 log.error(e);
				 ServletUtility.handleException(e, request, response);
				 return;
			 }
			 
		 }else if(OP_CANCEL.equalsIgnoreCase(op)){
			 
			 ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request, response);
			 return;
		 }else if(OP_RESET.equalsIgnoreCase(op)){
				ServletUtility.redirect(ORSView.COURSE_CTL, request, response);
				return;
				
			}
		 ServletUtility.forward(getView(), request, response);
		 log.debug("CourseCtl Method doPost Ended");
	 }
	*/

		log.debug("coursectl Method doPost Started");
		 
		 String op=DataUtility.getString(request.getParameter("operation"));
		 
		 CourseModel model=new CourseModel();
		 
		 long id=DataUtility.getLong(request.getParameter("id"));
		 
		 
		 
		 if(OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)){
			 
			 CourseBean bean=(CourseBean)populateBean(request);
			 
			 try{
				 if(id>0){
					 model.update(bean);
					 ServletUtility.setBean(bean, request);
					 ServletUtility.setSuccessMessage("Data is successfully update", request);
					 
				 }else{
					 
					  try{
			Long pk= model.add(bean);
					bean.setId(pk);
					 ServletUtility.setSuccessMessage("Data is successfully saved", request);
			 }catch(ApplicationException e){
				 e.printStackTrace();
				 log.error(e);
				 ServletUtility.handleException(e, request, response);
				 return;
			 }catch(DuplicateRecordException e){
				 ServletUtility.setBean(bean, request);
				 ServletUtility.setErrorMessage("Course already exists",request);
			 }
					  
				 }
					 ServletUtility.setBean(bean, request);
				 
			 }catch (ApplicationException e) {
					log.error(e);
					ServletUtility.handleException(e, request, response);
					return;
				} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Course id already exists", request);
			}
		 }else if(OP_DELETE.equalsIgnoreCase(op)){
			 
			 CourseBean bean=(CourseBean)populateBean(request);
			 try{
				 model.delete(bean);
				 ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request, response);
				 return;
				 
			 }catch(ApplicationException e){
				 log.error(e);
				 ServletUtility.handleException(e, request, response);
				 return;
			 }
		 }/*else if(OP_RESET.equalsIgnoreCase(op)){
				ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
				return;
			 
		 }*/
		 
		 else if(OP_CANCEL.equalsIgnoreCase(op)){
			 
			 ServletUtility.redirect(ORSView.COURSE_LIST_CTL, request, response);
			 return;
		 }
		 ServletUtility.forward(getView(), request, response);
		
		
		 
		 log.debug("CourseCtl Method doPost End");
	 }
		
		
	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return ORSView.COURSE_VIEW;
	}
	
	
}
