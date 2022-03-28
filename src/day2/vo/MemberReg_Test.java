package day2.vo;

public class MemberReg_Test {
	String name;
	String password;
	String email;
	String age;
	String addr;
	String gender;
	String hobby;
	public MemberReg_Test(String name, String password, String email, String age, String addr, String gender, String hobby) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
		this.age = age;
		this.addr = addr;
		this.gender = gender;
		this.hobby = hobby;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
}
