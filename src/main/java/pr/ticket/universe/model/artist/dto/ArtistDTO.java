package pr.ticket.universe.model.artist.dto;

import java.util.Date;

public class ArtistDTO {
	private String artist_id;
	private String artist_name;
	private Date created_date;
	private Date modifided_date;
	private int artist_order;
	private String thumb;
	private String max_id;
	private String likeArtist;
	private String likeCheck;

	
	
	
	public String getLikeArtist() {
		return likeArtist;
	}

	public void setLikeArtist(String likeArtist) {
		this.likeArtist = likeArtist;
	}

	public String getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(String likeCheck) {
		this.likeCheck = likeCheck;
	}

	public String getMax_id() {
		return max_id;
	}

	public void setMax_id(String max_id) {
		this.max_id = max_id;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(String artist_id) {
		this.artist_id = artist_id;
	}

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
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

	public int getArtist_order() {
		return artist_order;
	}

	public void setArtist_order(int artist_order) {
		this.artist_order = artist_order;
	}

}
