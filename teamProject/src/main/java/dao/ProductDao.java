package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.ModelDto;
import dto.ProductDto;

public class ProductDao {
	
	JdbcTemplate template = CommonTemplate.getTemplate();
	
	public int updateDB(ProductDto dto) {
		int k = 0;
		String price = dto.getPrice().replaceAll("￦", "").replaceAll(",", "").trim();
		String sql = "update pjt_shop_product set price="+price+", name='"+dto.getName()+"', "
					+ "origin_country='"+dto.getOrigin_country()+"', sell_country='"+dto.getSell_country()+"', "
					+ "one_sentence='"+dto.getOne_sentence()+"', description='"+dto.getDescription()+"', "
					+ "images='"+dto.getImages()+"', stock="+dto.getStock()+", status="+dto.getStatus()+" where product_no='"
					+dto.getProduct_no()+"'";
		try {
			k = template.update(sql);
		}catch(DataAccessException e) {
			System.out.println("update:"+sql);
			e.printStackTrace();
		}
		return k;
	}
	
	public ProductDto detail(ModelDto mdto) {
		ProductDto dto = null;
		String sql = "select product_no, to_char(price,'999,999,999,999l') price, name, origin_country,sell_country, "
					+ "to_char(reg_date,'yyyy-MM-dd') reg_date, one_sentence, description, images, stock, sell_count, "
					+ "status from pjt_shop_product where product_no='"+mdto.getT_product_no()+"'";
		try {
			RowMapper<ProductDto> rowmapper = new BeanPropertyRowMapper<ProductDto>(ProductDto.class);
			dto = template.queryForObject(sql, rowmapper);
		}catch(DataAccessException e) {
			System.out.println("detail:"+sql);
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<ProductDto> listDB(ModelDto dto){
		ArrayList<ProductDto> arr = new ArrayList<ProductDto>();
		String select = dto.getT_select();
		String search = dto.getT_search();
		if(select==null) {
			select = "product_no";
			search = "";
		}
		String sql = "select product_no, name, to_char(price,'999,999,999,999l') price, "
					+ "to_char(reg_date,'yyyy-MM-dd') reg_date, status from pjt_shop_product "
					+ "where "+select+" like '%"+search+"%' order by product_no";
		try {
			RowMapper<ProductDto> rowmap = new BeanPropertyRowMapper<ProductDto>(ProductDto.class);
			arr = (ArrayList<ProductDto>)template.query(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("listDB:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
	
	public String getProduct_no() {
		String result = null;
		String sql = "select nvl(max(product_no),'P0000') from pjt_shop_product";
		DecimalFormat df = new DecimalFormat("P0000");
		try {
			result = template.queryForObject(sql, String.class).substring(1);
			result = df.format((Integer.parseInt(result)+1));
		}catch(DataAccessException e) {
			System.out.println("getProduct_no:"+sql);
			e.printStackTrace();
		}
		return result;
	}

	public int insertDB(ProductDto dto) {
		int k = 0;
		String sql = "insert into pjt_shop_product (product_no, price, name, origin_country, sell_country, one_sentence, "
					+ "description, images, stock) values('"+dto.getProduct_no()+"',"+dto.getPrice()+",'"+dto.getName()
					+"','"+dto.getOrigin_country()+"','"+dto.getSell_country()+"','"+dto.getOne_sentence()+"','"
					+dto.getDescription()+"','"+dto.getImages()+"',"+dto.getStock()+")";
		try {
			k = template.update(sql);
		}catch(DataAccessException e) {
			System.out.println("product_insertDB:"+sql);
		}
		return k;
	}
}
