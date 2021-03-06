package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.mchange.v1.lang.GentleThread;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.exception.RecordNotFoundException;
import in.co.rays.proj4.util.EmailBuilder;
import in.co.rays.proj4.util.EmailMessage;
import in.co.rays.proj4.util.EmailUtility;
import in.co.rays.proj4.util.JDBCDataSource;

/**
 * JDBC Implementation of Student Model
 *
 * @author Arvind
 * @version 1.0
 * 
 */
public class StudentModel {

	private static Logger log=Logger.getLogger(StudentModel.class);
	
	 /**
     * Find next PK of Student
     *
     * @throws DatabaseException
     */
	public Integer nextPK()throws DatabaseException
	{
		log.debug("Model nextPK started");
		Connection conn=null;
		int pk=0;
		
		try {
			conn=JDBCDataSource.getConnection();
			PreparedStatement pstmt=conn.prepareStatement("SELECT MAX(ID) FROM STUDENT");
			
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()){
				pk=rs.getInt(1);
			}
			rs.close();
		} 
		catch (Exception e) 
		{
			 log.error("Database Exception..", e);
	            
			 throw new DatabaseException("Exception : Exception in getting PK");
	        } 
		finally
		
		{
	            JDBCDataSource.closeConnection(conn);
	       }
	        
