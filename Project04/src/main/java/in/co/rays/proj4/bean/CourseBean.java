package in.co.rays.proj4.bean;


/**
 * course JavaBean encapsulates course attributes
 * @author Arvind
 * @version 1.0
 */
public class CourseBean extends BaseBean{

	/**
	 * name of course
	 */
	private String courseName;
	private Long courseId;
	
	/**
	 * name of description
	 */
	private String description;
	
	/**
	 * name of duration
	 */
	private String duration;
	
	
	/**
	 * accessor
	 */
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Long getCourseId() {
		return courseId;
	}
	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getKey() {
		// TODO Auto-generated method stub
		return id+"";
	}
	public String getValue() {
		// TODO Auto-generated method stub
		return courseName;
	}
	
	
}
