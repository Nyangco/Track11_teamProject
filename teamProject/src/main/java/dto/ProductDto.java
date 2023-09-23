package dto;

public class ProductDto {
	private String product_no, price, name, origin_country, sell_country, reg_date, one_sentence, description, images, stock
					,sell_count;

	public ProductDto(String product_no, String price, String name, String origin_country, String sell_country,
			String reg_date, String one_sentence, String description, String images, String stock, String sell_count) {
		super();
		this.product_no = product_no;
		this.price = price;
		this.name = name;
		this.origin_country = origin_country;
		this.sell_country = sell_country;
		this.reg_date = reg_date;
		this.one_sentence = one_sentence;
		this.description = description;
		this.images = images;
		this.stock = stock;
		this.sell_count = sell_count;
	}

	public ProductDto() {
		super();
	}

	public String getProduct_no() {
		return product_no;
	}

	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrigin_country() {
		return origin_country;
	}

	public void setOrigin_country(String origin_country) {
		this.origin_country = origin_country;
	}

	public String getSell_country() {
		return sell_country;
	}

	public void setSell_country(String sell_country) {
		this.sell_country = sell_country;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getOne_sentence() {
		return one_sentence;
	}

	public void setOne_sentence(String one_sentence) {
		this.one_sentence = one_sentence;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getSell_count() {
		return sell_count;
	}

	public void setSell_count(String sell_count) {
		this.sell_count = sell_count;
	}
}
