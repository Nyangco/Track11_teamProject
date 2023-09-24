package dao;

import java.util.ArrayList;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import dto.ModelDto;
import dto.ProductDto;

public class PurchaseDao {

	JdbcTemplate template = CommonTemplate.getTemplate();
	
	public ProductDto detail(ModelDto mdto) {
		ProductDto dto = null;
		String sql = "select images, product_no, name, to_char(price,'999,999,999,999l') price, "
					+ "to_char(reg_date,'yyyy-MM-dd') reg_date, sell_count from pjt_shop_product "
					+ "where product_no='"+mdto.getT_product_no()+"'";
		try {
			RowMapper<ProductDto> rowmapper = new BeanPropertyRowMapper<ProductDto>(ProductDto.class);
			dto = template.queryForObject(sql, rowmapper);
		}catch(DataAccessException e) {
			System.out.println("detail:"+sql);
			e.printStackTrace();
		}
		return dto;
	}

	public ArrayList<ProductDto> shop_list(String select, String search){
		ArrayList<ProductDto> arr = new ArrayList<ProductDto>();
		String sql = "select product_no, to_char(price,'999,999,999,999l') price, name, "
				+ "to_char(reg_date,'yyyy-MM-dd') reg_date, images, sell_count from pjt_shop_product "
				+ "where "+select+" like '%"+search+"%'";
		try {
			RowMapper<ProductDto> rowmapper = new BeanPropertyRowMapper<ProductDto>(ProductDto.class);
			arr = (ArrayList<ProductDto>)template.query(sql, rowmapper);
		}catch(DataAccessException e) {
			System.out.println("shop_list:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
}
