package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * My Profile functionality Controller. Performs operation for update your
 * Profile
 *
 * @author Arvind
 * @version 1.0
 * 
 */
@ WebServlet(name="MyProfileCtl",urlPatterns={"/ctl/MyProfileCtl"})
public class MyProfileCtl extends BaseCtl {

	private static final long serialVersionUID=1L;
    public static final String OP_CHANGE_MY_PASSWORD = "ChangePassword";

    private static Logger log = Logger.getLogger(MyProfileCtl.class);

    @Override
    protected boolean validate(HttpServletRequest request) {

        log.debug("MyProfileCtl Method validate Started");

        boolean pass = true;

        String op = DataUtility.getString(request.getParameter("operation"));

        if (OP_CHANGE_MY_PASSWORD.equalsIgnoreCase(op) || op == null) {

            return pass;
        }
   
        if (DataValidator.isNull(request.getParameter("firstName")))

		{

			//System.out.println("inside isnull fn of FirstName");	
			request.setAttribute("firstName", PropertyReader.getValue("error.require", "First Name"));
			
			pass = false;
		}

		else if(!DataValidator.isName(request.getParameter("firstName"))){
				request.setAttribute("firstName","Please Enter correct Name");
				pass=false;	
		}

        if (DataValidator.isNull(request.getParameter("lastName"))) {
			//System.out.println("inside isnull Function of last name");

			request.setAttribute("lastName", PropertyReader.getValue("error.require", "Last Name"));

			pass = false;
		}

		else if (!DataValidator.isName(request.getParameter("lastName"))) {
				request.setAttribute("lastName", "please enter correct Name");
				pass = false;
		}

        if (DataValidator.isNull(request.getParameter("gender"))) {
            request.setAttribute("gender",
                    PropertyReader.getValue("error.require", "Gender"));
            pass = false;
        }
        if (DataValidator.isNull(request.getParameter("mobileNo")))
		{
		 //System.out.println("inside isnull of mobileNo");
			request.setAttribute("mobileNo", PropertyReader.getValue("error.require", "Mobile No"));
			pass = false;
		}		
		else if(!DataValidator.isPhoneLength(request.getParameter("mobileNo"))){
				 request.setAttribute("mobileNo", PropertyReader.getValue("error.mobileNo", "Mobile No"));
				 pass=false;
		}
		else if (!DataValidator.isPhoneNo(request.getParameter("mobileNo"))) {
			request.setAttribute("mobileNo", PropertyReader.getValue("error.invalid", "Mobile No"));
			pass = false;
		}
        
        if (DataValidator.isNull(request.getParameter("dob")))

		{
		//	System.out.println("inside isnull dob");
			request.setAttribute("dob", PropertyReader.getValue("error.require", "Date Of Birth"));

			pass = false;

		}

		else if (!DataValidator.isDate(request.getParameter("dob"))) {
		//	System.out.println("inside isnull dobbb");
			request.setAttribute("dob", PropertyReader.getValue("error.date", "Date Of Birth"));

			pass = false;

		}

		else if (!DataValidator.isValidAge(request.getParameter("dob"))) {
		//	System.out.println("inside isvalidage dobbb");
			request.setAttribute("dob", PropertyReader.getValue("Age must be greater then 18 year", "Date Of Birth"));

			pass = false;

		}
        
        log.debug("MyProfileCtl Method validate Ended");

        return pass;

    }

