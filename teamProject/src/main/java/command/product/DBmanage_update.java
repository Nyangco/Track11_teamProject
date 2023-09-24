package command.product;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonUtil;
import dao.ProductDao;
import dto.ProductDto;

public class DBmanage_update {

	public void execute(Model model, HttpServletRequest request) {
		try {
			ProductDao dao = new ProductDao();
			MultipartRequest mpr = new MultipartRequest(request, CommonUtil.getFile_dir(""), 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			String ori_images = mpr.getParameter("t_ori_images");
			String product_no = mpr.getParameter("t_product_no");
			String price = mpr.getParameter("t_price");
			String name = mpr.getParameter("t_name");
			String origin_country = mpr.getParameter("t_origin_country");
			String sell_country = mpr.getParameter("t_sell_country");
			String one_sentence = mpr.getParameter("t_one_sentence");
			String description = mpr.getParameter("t_description");
			String stock = mpr.getParameter("t_stock");
			String status = mpr.getParameter("t_status");
			
			String ori_img = mpr.getFilesystemName("t_images");
			String images = null; 
			if(ori_img!=null) {
				UUID uuid = UUID.randomUUID();
				images = uuid+"_"+ori_img;
				
				File img = new File(CommonUtil.getFile_dir(ori_img));
				if(img.exists()) {
					File new_img = new File(CommonUtil.getFile_dir(images));
					img.renameTo(new_img);
				}
			}
			
			if(ori_img==null) images=ori_images;
			
			ProductDto dto = new ProductDto(product_no, price, name, origin_country, sell_country, null, one_sentence, description, images, stock, null, status);
			
			int k = dao.updateDB(dto);
			
			if(ori_images!=null) {
				File file = new File(CommonUtil.getFile_dir(ori_images));
				if(file.exists()) {
					file.delete();
				}
			}
			
			String msg = "상품 수정에 실패했습니다";
			String url = "manage_update";
			if(k==1) {
				msg = "상품 수정에 성공했습니다";
				url = "manage_list";
			}
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			model.addAttribute("t_product_no",product_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
