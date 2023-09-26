package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import common.CommonTemplate;
import common.CommonUtil;
import dto.BasketDto;
import dto.ModelDto;
import dto.ProductDto;
import dto.PurchaseDto;

public class PurchaseDao {

	JdbcTemplate template = CommonTemplate.getTemplate();
	
	public int updateBasket(String id, String[] cnt, String[] pn) {
		int result = 0;
		int len = cnt.length;
		String sql = null;
		try {
			for(int k=0; k<len; k++) {
				sql = "update pjt_shop_basket set count="+cnt[k]+" where id='"+id+"' and product_no='"+pn[k]+"'";
				template.execute(sql);
			}
		}catch(DataAccessException e) {
			System.out.println("updateBasket:"+sql);
			e.printStackTrace();
			result = 1;
		}
		return result;
	}
	
	public int count(String id) {
		int k = 0;
		String sql = "select count(*) from pjt_shop_basket";
		try {
			k = template.queryForInt(sql);
		}catch(DataAccessException e) {
			System.out.println("count:"+sql);
			e.printStackTrace();
		}
		return k;
	}
	
	public void addBasket(ModelDto mdto) {
		String sql = "insert into pjt_shop_basket (id,product_no,count) values('"+mdto.getT_id()+"','"+mdto.getT_product_no()+"',"+mdto.getT_count()+")";
		try {
			template.execute(sql);
		}catch(DataAccessException e) {
			System.out.println("addBasket:"+sql);
			e.printStackTrace();
		}
	}
	
	public ArrayList<BasketDto> basket(String id){
		ArrayList<BasketDto> arr = new ArrayList<BasketDto>();
		String sql = "select b.product_no, b.count, p.name, p.price, to_char(p.price,'l999,999,999,999') cprice, "
					+ "to_char(p.price*b.count,'l999,999,999,999') total, p.stock from pjt_shop_basket b, "
					+ "pjt_shop_product p where b.product_no = p.product_no and id='"+id+"' order by product_no";
		try {
			RowMapper<BasketDto> rowmap = new BeanPropertyRowMapper<BasketDto>(BasketDto.class);
			arr = (ArrayList<BasketDto>)template.query(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("basket:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
	
	public String purchaseSave(ModelDto mdto, String[] pn, String[] cnt, String bd) {
		String result = null;
		String today = CommonUtil.getToday();
		String tell = mdto.getT_receive_tel1()+"-"+mdto.getT_receive_tel2()+"-"+mdto.getT_receive_tel3();
		today = today.substring(2,4)+today.substring(5,7)+today.substring(8)+"_";
		
		String sql1 = "select nvl(max(purchase_no),'"+today+"0000') from pjt_shop_purchase where purchase_no like '%"+today+"%'";
		String sql2 = null;
		String sql3 = null;
		String sql4 = null;
		String sql5 = null;
		DecimalFormat df = new DecimalFormat("0000");
		try {
			String purchase_no = template.queryForObject(sql1, String.class);
			int k = Integer.parseInt(purchase_no.substring(7))+1;
			purchase_no = today+df.format(k);
			sql2 = "insert into pjt_shop_purchase (purchase_no, buyer_id, receiver_name, receiver_contact, receiver_addr1, "
					+ "receiver_addr2, receiver_addr3, delivery_memo, pay_method, transfer_name, cash_receipt, card_number, "
					+ "card_cvc) values('"+purchase_no+"','"+mdto.getT_id()+"','"+mdto.getT_receive_name()+"','"+tell+"','"
					+mdto.getT_addr1()+"','"+mdto.getT_addr2()+"','"+mdto.getT_addr3()+"','"+mdto.getT_receive_memo()+"','"
					+mdto.getT_pay_method()+"','"+mdto.getT_pay_name()+"','"+mdto.getT_cash_recipt_number()+"','','')";
			k = template.update(sql2);
			if(k==1) {
				for(int i=0; i<pn.length; i++) {
					sql3 = "insert into pjt_shop_purchase_detail (purchase_no, product_no, count) values('"
							+purchase_no+"','"+pn[i]+"',"+cnt[i]+")";
					sql4 = "update pjt_shop_product set stock=stock-"+cnt[i]+", sell_count=sell_count+"+cnt[i]+",status=case when stock=0 then 0 else 1 end where product_no='"+pn[i]+"'";
					k = template.update(sql3);
					template.execute(sql4);
					if(bd.equals("basket")) {
						sql5 = "delete from pjt_shop_basket where id='"+mdto.getT_id()+"'";
						template.execute(sql5);
					}
				}
				result = purchase_no;
			}
		}catch(DataAccessException e) {
			System.out.println("purchaseSave:");
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<PurchaseDto> purchase(ModelDto mdto) {
		ArrayList<PurchaseDto> arr = new ArrayList<PurchaseDto>();
		String sql = "select p.product_no, p.images, p.name, p.price "
					+ "from pjt_shop_product p where p.product_no='"+mdto.getT_product_no()+"'";
		try {
			RowMapper<PurchaseDto> rowmap = new BeanPropertyRowMapper<PurchaseDto>(PurchaseDto.class);
			PurchaseDto dto = template.queryForObject(sql, rowmap);
			dto.setCount(mdto.getT_count());
			arr.add(dto);
		}catch(DataAccessException e) {
			System.out.println("purchase:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
	
	public ArrayList<PurchaseDto> purchase(String id) {
		ArrayList<PurchaseDto> arr = new ArrayList<PurchaseDto>();
		String sql = "select p.product_no, p.images, p.name, p.price, b.count "
					+ "from pjt_shop_product p, pjt_shop_basket b where p.product_no=b.product_no and b.id='"+id+"'";
		try {
			RowMapper<PurchaseDto> rowmap = new BeanPropertyRowMapper<PurchaseDto>(PurchaseDto.class);
			arr = (ArrayList<PurchaseDto>)template.query(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("purchase:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
	
	public ProductDto detail(ModelDto mdto) {
		ProductDto dto = null;
		String sql = "select product_no, to_char(price,'l999,999,999,999') price, name, origin_country, sell_country, "
					+ "to_char(reg_date,'yyyy-MM-dd') reg_date, one_sentence, description, images, stock, "
					+ "sell_count from pjt_shop_product "
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
		String sql = "select product_no, to_char(price,'l999,999,999,999') price, name, "
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
