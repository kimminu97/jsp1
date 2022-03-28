package day2.vo;

public class Member {
	private String custNo;
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private int city;
	
	public Member(String custNo, String custname, String phone, String address, String joindate, String grade, int city) {
		super();
		this.custNo = custNo;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.grade = grade;
		this.city = city;
	}

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public String getCustNo() {
		return custNo;
	}

	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}
	
	
	
}
