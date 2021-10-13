package in.co.rays.proj4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.RoleBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.model.RoleModel;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.PropertyReader;
import in.co.rays.proj4.util.ServletUtility;
/**
 * Login functionality Controller. Performs operation for Login
 *
 * @author Arvind
 * @version 1.0
 * 
 */

@WebServlet(name="LoginCtl",urlPatterns={"/LoginCtl"})
public class LoginCtl extends BaseCtl{
	
	private static final long serialVersionUID=1l;
	
	 /**
     * operation register key constant
     */
	public static final String OP_REGISTER ="Register";
	 /**
     * operation SignIn key constant
     */
	public static final String OP_SIGN_IN ="SignIn";
	 /**
     * operation SignUp key constant
     */
	public static final String OP_SIGN_UP ="SignUp";
	 /**
     * operation LogOut key constant
     */
	public static final String OP_LOG_OUT = "logout";

	private static final String OP_FORGET_PASSWORD = "Forget Password";
	
	
	private static Logger log = Logger.getLogger(LoginCtl.class);


	@Override
	protected boolean validate(HttpServletRequest request) {
		System.out.println("Inside Validate method of login ctl");
		 log.debug("LoginCtl Method validate Started");

	        boolean pass = true;

	        String op = request.getParameter("operation");
	        
	        if (OP_SIGN_UP.equals(op) || OP_LOG_OUT.equals(op)) {
	            return pass;
	            
	        }

	        String login = request.getParameter("login");

	        if (DataValidator.isNull(login)) 
		        {
		            request.setAttribute("login",PropertyReader.getValue("error.require", "Login Id"));
		            pass = false;
		        } 
	        
	        else if (!DataValidator.isEmail(login))
		        {
		            request.setAttribute("login",
		                    PropertyReader.getValue("error.email", "Login "));
		            pass = false;
		        }
	        if (DataValidator.isNull(request.getParameter("password"))) 
		        {
		            request.setAttribute("password",
		                    PropertyReader.getValue("error.require", "Password"));
		            pass = false;
		        }

	        log.debug("LoginCtl Method validate Ended");

	        System.out.println("going to return" + pass);
	        return pass;
	    }

	    @Override
	    protected BaseBean populateBean(HttpServletRequest request) {
	    	System.out.println("Inside populatebean method of login ctl");
	        log.debug("LoginCtl Method populatebean Started");

	        UserBean bean = new UserBean();

	        bean.setId(DataUtility.getLong(request.getParameter("id")));
	        bean.setLogin(DataUtility.getString(request.getParameter("login")));
	        bean.setPassword(DataUtility.getString(request.getParameter("password")));
	        populateDTO(bean,request);
	        log.debug("LoginCtl Method populatebean Ended");

	        return bean;
	    }

	    /**
	     * Display Login form
	     *
	     */
	    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	       System.out.println("Inside super class do get method of loginctl");
	    	HttpSession session = request.getSession(true);
	        
	    	log.debug(" Method doGet Started");

	        String op = DataUtility.getString(request.getParameter("operation"));

	        // get model
	        UserModel model = new UserModel();
	        RoleModel role = new RoleModel();

	        long id = DataUtility.getLong(request.getParameter("id"));
	       
	        if (id > 0) {
	        System.out.println("loggggggggggiiiiinnnnnnnnnnnn");
	        	UserBean userbean;
	           
	            try {
	                userbean = model.findByPK(id);
	                ServletUtility.setBean(userbean, request);
	              //  System.out.println("logindoGet...+++++}}}}}}}"+id);
	            	} 
	            
	            catch (ApplicationException e) 
		            {
		                log.error(e);
		                ServletUtility.handleException(e, request, response);
		                return;
		            }
	        }
	        
        
	        if (OP_LOG_OUT.equals(op)) {

	        	
	        	System.out.println("logout-----------");
	            session = request.getSession();

	            session.invalidate();
                
	            ServletUtility.setSuccessMessage("You have Sucessfully Logout..", request);
	            
	            ServletUtility.forward(ORSView.LOGIN_VIEW, request, response);

	            return;

	        } 
	        
	     
	        

	        ServletUtility.forward(getView(), request, response);

	        log.debug("UserCtl Method doGet Ended");

    }

	        
	        
	    
	    /**
	     * Submitting or login action performing
	     *
	     */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 

 	{
	 System.out.println("Inside super class do post method of loginctl");
	    			
	        		log.debug(" Method doPost Started");

	        		String op = DataUtility.getString(request.getParameter("operation"));

	        // get model   
	        		long id = DataUtility.getLong(request.getParameter("id"));
	        		
	        		UserModel model = new UserModel();
			        RoleModel rolemodel = new RoleModel();

	      
           
	      String path = request.getParameter("repath");	        
	        
	        if (OP_SIGN_IN.equalsIgnoreCase(op)) {

	        	HttpSession session = request.getSession(true);
	            UserBean bean = (UserBean) populateBean(request);

	            try {

	                bean = model.authenticate(bean.getLogin(), bean.getPassword());

	                if (bean != null) {
	                    
	                	session.setAttribute("user", bean);
	                   
	                    long rollId = bean.getRoleId();

	                    RoleBean rolebean = rolemodel.findByPK(rollId);

	                    if (rolebean != null) {
	                        session.setAttribute("role", rolebean.getName());
	                    }
	                
	                    
	                    
	                    if (path == null || path.length() <= 0) {
							ServletUtility.forward(ORSView.WELCOME_VIEW, request, response);
						} else {
							ServletUtility.redirect(path, request, response);
						}
	                    
	                    //ServletUtility.forward(ORSView.WELCOME_VIEW, request,response);
	                   
                        
	                } 
	                
	                else {
	                    bean = (UserBean) populateBean(request);
	                    ServletUtility.setBean(bean, request);
	                    ServletUtility.setErrorMessage("Invalid LoginId And Password", request);
	                    ServletUtility.forward(getView(), request, response);

	                }

	            } 
	            catch (ApplicationException e) 
	            {
	                log.error(e);
	                ServletUtility.handleException(e, request, response);
	                return;
	            }

	        } 
	        
	        
	        
	       
	        else if (OP_SIGN_UP.equalsIgnoreCase(op)) {

	            ServletUtility.redirect(ORSView.USER_REGISTRATION_CTL, request,response);
	            return;

	        }
	        
	        
	        else if (OP_FORGET_PASSWORD.equalsIgnoreCase(op)) {

	            ServletUtility.redirect(ORSView.FORGET_PASSWORD_CTL, request,response);
	            return;

	        }

	        	        
	        log.debug("UserCtl Method doPost Ended");
	        return;
	    }

	   
	    @Override
	    protected String getView() {
	        return ORSView.LOGIN_VIEW;
	    }

	}
	
	


