package command.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonUtil;
import dao.ProductDao;
import dto.ProductDto;

public class DBmanage_create {

	public void execute(Model model, HttpServletRequest request) {
		try {
			ProductDao dao = new ProductDao();
			MultipartRequest mpr = new MultipartRequest(request, CommonUtil.getFile_dir(""), 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			String product_no = mpr.getParameter("t_product_no");
			String price = mpr.getParameter("t_price");
			String name = mpr.getParameter("t_name");
			String origin_country = mpr.getParameter("t_origin_country");
			String sell_country = mpr.getParameter("t_sell_country");
			String one_sentence = mpr.getParameter("t_one_sentence");
			String description = mpr.getParameter("t_description");
			String stock = mpr.getParameter("t_stock");
			
			String images = mpr.getFilesystemName("t_images");
			
			ProductDto dto = new ProductDto(product_no, price, name, origin_country, sell_country, null, one_sentence, description, images, stock, null, null);
			
			int k = dao.insertDB(dto);
			
			String msg = "상품 등록에 실패했습니다";
			String url = "manage_create";
			if(k==1) {
				msg = "상품 등록에 성공했습니다";
				url = "manage_list";
			}
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
