package pr.ticket.universe.model.categorydetail.dto;

public class CategoryDetailDTO {
	private String ct_detail_id;
	private String detail_name;
	private String category_id;

	public String getCt_detail_id() {
		return ct_detail_id;
	}

	public void setCt_detail_id(String ct_detail_id) {
		this.ct_detail_id = ct_detail_id;
	}

	public String getDetail_name() {
		return detail_name;
	}

	public void setDetail_name(String detail_name) {
		this.detail_name = detail_name;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	@Override
	public String toString() {
		return "CategoryDetailDTO [ct_detail_id=" + ct_detail_id + ", detail_name=" + detail_name + ", category_id="
				+ category_id + "]";
	}
	
	

}