    @Override
    protected BaseBean populateBean(HttpServletRequest request) {
        log.debug("MyProfileCtl Method populatebean Started");

        UserBean bean = new UserBean();

        bean.setId(DataUtility.getLong(request.getParameter("id")));
        System.out.println("Id is printed for myprofile---------" + bean.getId());
        bean.setLogin(DataUtility.getString(request.getParameter("login")));

        bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));

        bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

        bean.setMobileNo(DataUtility.getString(request.getParameter("mobileNo")));

        bean.setGender(DataUtility.getString(request.getParameter("gender")));

        bean.setDob(DataUtility.getDate(request.getParameter("dob")));

        populateDTO(bean, request);

        return bean;
    }

    /**
     * Display Concept for viewing profile page view
     */
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        log.debug("MyprofileCtl Method doGet Started");

        UserBean UserBean = (UserBean) session.getAttribute("user");
        long id = UserBean.getId();
        String op = DataUtility.getString(request.getParameter("operation"));

        // get model
        UserModel model = new UserModel();
        if (id > 0 || op != null) {
    //      System.out.println("in id > 0  condition");
            UserBean bean;
            try {
                bean = model.findByPK(id);
                ServletUtility.setBean(bean, request);
            } catch (ApplicationException e) {
                log.error(e);
                e.printStackTrace();
                ServletUtility.handleException(e, request, response);
                return;
            }
        }
        ServletUtility.forward(getView(), request, response);

        log.debug("MyProfileCtl Method doGet Ended");
    }

    /**
     * Submit Concept
     */
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        
        log.debug("MyprofileCtl Method doPost Started");

        String op = DataUtility.getString(request.getParameter("operation"));

        // get model
        UserModel model = new UserModel();

        /*if (OP_SAVE.equalsIgnoreCase(op)||OP_UPDATE.equalsIgnoreCase(op)) {
        	UserBean bean=(UserBean)populateBean(request);
			 
			 try{
				 if(id>0){
					 model.update(bean);
					 
					 
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
				 ServletUtility.setErrorMessage("Login id already exists",request);
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
				ServletUtility.setErrorMessage("Login id already exists", request);
			}
	 }*/
        if (OP_SAVE.equalsIgnoreCase(op)) {
			UserBean bean = (UserBean) populateBean(request);
			try {
				/*if (id > 0) {*/
					/*UserBean.setFirstName(bean.getFirstName());
					UserBean.setLastName(bean.getLastName());
					UserBean.setGender(bean.getGender());
					UserBean.setMobileNo(bean.getMobileNo());
					UserBean.setDob(bean.getDob());*/
				System.out.println(bean.getId()+ "----------ID and Firstname get" + bean.getFirstName());
					model.update(bean);
					HttpSession session = request.getSession();
					session.setAttribute("user", bean);

				/*}*/
				ServletUtility.setBean(bean, request);
				ServletUtility.setSuccessMessage("Profile has been updated Successfully. ", request);
			} catch (ApplicationException e) {
				log.error(e);
				ServletUtility.handleException(e, request, response);
				return;
			} catch (DuplicateRecordException e) {
				ServletUtility.setBean(bean, request);
				ServletUtility.setErrorMessage("Login id already exists", request);
			}
		} else if (OP_CHANGE_MY_PASSWORD.equalsIgnoreCase(op)) {

			ServletUtility.redirect(ORSView.CHANGE_PASSWORD_CTL, request, response);
			return;

		}

		ServletUtility.forward(getView(), request, response);
		System.out.println("MyProfileCtl Method dopost");
		log.debug("MyProfileCtl Method doPost Ended");
	}
        
        /*else if(OP_DELETE.equalsIgnoreCase(op)){
		 
		 UserBean bean=(UserBean)populateBean(request);
		 try{
			 model.delete(bean);
			 ServletUtility.redirect(ORSView.MY_PROFILE_CTL, request, response);
			 return;
			 
		 }catch(ApplicationException e){
			 log.error(e);
			 ServletUtility.handleException(e, request, response);
			 return;
		 }
	 }else if(OP_RESET.equalsIgnoreCase(op)){
			ServletUtility.redirect(ORSView.SUBJECT_LIST_CTL, request, response);
			return;
		 
	 }else if(OP_CANCEL.equalsIgnoreCase(op)){
		 
		 ServletUtility.redirect(ORSView.MY_PROFILE_CTL, request, response);
		 return;
	 }
        
	 ServletUtility.forward(getView(), request, response);
	
	
	 
	 log.debug("MyProfileCtl Method doPost End");
 }
*/
    @Override
    protected String getView() {
        return ORSView.MY_PROFILE_VIEW;
    }

}