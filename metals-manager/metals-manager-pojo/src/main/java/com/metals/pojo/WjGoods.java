package com.metals.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class WjGoods implements Serializable {
    private String id;

    private Long cid;

    private String name;

    private Integer specid;

    private String gkeys;

    private String synopsis;

    private String image;

    private BigDecimal price;

    private Integer isvouch;

    private Integer clickn;

    private Integer reviewn;

    private Integer stockn;

    private Integer ordern;

    private Integer sellersn;

    private Integer sellingn;

    private Integer promotionn;

    private Integer number;

    private Integer status;

    private Integer gorder;

    private Date created;

    private Date updated;

    private String content;
    
    private String parentName;
    
    private String leafName;

    
    
    
    public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getLeafName() {
		return leafName;
	}

	public void setLeafName(String leafName) {
		this.leafName = leafName;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getSpecid() {
        return specid;
    }

    public void setSpecid(Integer specid) {
        this.specid = specid;
    }

    public String getGkeys() {
        return gkeys;
    }

    public void setGkeys(String gkeys) {
        this.gkeys = gkeys == null ? null : gkeys.trim();
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis == null ? null : synopsis.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getIsvouch() {
        return isvouch;
    }

    public void setIsvouch(Integer isvouch) {
        this.isvouch = isvouch;
    }

    public Integer getClickn() {
        return clickn;
    }

    public void setClickn(Integer clickn) {
        this.clickn = clickn;
    }

    public Integer getReviewn() {
        return reviewn;
    }

    public void setReviewn(Integer reviewn) {
        this.reviewn = reviewn;
    }

    public Integer getStockn() {
        return stockn;
    }

    public void setStockn(Integer stockn) {
        this.stockn = stockn;
    }

    public Integer getOrdern() {
        return ordern;
    }

    public void setOrdern(Integer ordern) {
        this.ordern = ordern;
    }

    public Integer getSellersn() {
        return sellersn;
    }

    public void setSellersn(Integer sellersn) {
        this.sellersn = sellersn;
    }

    public Integer getSellingn() {
        return sellingn;
    }

    public void setSellingn(Integer sellingn) {
        this.sellingn = sellingn;
    }

    public Integer getPromotionn() {
        return promotionn;
    }

    public void setPromotionn(Integer promotionn) {
        this.promotionn = promotionn;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getGorder() {
        return gorder;
    }

    public void setGorder(Integer gorder) {
        this.gorder = gorder;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}