		log.debug("Model nextPK End");
	        return pk + 1;
	    
		}
	
	
	  /**
     * Add a Student
     *
     * @param bean : Search Parameters
     * @throws ApplicationException DuplicateRecordException
     *
     */
	public long add(StudentBean bean) throws ApplicationException,DuplicateRecordException
	{
		log.debug("Model add started");
		Connection conn=null;
		
		CollegeModel cModel= new CollegeModel();
		CollegeBean collegeBean=cModel.findByPK(bean.getCollegeId());
		bean.setCollegeName(collegeBean.getName());
		
		StudentBean duplicateName=findByEmailId(bean.getEmail());
		 int pk = 0;

	        if (duplicateName != null) {
	            throw new DuplicateRecordException("Email already exists");
	        }

	        try {
	            conn = JDBCDataSource.getConnection();
	            pk = nextPK();
	            
	            System.out.println(pk + " in ModelJDBC");
	            conn.setAutoCommit(false); 
	            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO STUDENT VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
	            
	            pstmt.setInt(1, pk);
	            pstmt.setLong(2, bean.getCollegeId());
	            pstmt.setString(3, bean.getCollegeName());
	            pstmt.setString(4, bean.getFirstName());
	            pstmt.setString(5, bean.getLastName());
	            pstmt.setDate(6, new java.sql.Date(bean.getDob().getTime()));
	          //  pstmt.setDate(6, (Date) bean.getDob());
	            pstmt.setString(7, bean.getMobileNo());
	            pstmt.setString(8, bean.getEmail());
	            pstmt.setString(9, bean.getCreatedBy());
	            pstmt.setString(10, bean.getModifiedBy());
	            pstmt.setTimestamp(11, bean.getCreatedDatetime());
	            pstmt.setTimestamp(12, bean.getModifiedDatetime());
	            pstmt.executeUpdate();
	            conn.commit(); 
	            pstmt.close();
	            
	        } catch (Exception e) {
	        	e.printStackTrace();
	            log.error("Database Exception..", e);
	            try {
	                conn.rollback();
	            } 
	            catch (Exception ex)
	            {
	                throw new ApplicationException("Exception : add rollback exception " + ex.getMessage());
	            }
	            throw new ApplicationException("Exception : Exception in add Student");
	        } finally
	        {
	            JDBCDataSource.closeConnection(conn);
	        }
	        log.debug("Model add End");
	        return pk;
	    
	}
	
	   /**
     * Delete a Student
     *
     * @param bean
     * @throws ApplicationException
     */
	
	public void delete(StudentBean bean)throws ApplicationException {
		
		log.debug("Model Delete started");
		Connection conn=null;
		
		 try {
	            conn = JDBCDataSource.getConnection();
	            conn.setAutoCommit(false); 
	            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM STUDENT WHERE ID=?");
	            pstmt.setLong(1, bean.getId());
	            pstmt.executeUpdate();
	            conn.commit(); 
	            pstmt.close();

	        } catch (Exception e)
		 {
	            log.error("Database Exception..", e);
	            try
	            {
	                conn.rollback();
	            } 
	            catch (Exception ex)
	            {
	                throw new ApplicationException("Exception : Delete rollback exception "+ ex.getMessage());
	            }
	            throw new ApplicationException("Exception : Exception in delete Student");
	        } 
		 finally
		 {
	            JDBCDataSource.closeConnection(conn);
	        }
	        log.debug("Model delete Started");
	    }


	
	 /**
     * Find User by Student
     *
     * @param Email: get parameter
     * @return bean
     * @throws ApplicationException
     */
	
	
 public StudentBean findByEmailId(String Email)throws ApplicationException
 {
	 log.debug("Model findBy Email Started");
     StringBuffer sql = new StringBuffer("SELECT * FROM STUDENT WHERE EMAIL=?");
     StudentBean bean = null;
     Connection conn = null;
     try 
     {
         conn = JDBCDataSource.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
         pstmt.setString(1, Email);
         ResultSet rs = pstmt.executeQuery();
        
         while (rs.next()) 
         {
             bean = new StudentBean();
             bean.setId(rs.getLong(1));
             bean.setCollegeId(rs.getLong(2));
             bean.setCollegeName(rs.getString(3));
             bean.setFirstName(rs.getString(4));
             bean.setLastName(rs.getString(5));
            /* bean.setDob(rs.getDate(6));*/
            bean.setDob(rs.getDate(6));
             bean.setMobileNo(rs.getString(7));
             bean.setEmail(rs.getString(8));
             bean.setCreatedBy(rs.getString(9));
             bean.setModifiedBy(rs.getString(10));
             bean.setCreatedDatetime(rs.getTimestamp(11));
             bean.setModifiedDatetime(rs.getTimestamp(12));

         }
         rs.close();
     }
     catch (Exception e)
     {
    	 e.printStackTrace();
         log.error("Database Exception..", e);
         throw new ApplicationException("Exception : Exception in getting Student by Email");
     }
     finally
     {
         JDBCDataSource.closeConnection(conn);
     }
     log.debug("Model findBy Email End");
     return bean;
 }
 

 /**
  * Find Student by PK
  *
  * @param pk : get parameter
  * @return bean
  * @throws ApplicationException
  */

 
 
 public StudentBean findByPK(long pk) throws ApplicationException
 {
     log.debug("Model findByPK Started");
     StringBuffer sql = new StringBuffer("SELECT * FROM STUDENT WHERE ID=?");
     StudentBean bean = null;
     
     Connection conn = null;
     try
     {
         conn = JDBCDataSource.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql.toString());
         pstmt.setLong(1, pk);
         ResultSet rs = pstmt.executeQuery();
         while (rs.next())
         {
             bean = new StudentBean();
             bean.setId(rs.getLong(1));
             bean.setCollegeId(rs.getLong(2));
             bean.setCollegeName(rs.getString(3));
             bean.setFirstName(rs.getString(4));
             bean.setLastName(rs.getString(5));
            /* bean.setDob(rs.getDate(6));*/
            bean.setDob(rs.getDate(6));
             bean.setMobileNo(rs.getString(7));
             bean.setEmail(rs.getString(8));
             bean.setCreatedBy(rs.getString(9));
             bean.setModifiedBy(rs.getString(10));
             bean.setCreatedDatetime(rs.getTimestamp(11));
             bean.setModifiedDatetime(rs.getTimestamp(12));
         }
         rs.close();
     } catch (Exception e) 
     {
    	 e.printStackTrace();
         log.error("Database Exception..", e);
         throw new ApplicationException("Exception : Exception in getting User by pk");
     } finally 
     {
         JDBCDataSource.closeConnection(conn);
     }
     log.debug("Model findByPK End");
     return bean;
 }
 


 /**
  * Update a Student
  *
  * @param bean
  * @throws ApplicationException DuplicateRecordException
  */

