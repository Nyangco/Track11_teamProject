package dto;

public class FaqDto {
	private String faq_no,reg_date,question,answer,reg_id,name;

	public FaqDto() {
		super();
	}
	
	

	public FaqDto(String faq_no, String reg_date, String question, String answer, String reg_id, String name) {
		super();
		this.faq_no = faq_no;
		this.reg_date = reg_date;
		this.question = question;
		this.answer = answer;
		this.reg_id = reg_id;
		this.name = name;
	}



	public String getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(String faq_no) {
		this.faq_no = faq_no;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
