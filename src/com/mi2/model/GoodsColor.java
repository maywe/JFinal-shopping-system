package com.mi2.model;

import com.base.model.BaseGoodsColor;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class GoodsColor extends BaseGoodsColor<GoodsColor> {
	public static final GoodsColor dao = new GoodsColor();

	/**
	 * 删除手机商品颜色图片信息
	 * @param phoneGoodsId 手机商品id
     */
	public int deletePhoneGoodsColor(BigDecimal phoneGoodsId){
		String sql = "delete goods_color gc where gc.phone_goods_id=?";
		return Db.update(sql,phoneGoodsId);
	}

	/**
	 * 删除其他商品颜色图片信息
	 * @param goodsId 其他商品id
	 */
	public int deleteOtherGoodsColor(BigDecimal goodsId){
		String sql = "delete goods_color gc where gc.goods_id=?";
		return Db.update(sql,goodsId);
	}

	/**
	 * 批量更新商品图片信息
     */
	public void batchUpdateGoodsColor(List<Record> goodsColorList,boolean isPhoneGoodsColorUpdate){
		for(Record gcr : goodsColorList){
			GoodsColor goodsColor = new GoodsColor();
			goodsColor._setAttrs(gcr.getColumns());
			boolean isUpdate;
			if(isPhoneGoodsColorUpdate){
				isUpdate = this.updatePhoneGoodsColor(goodsColor);
			}else{
				isUpdate = this.updateOtherGoodsColor(goodsColor);
			}
			if(!isUpdate){
				this._setAttrs(goodsColor).save();
			}
		}
	}

	//更新手机商品颜色
	public boolean updatePhoneGoodsColor(GoodsColor goodsColor) {
		String sql = "update goods_color gc set gc.goods_color_img_url=? where gc.phone_goods_id=? and gc.goods_addribute_val_id=?";
		return Db.update(sql,goodsColor.getGoodsColorImgUrl(),goodsColor.getPhoneGoodsId(),goodsColor.getGoodsAddributeValId())>0;
	}
	//更新手机商品颜色信息
	public boolean updatePhoneGoodsColor(BigDecimal phoneGoodsId,String goodsAddributeValIds){
		String sql = "delete goods_color gc where gc.phone_goods_id=? and gc.goods_addribute_val_id not in("+goodsAddributeValIds+")";
		return Db.update(sql,phoneGoodsId)>0;
	}

	//更新其他商品颜色
	public boolean updateOtherGoodsColor(GoodsColor goodsColor) {
		String sql = "update goods_color gc set gc.goods_color_img_url=? where gc.goods_id=? and gc.goods_addribute_val_id=?";
		return Db.update(sql,goodsColor.getGoodsColorImgUrl(),goodsColor.getGoodsId(),goodsColor.getGoodsAddributeValId())>0;
	}
	//更新其他商品颜色
	public boolean updateOtherGoodsColor(BigDecimal goodsId,String goodsAddributeValIds){
		String sql = "delete goods_color gc where gc.goods_id=? and gc.goods_addribute_val_id not in("+goodsAddributeValIds+")";
		return Db.update(sql,goodsId)>0;
	}

	@Override
	public List<GoodsColor> getAllData(GoodsColor t) {
		StringBuilder sbSql = new StringBuilder();
		sbSql.append("select gc.*,gav.goods_addribute_id,gav.goods_addribute_val_name,gav.goods_color_code from goods_color gc,goods_addribute_val gav where gc.goods_addribute_val_id = gav.goods_addribute_val_id ");
		ArrayList<Object> values = new ArrayList<>();
		if(t!=null && !t.getAttrs().isEmpty()){
			if(t.getPhoneGoodsId()!=null){
				sbSql.append(" and gc.phone_goods_id=?");
				values.add(t.getPhoneGoodsId());
			}
			if(t.getGoodsId()!=null){
				sbSql.append(" and gc.goods_id=?");
				values.add(t.getGoodsId());
			}
		}
		sbSql.append(" order by gc.goods_color_id");
		return this.find(sbSql.toString(),values.toArray());
	}
}
