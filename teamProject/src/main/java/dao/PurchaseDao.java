package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import common.CommonTemplate;
import common.CommonUtil;
import dto.BasketDto;
import dto.DetailDto;
import dto.ModelDto;
import dto.ProductDto;
import dto.PurchaseDto;

public class PurchaseDao {

	JdbcTemplate template = CommonTemplate.getTemplate();
	
	public int changeStatus(String purchase_no, String status) {
		int k = 0;
		String sql = "update pjt_shop_purchase set status="+status+" where purchase_no='"+purchase_no+"'";
		try {
			k = template.update(sql);
		}catch(DataAccessException e) {
			System.out.println("changeStatus:"+sql);
			e.printStackTrace();
		}
		return k;
	}
	
	public int totalCountDB(String select, String search) {
		int k = 0;
		String sql = "select count(*) from pjt_shop_purchase where "+select+" like '%"+search+"%'";
		try {
			k = template.queryForInt(sql);
		}catch(DataAccessException e) {
			System.out.println("totalCountDB:"+sql);
			e.printStackTrace();
		}
		return k;
	}
	
	public String shop_name(String shop) {
		String result = null;
		String sql = "select shop_name from pjt_shop_shop where shop_no='"+shop+"'";
		try {
			result = template.queryForObject(sql, String.class);
		}catch(DataAccessException e) {
			System.out.println("shop_name:"+sql);
			e.printStackTrace();
		}
		return result;
	}
	
