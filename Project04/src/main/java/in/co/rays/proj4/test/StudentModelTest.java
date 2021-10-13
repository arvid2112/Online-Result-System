package in.co.rays.proj4.test;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.model.StudentModel;

public class StudentModelTest {
	
    public static StudentModel model = new StudentModel();
    
    
    public static void main(String[] args) throws ParseException {
    	//testAdd();
    	//testDelete();
    	//testSearch();
    	testUpdate();
	}
	
	  public static void testAdd() throws ParseException {
		  
		  

	        try {
	            StudentBean bean = new StudentBean();
	            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	           // bean.setId(112L);
	            bean.setFirstName("arpit");
	            bean.setLastName("sharma");
	            bean.setDob(sdf.parse("6/02/98"));
	            bean.setMobileNo("7864545874");
	            bean.setEmail("arpits12@gmail.com");
	            bean.setCollegeId(1L);
	            bean.setCreatedBy("Student");
	            bean.setModifiedBy("Student");
	            bean.setCreatedDatetime(null);
	            bean.setModifiedDatetime(null);
	            
	            long pk = model.add(bean);
	            
	            StudentBean addedbean = model.findByPK(pk);
	            
	            if (addedbean == null) 
	            {
	                System.out.println("Test add fail");
	            }
	        } 
	        
	        catch (ApplicationException e) 
	        {
	            e.printStackTrace();
	        } 
	        
	        catch (DuplicateRecordException e) {
	            e.printStackTrace();
	        }
	        
	        
	  }   
	        public static void testDelete() {

		        try {
		            StudentBean bean = new StudentBean();
		            long pk = 1L;
		            bean.setId(pk);
		            model.delete(bean);
		            System.out.println("Test Delete success" + bean.getId());
		            StudentBean deletedbean = model.findByPK(pk);
		            
		            if (deletedbean == null)
		            {
		                System.out.println("Test Delete fail");
		            }
		        } 
		        
		        catch (ApplicationException e) {
		            e.printStackTrace();
		        }
		    
	        }
		        public static void testSearch() {

		  		  try {
		  	            StudentBean bean = new StudentBean();
		  	            List list = new ArrayList();
		  	            bean.setFirstName("Ram");
		  	            bean.setId(2L);
		  	            list = model.search(bean, 0, 0);
		  	            if (list.size() < 0) {
		  	                System.out.println("Test Serach fail");
		  	            }
		  	            Iterator it = list.iterator();
		  	            while (it.hasNext()) {
		  	                bean = (StudentBean) it.next();
		  	                System.out.println(bean.getId());
		  	              	             
		  	                System.out.println(bean.getFirstName());
		  	                System.out.println(bean.getLastName());
		  	           //   System.out.println(bean.getCollegeName());
		  	                System.out.println(bean.getDob());
		  	                System.out.println(bean.getMobileNo());
		  	                System.out.println(bean.getEmail());
		  	              System.out.println(bean.getCollegeId());
		  				 
		  	            }

		  	        } catch (ApplicationException e) {
		  	            e.printStackTrace();
		  	        }

		  	  }

		  
		        
		        
		        
		        
		        public static void testUpdate() 
		        {

			        try {
			            //StudentBean bean =new StudentBean();
			           // SimpleDateFormat sdf = new SimpleDateFormat("MM-DD-yyy");
			            StudentModel model=new StudentModel();
			            StudentBean bean=model.findByPK(3L);
			            bean.setFirstName("Ram");
			            bean.setLastName("Solanki");
			           

			            model.update(bean);

			            StudentBean updatedbean = model.findByPK(1L);
			           
			            if (!"Sharma".equals(updatedbean.getLastName()))
			            
			            {
			                System.out.println("Test Update success");
			            }
			        } 
			        
			        catch (ApplicationException e)
			        {
			            e.printStackTrace();
			        }
			        catch (DuplicateRecordException e) 
			        {
			            e.printStackTrace();
			        }
			    }
}

		        
	        
		        
		        
		      /*  public static void testUpdate() {

			        try {
			            StudentBean bean = model.findByPK(29L);
			            bean.setCollegeName("holkar");
			            bean.setFirstName("Praveen");
			            bean.setLastName("Misra");
			           
			            model.update(bean);
			            
			            System.out.println("Test Update succ");
			            
			            StudentBean updateBean = model.findByPK(8l);
			           
			            if (!"krg".equals(updateBean.getCollegeName()))
			            {
			                System.out.println("Test Update fail");
			            }
			        } 
			        
			        catch (ApplicationException e) 
			        
			        {
			            e.printStackTrace();
			        } 
			        
			        catch (DuplicateRecordException e) {
			            e.printStackTrace();
			        }

			    }
}
*/
		        
		        
		        
		        
		        

	    

	
	


