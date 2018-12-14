package com.metals.pojo;

import java.io.Serializable;
import java.util.Date;

public class WjUser implements Serializable {
    private Integer uid;

    private String uname;

    private String upwd;

    private String urealname;

    private String usex;

    private String uphone;

    private Long utype;

    private String uweixin;

    private String upic;

    private String ucompany;

    private Date uregistetime;

    private Date ulastdate;

    private String ulastloginip;

    private Integer ulogincount;
    
    private Double monetary;
    
    
    

    public Double getMonetary() {
		return monetary;
	}

	public void setMonetary(Double monetary) {
		this.monetary = monetary;
	}

	public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    public String getUrealname() {
        return urealname;
    }

    public void setUrealname(String urealname) {
        this.urealname = urealname == null ? null : urealname.trim();
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex == null ? null : usex.trim();
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone == null ? null : uphone.trim();
    }

    public Long getUtype() {
        return utype;
    }

    public void setUtype(Long utype) {
        this.utype = utype;
    }

    public String getUweixin() {
        return uweixin;
    }

    public void setUweixin(String uweixin) {
        this.uweixin = uweixin == null ? null : uweixin.trim();
    }

    public String getUpic() {
        return upic;
    }

    public void setUpic(String upic) {
        this.upic = upic == null ? null : upic.trim();
    }

    public String getUcompany() {
        return ucompany;
    }

    public void setUcompany(String ucompany) {
        this.ucompany = ucompany == null ? null : ucompany.trim();
    }

    public Date getUregistetime() {
        return uregistetime;
    }

    public void setUregistetime(Date uregistetime) {
        this.uregistetime = uregistetime;
    }

    public Date getUlastdate() {
        return ulastdate;
    }

    public void setUlastdate(Date ulastdate) {
        this.ulastdate = ulastdate;
    }

    public String getUlastloginip() {
        return ulastloginip;
    }

    public void setUlastloginip(String ulastloginip) {
        this.ulastloginip = ulastloginip == null ? null : ulastloginip.trim();
    }

    public Integer getUlogincount() {
        return ulogincount;
    }

    public void setUlogincount(Integer ulogincount) {
        this.ulogincount = ulogincount;
    }
}