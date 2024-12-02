package pr.ticket.universe.model.users.dto;

import java.util.Date;

public class UsersDTO {
	private String user_id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String role;
	private Date created_date;
	private Date modifided_date;
	private String status;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getModifided_date() {
		return modifided_date;
	}
	public void setModifided_date(Date modifided_date) {
		this.modifided_date = modifided_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "UsersDTO [user_id=" + user_id + ", password=" + password + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", role=" + role + ", created_date=" + created_date + ", modifided_date="
				+ modifided_date + ", status=" + status + "]";
	}
	
}