public void update(StudentBean bean)throws ApplicationException,DuplicateRecordException
{
	 log.debug("Model update Started");
     Connection conn = null;

    /* StudentBean beanExist = findByPK(bean.getId());

     
     if (beanExist != null && beanExist.getId() != bean.getId())
     {
         throw new DuplicateRecordException("Email Id is already exist");
     }
*/
     
     StudentBean duplicateName=findByEmailId(bean.getEmail());
	 //int pk = 0;
     
     //Check if updated Roll no already exist

        if(duplicateName != null && duplicateName.getId() != bean.getId()) {
            throw new DuplicateRecordException("Email already exists");
        }
     
     
     
     //get college Name
     CollegeModel cModel = new CollegeModel();
     CollegeBean collegeBean = cModel.findByPK(bean.getCollegeId());
     bean.setCollegeName(collegeBean.getName());

     try {

         conn = JDBCDataSource.getConnection();

         conn.setAutoCommit(false); 
         PreparedStatement pstmt = conn.prepareStatement("UPDATE STUDENT SET COLLEGE_ID=?,COLLEGE_NAME=?,FIRST_NAME=?,LAST_NAME=?,DATE_OF_BIRTH=?,MOBILE_NO=?,EMAIL=?,CREATED_BY=?,MODIFIED_BY=?,CREATED_DATETIME=?,MODIFIED_DATETIME=? WHERE ID=?");
        
        
         pstmt.setLong(1, bean.getCollegeId()); 
         pstmt.setString(2, bean.getCollegeName());
         pstmt.setString(3, bean.getFirstName());
         pstmt.setString(4, bean.getLastName());
         pstmt.setDate(5, new java.sql.Date(bean.getDob().getTime()));
        // pstmt.setDate(5, (Date) bean.getDob());
         pstmt.setString(6, bean.getMobileNo());
         pstmt.setString(7, bean.getEmail());
         pstmt.setString(8, bean.getCreatedBy());
         pstmt.setString(9, bean.getModifiedBy());
         pstmt.setTimestamp(10, bean.getCreatedDatetime());
         pstmt.setTimestamp(11, bean.getModifiedDatetime());
         pstmt.setLong(12, bean.getId());
         
         pstmt.executeUpdate();
         conn.commit(); 
         pstmt.close();
    
     } catch (Exception e)
     {
         log.error("Database Exception..", e);
         try {
             conn.rollback();
         }
         catch (Exception ex) 
         {
             throw new ApplicationException("Exception : Delete rollback exception "+ ex.getMessage());
         }
         throw new ApplicationException("Exception in updating Student ");
     } 
     finally
     {
         JDBCDataSource.closeConnection(conn);
     }
     log.debug("Model update End");
 }



/**
 * Search Student
 *
 * @param bean
 *            : Search Parameters
 * @throws ApplicationException
 */

public List search(StudentBean bean) throws ApplicationException
{
    return search(bean, 0, 0);
}


/**
 * Search Student with pagination
 *
 * @return list : List of Students
 * @param bean
 *            : Search Parameters
 * @param pageNo
 *            : Current Page No.
 * @param pageSize
 *            : Size of Page
 *
 * @throws ApplicationException
 */

