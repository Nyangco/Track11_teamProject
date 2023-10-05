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
import dto.StatisticsDto;

public class ProductDao {
	
	JdbcTemplate template = CommonTemplate.getTemplate();
	
	public ArrayList<StatisticsDto> getCC(String month){
		ArrayList<StatisticsDto> arr = new ArrayList<>();
		String sql4="select m.id, sum(pr.price*d.count) as price "
					+ "from pjt_shop_member m, pjt_shop_product pr, pjt_shop_purchase pu, pjt_shop_purchase_detail d "
					+ "where m.id=pu.buyer_id and pr.product_no=d.product_no and pu.purchase_no=d.purchase_no and "
					+ "pu.status='5' and to_char(to_date(substr(pu.purchase_no,1,6),'yyMMdd'),'yyyy-MM')='"+month+"' "
					+ "group by m.id";
		
		try {
			RowMapper<StatisticsDto> rowMapper = new BeanPropertyRowMapper<StatisticsDto>(StatisticsDto.class);
			arr = (ArrayList<StatisticsDto>)template.query(sql4, rowMapper);
		}catch(DataAccessException e) {
			System.out.println("getCC:"+sql4);
			e.printStackTrace();
		}return arr;
	}
	
	public ArrayList<StatisticsDto> getCC(){
		ArrayList<StatisticsDto> arr = new ArrayList<>();
		String sql4="select m.id, sum(pr.price*d.count) as price from pjt_shop_member m, pjt_shop_product pr, "
					+ "pjt_shop_purchase pu, pjt_shop_purchase_detail d where pu.status='5' and m.id=pu.buyer_id "
					+ "and pr.product_no=d.product_no and pu.purchase_no=d.purchase_no group by m.id";
		try {
			RowMapper<StatisticsDto> rowMapper = new BeanPropertyRowMapper<StatisticsDto>(StatisticsDto.class);
			arr = (ArrayList<StatisticsDto>)template.query(sql4, rowMapper);
		}catch(DataAccessException e) {
			System.out.println("getCC:"+sql4);
			e.printStackTrace();
		}return arr;
	}
	
	public ArrayList<StatisticsDto> getPC(String month){
		ArrayList<StatisticsDto> arr = new ArrayList<>();
		String sql3="select d.product_no, count(d.product_no) as count from pjt_shop_purchase_detail d, "
					+ "pjt_shop_purchase p where p.status='5' and d.purchase_no=p.purchase_no and "
					+ "to_char(to_date(substr(p.purchase_no,1,6),'yyMMdd'),'yyyy-MM')='"+month+"' group by d.product_no;";
		
		try {
			RowMapper<StatisticsDto> rowmap = new BeanPropertyRowMapper<StatisticsDto>(StatisticsDto.class);
			arr = (ArrayList<StatisticsDto>)template.query(sql3, rowmap);
		}catch(DataAccessException e) {
			System.out.println("getPC:"+sql3);
			e.printStackTrace();
		}return arr;
	}
	
	public ArrayList<StatisticsDto> getPC(){
		ArrayList<StatisticsDto> arr = new ArrayList<>();
		String sql3="select d.product_no, count(d.product_no) as count from pjt_shop_purchase_detail d, pjt_shop_purchase p "
					+ "where p.status='5' and d.purchase_no=p.purchase_no group by d.product_no";
		
		try {
			RowMapper<StatisticsDto> rowmap = new BeanPropertyRowMapper<StatisticsDto>(StatisticsDto.class);
			arr = (ArrayList<StatisticsDto>)template.query(sql3, rowmap);
		}catch(DataAccessException e) {
			System.out.println("getPC:"+sql3);
			e.printStackTrace();
		}return arr;
	}
	
	public ArrayList<String> getTC_TS(String month){
		ArrayList<String> arr = new ArrayList<>();
		String sql1="select count(*) as count from pjt_shop_purchase where status='5' and "
				+ "to_char(to_date(substr(purchase_no,1,6),'yyMMdd'),'yyyy-mm')='"+month+"'";
		String sql2="select sum(pr.price*d.count) as price from pjt_shop_purchase_detail d, "
				+ "pjt_shop_product pr, pjt_shop_purchase pu where d.product_no=pr.product_no "
				+ "and d.purchase_no=pu.purchase_no and pu.status='5' and "
				+ "to_char(to_date(substr(pu.purchase_no,1,6),'yyMMdd'),'yyyy-mm')='"+month+"'"; 
		try {
			arr.add(template.queryForObject(sql1, String.class));
			arr.add(template.queryForObject(sql2, String.class));
		}catch(DataAccessException e) {
			System.out.println("getTC_TS:\n sql1:"+sql1+"\n sql2:"+sql2);
			e.printStackTrace();
		}return arr;
	}
	
	public ArrayList<String> getTC_TS(){
		ArrayList<String> arr = new ArrayList<>();
		String sql1="select count(*) as count from pjt_shop_purchase where status='5'";
		String sql2="select sum(pr.price*d.count) as price from pjt_shop_purchase_detail d, "
				+ "pjt_shop_product pr, pjt_shop_purchase pu where d.product_no=pr.product_no "
				+ "and d.purchase_no=pu.purchase_no and pu.status='5'"; 
		
		try {
			arr.add(template.queryForObject(sql1, String.class));
			arr.add(template.queryForObject(sql2, String.class));
		}catch(DataAccessException e) {
			System.out.println("getTC_TS:\n sql1:"+sql1+"\n sql2:"+sql2);
			e.printStackTrace();
		}return arr;
	}
	
	public ArrayList<ProductDto> shop_list(){
		ArrayList<ProductDto> arr = new ArrayList<ProductDto>();
		String sql = "select shop from pjt_shop_shop";
		try {
			RowMapper<ProductDto> rowmap = new BeanPropertyRowMapper<ProductDto>(ProductDto.class);
			arr = (ArrayList<ProductDto>)template.query(sql,rowmap);
		}catch(DataAccessException e) {
			System.out.println("shop_list:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
	
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
		String sql = "select product_no, to_char(price,'l999,999,999,999') price, name, origin_country,sell_country, "
					+ "to_char(reg_date,'yyyy-MM-dd') reg_date, one_sentence, description, images, stock, sell_count, "
					+ "status, shop from pjt_shop_product where product_no='"+mdto.getT_product_no()+"'";
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
		String sql = "insert into pjt_shop_product (product_no, price, name, origin_country, sell_country, shop, one_sentence, "
					+ "description, images, stock) values('"+dto.getProduct_no()+"',"+dto.getPrice()+",'"+dto.getName()
					+"','"+dto.getOrigin_country()+"','"+dto.getSell_country()+"','"+dto.getReg_date()+"','"+dto.getOne_sentence()+"','"
					+dto.getDescription()+"','"+dto.getImages()+"',"+dto.getStock()+")";
		try {
			k = template.update(sql);
		}catch(DataAccessException e) {
			System.out.println("product_insertDB:"+sql);
		}
		return k;
	}
}
