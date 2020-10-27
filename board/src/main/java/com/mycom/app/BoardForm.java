package com.mycom.app;

import javax.validation.constraints.NotEmpty;

public class BoardForm {
	
	@NotEmpty(message="필수입력란 입니다")
	private String title;
	
	@NotEmpty(message="필수입력란 입니다")
	private String message;

	public BoardForm() {
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
			
	
}
