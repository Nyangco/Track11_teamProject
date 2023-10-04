package dao;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import common.CommonTemplate;
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
					"(faq_no,question,answer)\r\n" + 
					"values\r\n" + 
					"('"+i+"','"+mdto.getT_question()+"','"+mdto.getT_answer()+"')";
			k = temp.update(query);
		}catch(DataAccessException d){
			System.out.println("FaqSave:"+query);
			d.printStackTrace();
		}
		return k;
	}

	public ArrayList<FaqDto> getFaqList(String select, String search) {
		ArrayList<FaqDto> dtos = new ArrayList<FaqDto>();
		String query ="select faq_no,question,\r\n" + 
				"to_char(to_date(reg_date),'yyyy-mm-dd') reg_date\r\n" + 
				"from pjt_shop_faq\r\n" + 
				"where "+select+" like '%"+search+"%'\r\n" + 
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
		String sql = "select question,answer,\r\n" + 
				"to_char(to_date(reg_date),'yyyy-mm-dd') reg_date\r\n" + 
				"from pjt_shop_faq\r\n" + 
				"where faq_no = '"+mdto.getT_faq_no()+"'\r\n" + 
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

}