public List search(StudentBean bean, int pageNo, int pageSize)throws ApplicationException
{
    log.debug("Model search Started");
    StringBuffer sql = new StringBuffer("SELECT * FROM STUDENT WHERE 1=1");
    System.out.println(bean.getCollegeId()+"----------college Id"+pageNo+"pageNo"+pageSize+"pageSize-------------------------");
    if (bean != null)
    {
        if (bean.getId() > 0) 
        {
            sql.append(" AND id = " + bean.getId());
        }
        
        
        if (bean.getCollegeId() > 0) 
        {
            sql.append(" AND COLLEGE_ID = " + bean.getCollegeId());
        }
        
        
        if (bean.getCollegeName() != null&& bean.getCollegeName().length() > 0)
        {
            sql.append(" AND COLLEGE_NAME = " + bean.getCollegeName());
        }
        
        if (bean.getFirstName() != null && bean.getFirstName().trim().length() > 0)
        {
            sql.append(" AND FIRST_NAME like '" + bean.getFirstName()+ "%'");
        }
        
        if (bean.getLastName() != null && bean.getLastName().length() > 0)
        {
            sql.append(" AND LAST_NAME like '" + bean.getLastName() + "%'");
        }
        
        if (bean.getDob() != null && bean.getDob().getDate() > 0) 
        {
            sql.append(" AND DOB = " + bean.getDob());
        }
        
        if (bean.getMobileNo() != null && bean.getMobileNo().length() > 0) 
        {
            sql.append(" AND MOBILE_NO like '" + bean.getMobileNo() + "%'");
        }
        
        if (bean.getEmail() != null && bean.getEmail().trim().length() > 0) 
        {
            sql.append(" AND EMAIL like '" + bean.getEmail() + "%'");
        }
       

    }

    
    if (pageSize > 0)
	    {  
	        pageNo = (pageNo - 1) * pageSize;
	        sql.append(" Limit " + pageNo + ", " + pageSize);
	     }
    System.out.println(sql+"  query");
    ArrayList list = new ArrayList();
    Connection conn = null;
    try 
    {
        conn = JDBCDataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ResultSet rs = pstmt.executeQuery();
        while (rs.next())
        	
        {
            bean = new StudentBean();
            bean.setId(rs.getLong(1));
            bean.setCollegeId(rs.getLong(2));
            bean.setCollegeName(rs.getString(3));
            bean.setFirstName(rs.getString(4));
            bean.setLastName(rs.getString(5));
           
            bean.setDob(rs.getDate(6));
           bean.setDob(rs.getDate(6));
            bean.setMobileNo(rs.getString(7));
            bean.setEmail(rs.getString(8));
            bean.setCreatedBy(rs.getString(9));
            bean.setModifiedBy(rs.getString(10));
            bean.setCreatedDatetime(rs.getTimestamp(11));
            bean.setModifiedDatetime(rs.getTimestamp(12));
            System.out.println("Inside list search while"+ bean.getCollegeName());
            list.add(bean);
            
        }
        System.out.println("Inside List search"+ list);
        rs.close();
    } 
    catch (Exception e)
    {	
    	e.printStackTrace();
        log.error("Database Exception..", e);
        throw new ApplicationException("Exception : Exception in search Student");
    } 
    finally 
    {
        JDBCDataSource.closeConnection(conn);
    }

    log.debug("Model search End");
    return list;
	/*
	
	Connection conn =  null;
	List<StudentBean>list = new ArrayList<StudentBean>();
	try{
		conn = JDBCDataSource.getConnection();
		StringBuffer sql = new StringBuffer("SELECT * FROM STUDENT WHERE 1=1");
		
		if(bean!=null){
		if(bean.getId()!=0){
			sql.append(" and ID = "+bean.getId()); 
		}
		if(bean.getCollegeId()!=0){
			sql.append(" and COLLEGE_ID = "+bean.getCollegeId());
		}
		if(bean.getCollegeName()!=null  && bean.getCollegeName().trim().length()>0  ){
			sql.append(" and COLLEGE_NAME  like '"+bean.getCollegeName()+"%' ");
		}
		if(bean.getFirstName()!=null  && bean.getFirstName().trim().length()>0  ){
			sql.append(" and FIRST_NAME like '"+bean.getFirstName()+"%' ");
		}
		if(bean.getLastName()!=null  && bean.getLastName().trim().length()>0  ){
			sql.append(" and LAST_NAME like '"+bean.getLastName()+"%' ");
		}
		if(bean.getDob()!=null){
			sql.append(" and DATE_OF_BIRTH like '"+bean.getDob()+"%' ");
		}//check
		if(bean.getMobileNo()!=null  && bean.getMobileNo().trim().length()>0  ){
			sql.append(" and MOBILE_NO like '"+bean.getMobileNo()+"%' ");
		}
		if(bean.getEmail()!=null  && bean.getEmail().trim().length()>0  ){
			sql.append(" and EMAIL like '"+bean.getEmail()+"%' ");
		}
		if(bean.getCreatedBy()!=null){
			sql.append(" and CREATED_BY like '"+bean.getCreatedBy()+"%' ");
		}
		if(bean.getModifiedBy()!=null){
			sql.append(" and MODIFIED_BY like '"+bean.getModifiedBy()+"%' ");
		}
		if(bean.getCreatedDatetime()!=null){
			sql.append(" and CREATED_DATETIME like '"+bean.getCreatedDatetime()+"%' ");
		}
		if(bean.getModifiedDatetime()!=null){
			sql.append(" and MODIFIED_DATETIME like '"+bean.getModifiedBy()+"%' ");
		}
		}
		if(pageSize>0){
			pageNo=(pageNo-1)*pageSize;
			sql.append(" LIMIT "+ pageNo+" , "+pageSize);
		}
		PreparedStatement ps;
		ResultSet rs;
		
			ps = conn.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			
			while(rs.next()){
				bean.setId(rs.getLong(1));
	bean.setCollegeId(rs.getLong(2));
	bean.setCollegeName(rs.getString(3));
	bean.setFirstName(rs.getString(4));
	bean.setLastName(rs.getString(5));
	bean.setDob(rs.getDate(6));
	bean.setMobileNo(rs.getString(7));
	bean.setEmail(rs.getString(8));
	bean.setCreatedBy(rs.getString(9));
	bean.setModifiedBy(rs.getString(10));
	bean.setCreatedDatetime(rs.getTimestamp(11));
	bean.setModifiedDatetime(rs.getTimestamp(12));
			}
			ps.close();
			rs.close();
		} catch (Exception e) {
			log.error("database exception ..",e);
			e.printStackTrace();
		throw new ApplicationException("Application Exception in search in Student Model");
		}
		finally{
			JDBCDataSource.closeConnection(conn);
		}
	log.debug("model search end");
		return list;
*/
}


