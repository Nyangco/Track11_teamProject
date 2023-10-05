package command.product;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import dao.ProductDao;
import dto.ModelDto;
import dto.StatisticsDto;

public class Statistics_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		ProductDao dao = new ProductDao();
		DecimalFormat df = new DecimalFormat("###,###");
		ArrayList<String> arr_1 = dao.getTC_TS();
		ArrayList<StatisticsDto> arr_2 = dao.getPC();
		ArrayList<StatisticsDto> arr_3 = dao.getCC();
		String t_count = arr_1.get(0);
		t_count = df.format(Integer.parseInt(t_count));
		model.addAttribute("t_t_count", t_count);
		String t_sell = arr_1.get(1);
		t_sell = df.format(Integer.parseInt(t_sell));
		model.addAttribute("t_t_sell", t_sell);
		
		String p_count_label = "\"";
		String p_count_value = "";
		for(int k=0; k<arr_2.size(); k++) {
			p_count_label+=(arr_2.get(k).getProduct_no()+"\",\"");
			p_count_value+=(arr_2.get(k).getCount()+", ");
		}for(int k=arr_2.size();k<5;k++) {
			p_count_label+="\",\"";
			p_count_value+=", ";
		}
		p_count_label = p_count_label.substring(0,p_count_label.length()-2);
		p_count_value = p_count_value.substring(0,p_count_value.length()-2);
		model.addAttribute("t_p_count_label", p_count_label);
		model.addAttribute("t_p_count_value", p_count_value);
		
		String c_cell_label = "\"";
		String c_cell_value = "";
		for(int k=0; k<arr_3.size(); k++) {
			c_cell_label+=(arr_3.get(k).getId()+"\",\"");
			c_cell_value+=(arr_3.get(k).getPrice()+", ");
		}for(int k=arr_3.size();k<5;k++) {
			c_cell_label+="\",\"";
			c_cell_value+=", ";
		}
		c_cell_label = c_cell_label.substring(0,c_cell_label.length()-2);
		c_cell_value = c_cell_value.substring(0,c_cell_value.length()-2);
		model.addAttribute("t_c_cell_label", c_cell_label);
		model.addAttribute("t_c_cell_value", c_cell_value);
	}

}
