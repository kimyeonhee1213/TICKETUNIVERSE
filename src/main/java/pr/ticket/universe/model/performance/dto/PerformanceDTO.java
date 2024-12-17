package pr.ticket.universe.model.performance.dto;

import java.util.Date;

public class PerformanceDTO {
	private int pf_order;
	private String pf_id;
	private String artist_id;
	private String category_id;
	private String pf_date;
	private String pf_name;
	private String pf_price;
	private String pf_time;
	private String pf_status;
	private String pf_place;
	private Date created_date;
	private Date modifided_date;
	private String thumb;
	private String ticket_date;
	
	
	
	public String getPf_place() {
		return pf_place;
	}

	public void setPf_place(String pf_place) {
		this.pf_place = pf_place;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}

	public int getPf_order() {
		return pf_order;
	}

	public void setPf_order(int pf_order) {
		this.pf_order = pf_order;
	}

	public String getPf_id() {
		return pf_id;
	}

	public void setPf_id(String pf_id) {
		this.pf_id = pf_id;
	}

	public String getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getPf_date() {
		return pf_date;
	}

	public void setPf_date(String pf_date) {
		this.pf_date = pf_date;
	}

	public String getPf_name() {
		return pf_name;
	}

	public void setPf_name(String pf_name) {
		this.pf_name = pf_name;
	}

	public String getPf_price() {
		return pf_price;
	}

	public void setPf_price(String pf_price) {
		this.pf_price = pf_price;
	}

	public String getPf_time() {
		return pf_time;
	}

	public void setPf_time(String pf_time) {
		this.pf_time = pf_time;
	}

	public String getPf_status() {
		return pf_status;
	}

	public void setPf_status(String pf_status) {
		this.pf_status = pf_status;
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

	@Override
	public String toString() {
		return "PerformanceDTO [pf_order=" + pf_order + ", pf_id=" + pf_id + ", artist_id=" + artist_id
				+ ", category_id=" + category_id + ", pf_date=" + pf_date + ", pf_name=" + pf_name + ", pf_price="
				+ pf_price + ", pf_time=" + pf_time + ", pf_status=" + pf_status + ", pf_place=" + pf_place
				+ ", created_date=" + created_date + ", modifided_date=" + modifided_date + ", thumb=" + thumb
				+ ", ticket_date=" + ticket_date + "]";
	}
	
	

}
