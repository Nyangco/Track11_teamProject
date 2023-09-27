package dto;

public class QnaDto {
	private String qna_no,reg_id,reg_date,title,content,
	update_date,reply,reply_date,name;
	
	public QnaDto() {
		super();
	}

	public QnaDto(String qna_no, String reg_id, String reg_date, String title, String content, String update_date,
			String reply, String reply_date, String name) {
		super();
		this.qna_no = qna_no;
		this.reg_id = reg_id;
		this.reg_date = reg_date;
		this.title = title;
		this.content = content;
		this.update_date = update_date;
		this.reply = reply;
		this.reply_date = reply_date;
		this.name = name;
	}

	public String getQna_no() {
		return qna_no;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