/**
 * Get List of Student
 *
 * @return list : List of Student
 * @throws ApplicationException
 */

public List list()throws ApplicationException
{
	return list(0,0);
}

/**
 * Get List of Student with pagination
 *
 * @return list : List of Student
 * @param pageNo
 *            : Current Page No.
 * @param pageSize
 *            : Size of Page
 * @throws ApplicationException
 */

public List list(int pageNo,int pageSize)throws ApplicationException
{
 log.debug("Model List Started");
 ArrayList list =new ArrayList();
 StringBuffer sql=new StringBuffer("SELECT * FROM STUDENT");
 
 if(pageSize>0)
 {
	 pageNo=(pageNo-1)*pageSize;
	 sql.append(" limit " + pageNo + "," + pageSize);
 }

Connection conn=null;


try {
    conn = JDBCDataSource.getConnection();
    PreparedStatement pstmt = conn.prepareStatement(sql.toString());
    ResultSet rs = pstmt.executeQuery();
    
    while (rs.next()) 
    {
        StudentBean bean = new StudentBean();
        bean.setId(rs.getLong(1));
        bean.setCollegeId(rs.getLong(2));
        bean.setCollegeName(rs.getString(3));
        bean.setFirstName(rs.getString(4));
        bean.setLastName(rs.getString(5));
        /*bean.setDob(rs.getDate(6));*/
      bean.setDob(rs.getDate(6));
        bean.setMobileNo(rs.getString(7));
        bean.setEmail(rs.getString(8));
        bean.setCreatedBy(rs.getString(9));
        bean.setModifiedBy(rs.getString(10));
        bean.setCreatedDatetime(rs.getTimestamp(11));
        bean.setModifiedDatetime(rs.getTimestamp(12));
        list.add(bean);
    }
    rs.close();
} 
catch (Exception e) 
{
    log.error("Database Exception..", e);
    throw new ApplicationException("Exception : Exception in getting list of Student");
} 
finally
{
    JDBCDataSource.closeConnection(conn);
}

log.debug("Model list End");
return list;

}
}
