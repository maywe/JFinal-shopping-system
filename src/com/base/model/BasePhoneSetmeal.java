package com.base.model;

import com.jfinal.plugin.activerecord.IBean;

/**
 * MyGenerated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BasePhoneSetmeal<M extends BasePhoneSetmeal<M>> extends BaseModel<M> implements IBean {

	public final static String TABLE_NAME = "PHONE_SETMEAL";

	public final static String SQL = "SELECT * FROM PHONE_SETMEAL WHERE 1=1 ";

	public void setPhoneSetmealId(java.math.BigDecimal phoneSetmealId) {
		set("PHONE_SETMEAL_ID", phoneSetmealId);
	}

	public java.math.BigDecimal getPhoneSetmealId() {
		return get("PHONE_SETMEAL_ID");
	}

	public void setGoodsSmallTypeId(java.math.BigDecimal goodsSmallTypeId) {
		set("GOODS_SMALL_TYPE_ID", goodsSmallTypeId);
	}

	public java.math.BigDecimal getGoodsSmallTypeId() {
		return get("GOODS_SMALL_TYPE_ID");
	}

	public void setPhoneSetmealName(java.lang.String phoneSetmealName) {
		set("PHONE_SETMEAL_NAME", phoneSetmealName);
	}

	public java.lang.String getPhoneSetmealName() {
		return get("PHONE_SETMEAL_NAME");
	}

	public void setSetmealGoodsNum(java.math.BigDecimal setmealGoodsNum) {
		set("SETMEAL_GOODS_NUM", setmealGoodsNum);
	}

	public java.math.BigDecimal getSetmealGoodsNum() {
		return get("SETMEAL_GOODS_NUM");
	}

	public void setSetmealPrice(java.math.BigDecimal setmealPrice) {
		set("SETMEAL_PRICE", setmealPrice);
	}

	public java.math.BigDecimal getSetmealPrice() {
		return get("SETMEAL_PRICE");
	}

	public void setSaveMoney(java.math.BigDecimal saveMoney) {
		set("SAVE_MONEY", saveMoney);
	}

	public java.math.BigDecimal getSaveMoney() {
		return get("SAVE_MONEY");
	}

	public void setSetmealPreviewImage(java.lang.String setmealPreviewImage) {
		set("SETMEAL_PREVIEW_IMAGE", setmealPreviewImage);
	}

	public java.lang.String getSetmealPreviewImage() {
		return get("SETMEAL_PREVIEW_IMAGE");
	}

}
