package com;

public class reply {
	private int id;
	private int flag;
	private String replyname;
	private String bereplyname;
	private String address;
	private String osname;
	private String browse;
	private String content;
	private String time;
	
	public reply(int id,int flag,String replyname,String bereplyname,String address,String osname,String browse,String content,String time ) {
		this.id=id;
		this.flag=flag;
		this.address=address;
		this.bereplyname=bereplyname;
		this.browse=browse;
		this.content=content;
		this.osname=osname;
		this.replyname=replyname;
		this.time=time;
	}
	public reply() {
		
	}
	public void setid(Object object) {
		this.id=(int) object;
	}
	public void setflag(Object object) {
		this.flag=(int) object;
	}
	public void setreplyname(Object object) {
		this.replyname=(String) object;
	}
	public void setbereplyname(Object object) {
		this.bereplyname=(String) object;
	}
	public void setaddress(Object object) {
		this.address=(String) object;
	}
	public void setosname(Object object) {
		this.osname=(String) object;
	}
	public void setbrowse(Object object) {
		this.browse=(String) object;
	}
	public void setcontent(Object object) {
		this.content=(String) object;
	}
	public void settime(Object object) {
		this.time=(String) object;
	}
	
	
	
	
	
	
	
	public String tostring() {
		System.out.println(id+"  "+flag+"  "+replyname+"¡¡"+bereplyname+"  "+content+"  "+time);
		return id+"  "+flag+"  "+replyname+"¡¡"+bereplyname+"  "+content+"  "+time;
	}
}
