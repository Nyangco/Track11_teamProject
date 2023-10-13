package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
import common.CommonUtil;
import dto.FaqDto;
import dto.ModelDto;

public class FaqDao {
	
	JdbcTemplate temp = CommonTemplate.getTemplate();
	
	public int FaqSave(ModelDto mdto, HttpSession session) {
		DecimalFormat df = new DecimalFormat("F0000");
		int k = 0;
		String sql = "select nvl(max(faq_no),'F0000') from pjt_shop_faq";
		
		String query= null;
		try {
			String i = (String)temp.queryForObject(sql, String.class);
			i = df.format(Integer.parseInt(i.substring(1))+1);
			query="insert into pjt_shop_faq\r\n" + 
					"(faq_no,question,answer,reg_id)\r\n" + 
					"values\r\n" + 
					"('"+i+"','"+mdto.getT_question()+"','"+mdto.getT_answer()+"','"+mdto.getT_reg_id()+"')";
			k = temp.update(query);
		}catch(DataAccessException d){
			System.out.println("FaqSave:"+query);
			d.printStackTrace();
		}
		return k;
	}

	public ArrayList<FaqDto> getFaqList(String select, String search) {
		ArrayList<FaqDto> dtos = new ArrayList<FaqDto>();
		String query ="select f.faq_no,f.question,f.answer,\r\n" + 
				"to_char(to_date(f.reg_date),'yyyy-mm-dd') reg_date,\r\n" + 
				"m.name,f.reg_id\r\n" + 
				"from pjt_shop_faq f, pjt_shop_member m\r\n" + 
				"where f.reg_id = m.id\r\n" + 
				"and "+select+" like '%"+search+"%'\r\n" + 
				"order by reg_date desc";
		try{
			RowMapper<FaqDto> rowmapper = 
					new BeanPropertyRowMapper<FaqDto>(FaqDto.class);
			dtos = (ArrayList<FaqDto>)temp.query(query, rowmapper);
		}catch(DataAccessException e){
			System.out.println("getFaqList:"+query);
			e.printStackTrace();
		}
		return dtos;
	}

	public Object detail(ModelDto mdto) {
		FaqDto dto = null;
		String sql = "select f.faq_no,f.question,f.answer,\r\n" + 
				"to_char(to_date(f.reg_date),'yyyy-mm-dd') reg_date,\r\n" + 
				"m.name,f.reg_id\r\n" + 
				"from pjt_shop_faq f, pjt_shop_member m\r\n" + 
				"where f.reg_id = m.id\r\n" + 
				"and f.faq_no = '"+mdto.getT_faq_no()+"'\r\n" + 
				"order by reg_date desc";
		try {
			RowMapper<FaqDto> rowmapper = new BeanPropertyRowMapper<FaqDto>(FaqDto.class);
			dto = temp.queryForObject(sql, rowmapper);
		}catch(DataAccessException e) {
			System.out.println("detail:"+sql);
			e.printStackTrace();
		}
		return dto;
	}

	public int faq_update(ModelDto mdto) {
		int k = 0;
		String sql = "update pjt_shop_faq \r\n" + 
				"set question = '"+mdto.getT_question()+"',\r\n" + 
				"    answer = '"+mdto.getT_answer()+"'\r\n" + 
				"where faq_no = '"+mdto.getT_faq_no()+"'";
		try {
				k = temp.update(sql);
		}catch(DataAccessException e) {
			System.out.println("faq_update:"+sql);
			e.printStackTrace();
		}		
		return k;
	}

	public int qna_delete(ModelDto mdto) {
		int k = 0;
		String sql = "delete pjt_shop_faq\r\n" + 
				"where faq_no ='"+mdto.getT_faq_no()+"'";
		System.out.println(sql);
		try {
				k = temp.update(sql);
		}catch(DataAccessException e) {
			System.out.println("qna_delete:"+sql);
			e.printStackTrace();
		}		
		return k;
	}

}
