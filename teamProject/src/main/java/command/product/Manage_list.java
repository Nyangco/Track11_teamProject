package command.product;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import common.CommonExecute;
import common.CommonUtil;
import dao.ProductDao;
import dto.ModelDto;

public class Manage_list implements CommonExecute {

	@Override
	public void execute(Model model, ModelDto mdto, HttpSession session) {
		// TODO Auto-generated method stub
		ProductDao dao = new ProductDao();
		String select = mdto.getT_select();
		model.addAttribute("select",select);
		String search = mdto.getT_search();
		if(select==null) {
			select="product_no";
			search="";
		}
		model.addAttribute("search",search);
		
		int total_count = dao.totalCountDB(select,search);
		model.addAttribute("t_totalCount", total_count);
		int list_setup_count = 5;  //한페이지당 출력 행수 
		int pageNumber_count = 3;  //한페이지당 출력 페이지 갯수
		
		String nowPage = mdto.getT_nowPage();
		model.addAttribute("t_nowPage",nowPage);
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = total_count / list_setup_count;  // 몫 : 2
		int rest = 	total_count % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		model.addAttribute("t_order", total_count - (current_page -1) * list_setup_count);		
		
		model.addAttribute("t_paging", CommonUtil.pageListPost(current_page, total_page, pageNumber_count));
		
		model.addAttribute("arr", dao.listDB(select,search,start,end));

		int k = total_count - (current_page -1) * list_setup_count;
		model.addAttribute("t_order", k);
	}

}
