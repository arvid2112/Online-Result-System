package in.co.rays.proj4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.RoleBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;

/**
 * User registration functionality Controller. Performs operation for User
 * Registration
 *
 * @author Arvind
 * @version 1.0
 *
 */
@WebServlet(name="UserRegistrationCtl",urlPatterns={"/UserRegistrationCtl"})
public class UserRegistrationCtl extends BaseCtl {

	
	
	 	public static final String OP_SIGN_UP = "SignUp";

	    private static Logger log = Logger.getLogger(UserRegistrationCtl.class);

	    @Override
	    protected boolean validate(HttpServletRequest request) {

	        log.debug("UserRegistrationCtl Method validate Started");

	        boolean pass = true;

	        String login = request.getParameter("login");
	        String dob = request.getParameter("dob");

	        if(DataValidator.isNull(request.getParameter("firstName"))){
				request.setAttribute("firstName",PropertyReader.getValue("error.require","FirstName"));
				pass=false;
			}else if(!DataValidator.isName(request.getParameter("firstName"))){
				request.setAttribute("firstName","please Enter correct Name");
				pass=false;
			}
       
	        if(DataValidator.isNull(request.getParameter("lastName"))){
				request.setAttribute("lastName",PropertyReader.getValue("error.require","LastName"));
				pass=false;
			}else if (!DataValidator.isName(request.getParameter("lastName"))) {
				request.setAttribute("lastName", "please enter correct Name");
				pass = false;

			}

	        if (DataValidator.isNull(request.getParameter("login"))) {
				request.setAttribute("login", PropertyReader.getValue("error.require", "login id"));
				pass = false;
			}else if (!DataValidator.isEmail(login)){
				request.setAttribute("login",PropertyReader.getValue("error.email","Email Id"));
				pass=false;	
			}
			
	    		if(DataValidator.isNull(request.getParameter("password"))){
	    			request.setAttribute("password",PropertyReader.getValue("error.require","Password"));
	    			pass=false;
	    		} else if (!DataValidator.isPasswordLength(request.getParameter("password"))) {
	    			request.setAttribute("password", "Password should be 8 to 12 characters");
	    			pass = false;
	    		} else if (!DataValidator.isPassword(request.getParameter("password"))) {
	    			request.setAttribute("password", "Password Must contain uppercase, lowercase, digit & special character");
	    			pass = false;
	    		}
	    		if(DataValidator.isNull(request.getParameter("confirmPassword"))){
	    			request.setAttribute("confirmPassword",PropertyReader.getValue("error.require","Confirm Password"));
	    			pass=false;
	    		}if (!request.getParameter("password").equals(request.getParameter("confirmPassword"))
	    				&& !"".equals(request.getParameter("confirmPassword"))) {
	    			request.setAttribute("confirmPassword","Confirm  Password  should  be matched.");
	    			pass = false;
	    		}
	                
	    		if(DataValidator.isNull(request.getParameter("gender"))){
	    			request.setAttribute("gender",PropertyReader.getValue("error.require", "Gender"));
	    			pass=false;
	    		}
	        
	        if(!DataValidator.isDate(dob)){
				request.setAttribute("dob",PropertyReader.getValue("error.require","Date Of Birth"));
				pass=false;	
			}
			else if (!DataValidator.isValidAge(dob)) {
				request.setAttribute("dob", "Age Must be greater then 18 year");
				pass = false;
			}
	              
	        if (DataValidator.isNull(request.getParameter("mobile"))) {
				request.setAttribute("mobile", PropertyReader.getValue("error.require", "Mobile"));
				pass = false;
			} else if(!DataValidator.isPhoneLength(request.getParameter("mobile"))){
				 request.setAttribute("mobile", "Please Enter Valid Mobile Number");
				 pass=false;	
			}else if (!DataValidator.isPhoneNo(request.getParameter("mobile"))) {
				request.setAttribute("mobile", "Please Enter Valid Mobile Number");
				pass = false;
			}
	        
	        log.debug("UserRegistrationCtl Method validate Ended");
	        System.out.println("return pass" + pass);
	        return pass;
	    }

	    @Override
	    protected BaseBean populateBean(HttpServletRequest request) {

	        log.debug("UserRegistrationCtl Method populatebean Started");

	        UserBean bean = new UserBean();

	        bean.setId(DataUtility.getLong(request.getParameter("id")));

	        bean.setRoleId(RoleBean.STUDENT);

	        bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));

	        bean.setLastName(DataUtility.getString(request.getParameter("lastName")));

	        bean.setLogin(DataUtility.getString(request.getParameter("login")));

	        bean.setPassword(DataUtility.getString(request.getParameter("password")));

	        bean.setConfirmPassword(DataUtility.getString(request.getParameter("confirmPassword")));

	        bean.setGender(DataUtility.getString(request.getParameter("gender")));

	        bean.setDob(DataUtility.getDate(request.getParameter("dob")));
	        bean.setMobileNo(DataUtility.getString(request.getParameter("mobile")));


	       // populateDTO(bean, request);

	        log.debug("UserRegistrationCtl Method populatebean Ended");

	        return bean;
	    }

	    /**
	     * Display concept of user registration
	     */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	    	log.debug("UserRegistrationCtl Method doGet Started");
	        
	    	ServletUtility.forward(getView(), request, response);

	    }

	    
	    
	    /**
	     * Submit concept of user registration
	     */
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	    	System.out.println("in post method");
	        
	    	log.debug("UserRegistrationCtl Method doPost Started");
	        
	    	String op = DataUtility.getString(request.getParameter("operation"));
	        // get model
	        
	    	UserModel model = new UserModel();
	        
	    	long id = DataUtility.getLong(request.getParameter("id"));
	        
	    	if (OP_SIGN_UP.equalsIgnoreCase(op)) 
	    		{
	    			UserBean bean = (UserBean) populateBean(request);
	           
	    			try 
	            
	            {
	                long pk = model.registerUser(bean);
	               
	                //bean.setId(pk);
	                ServletUtility.setBean(bean, request);
	               ServletUtility.setSuccessMessage("User has been succesfully registered..", request);
	              //  request.getSession().setAttribute("UserBean", bean);
	                
	                ServletUtility.forward(ORSView.USER_REGISTRATION_VIEW, request, response);
	                return;
	            } 
	    			
	    			catch (ApplicationException e) 
	    			
	    			{
		                log.error(e);
		                ServletUtility.handleException(e, request, response);
		                return;
	            } 
	    			
	    			catch (DuplicateRecordException e) 
	    			
	    			{
		                log.error(e);
		                ServletUtility.setBean(bean, request);
		                ServletUtility.setErrorMessage("Login id already exists",request);
		                ServletUtility.forward(getView(), request, response);
		            }
	        }
	    			
	    	

	    	  else if (OP_RESET.equalsIgnoreCase(op))
				{
					ServletUtility.redirect(ORSView.USER_REGISTRATION_CTL, request, response);
					return;
				}
			
	    	
	    	
	    	log.debug("UserRegistrationCtl Method doPost Ended");
	    }

	  
	
	@Override
	protected String getView() {
		
		return ORSView.USER_REGISTRATION_VIEW;
	}

}