	public DetailDto purchase_detail(ModelDto mdto){
		String purchase_no = mdto.getT_purchase_no();
		DetailDto dto = new DetailDto();
		String sql = "select purchase_no, receiver_name, receiver_contact, receiver_addr1, receiver_addr2, receiver_addr3, "
				+ "delivery_memo, pay_method, cash_receipt, status from pjt_shop_purchase where purchase_no='"+purchase_no+"'";
		try {
			RowMapper<DetailDto> rowmap = new BeanPropertyRowMapper<DetailDto>(DetailDto.class);
			dto = template.queryForObject(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("purchase_detail:"+sql);
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<DetailDto> purchase_detail(String purchase_no){
		ArrayList<DetailDto> arr = new ArrayList<DetailDto>();
		String sql = "select pr.product_no, pr.name product_name, pr.price*d.count product_total, "
					+ "d.count product_count, pu.status from pjt_shop_product pr, pjt_shop_purchase pu, pjt_shop_purchase_detail d "
					+ "where pr.product_no=d.product_no and pu.purchase_no=d.purchase_no and pu.purchase_no='"+purchase_no+"'";
		try {
			RowMapper<DetailDto> rowmap = new BeanPropertyRowMapper<DetailDto>(DetailDto.class);
			arr = (ArrayList<DetailDto>)template.query(sql, rowmap);
		}catch(DataAccessException e) {
			System.out.println("purchase_detail:"+sql);
			e.printStackTrace();
		}
		return arr;
	}
	
	public ArrayList<DetailDto> purchase_list(String select, String search, int start, int end){
		ArrayList<DetailDto> arr = new ArrayList<DetailDto>();
		String sql1 = "select * from (select rownum rnum, tbl.* from (select purchase_no, "
					+ "status from pjt_shop_purchase where "+select+" like '%"+search+"%' order by purchase_no desc) tbl) "
					+ "where rnum>="+start+" and rnum<="+end;
		String sql2 = null;
		String sql3 = null;
		try {
			RowMapper<DetailDto> rowmap = new BeanPropertyRowMapper<DetailDto>(DetailDto.class);
			arr = (ArrayList<DetailDto>)template.query(sql1, rowmap);
			for(int k=0; k<arr.size(); k++) {
				String purchase_no = arr.get(k).getPurchase_no();
				sql2 = "select pr.name product_name from pjt_shop_purchase_detail d, pjt_shop_purchase pu, "
						+ "pjt_shop_product pr where d.product_no=pr.product_no and d.purchase_no=pu.purchase_no "
						+ "and d.purchase_no='"+purchase_no+"'";
				ArrayList<DetailDto> tmp = (ArrayList<DetailDto>)template.query(sql2, rowmap);
				if(tmp.size()>1) {
					arr.get(k).setProduct_name(tmp.get(0).getProduct_name()+" 외 "+tmp.size()+" 건");
				}else if(tmp.size()==1) {
					arr.get(k).setProduct_name(tmp.get(0).getProduct_name());
				}
				sql3 = "select sum(pr.price) from pjt_shop_purchase_detail d, pjt_shop_purchase pu, "
						+ "pjt_shop_product pr where d.product_no=pr.product_no and d.purchase_no=pu.purchase_no and "
						+ "d.purchase_no='"+purchase_no+"' group by pu.purchase_no";
				int temp = template.queryForInt(sql3)+2500;
				DecimalFormat df = new DecimalFormat("￦###,###");
				arr.get(k).setPurchase_total(df.format(temp));
			}
		}catch(DataAccessException e) {
			System.out.println("purchase_list:");
			System.out.println(sql1);
			System.out.println(sql2);
			System.out.println(sql3);
			e.printStackTrace();
		}
		return arr;
	}
	
	public ArrayList<DetailDto> purchase_list(String id, String select, String search, int start, int end){
		ArrayList<DetailDto> arr = new ArrayList<DetailDto>();
		String sql1 = "select * from (select rownum rnum, tbl.* from (select purchase_no, status from pjt_shop_purchase "
					+ "where "+select+" like '%"+search+"%' and buyer_id='"+id+"' order by purchase_no desc) tbl) "
					+ "where rnum>="+start+" and rnum<="+end;
		String sql2 = null;
		String sql3 = null;
		try {
			RowMapper<DetailDto> rowmap = new BeanPropertyRowMapper<DetailDto>(DetailDto.class);
			arr = (ArrayList<DetailDto>)template.query(sql1, rowmap);
			for(int k=0; k<arr.size(); k++) {
				String purchase_no = arr.get(k).getPurchase_no();
				sql2 = "select pr.name product_name from pjt_shop_purchase_detail d, pjt_shop_purchase pu, "
						+ "pjt_shop_product pr where d.product_no=pr.product_no and d.purchase_no=pu.purchase_no "
						+ "and d.purchase_no='"+purchase_no+"'";
				ArrayList<DetailDto> tmp = (ArrayList<DetailDto>)template.query(sql2, rowmap);
				if(tmp.size()>1) {
					arr.get(k).setProduct_name(tmp.get(0).getProduct_name()+" 외 "+tmp.size()+" 건");
				}else if(tmp.size()==1) {
					arr.get(k).setProduct_name(tmp.get(0).getProduct_name());
				}
				sql3 = "select sum(pr.price) from pjt_shop_purchase_detail d, pjt_shop_purchase pu, "
						+ "pjt_shop_product pr where d.product_no=pr.product_no and d.purchase_no=pu.purchase_no and "
						+ "d.purchase_no='"+purchase_no+"' group by pu.purchase_no";
				int temp = template.queryForInt(sql3)+2500;
				DecimalFormat df = new DecimalFormat("￦###,###");
				arr.get(k).setPurchase_total(df.format(temp));
			}
		}catch(DataAccessException e) {
			System.out.println("purchase_list:");
			System.out.println(sql1);
			System.out.println(sql2);
			System.out.println(sql3);
			e.printStackTrace();
		}
		return arr;
	}
	
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
		int status = 0;
		if(mdto.getT_pay_method().equals("card")) status=1;
		
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
					+ "receiver_addr2, receiver_addr3, delivery_memo, pay_method, transfer_name, cash_receipt, merchant_uid,status) "
					+ "values('"+purchase_no+"','"+mdto.getT_id()+"','"+mdto.getT_receive_name()+"','"+tell+"','"
					+mdto.getT_addr1()+"','"+mdto.getT_addr2()+"','"+mdto.getT_addr3()+"','"+mdto.getT_receive_memo()+"','"
					+mdto.getT_pay_method()+"','"+mdto.getT_pay_name()+"','"+mdto.getT_cash_recipt_number()+"','"
					+mdto.getT_merchant_uid()+"',"+status+")";
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

	public ArrayList<ProductDto> shop_list(String select, String search,String shop){
		ArrayList<ProductDto> arr = new ArrayList<ProductDto>();
		String sql = "select product_no, to_char(price,'l999,999,999,999') price, name, "
				+ "to_char(reg_date,'yyyy-MM-dd') reg_date, images, sell_count from pjt_shop_product "
				+ "where "+select+" like '%"+search+"%' and shop='"+shop+"'";
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
