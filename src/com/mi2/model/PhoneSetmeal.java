package com.mi2.model;

import com.base.model.BasePhoneSetmeal;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;

import java.util.ArrayList;
import java.util.List;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class PhoneSetmeal extends BasePhoneSetmeal<PhoneSetmeal> {
	public static final PhoneSetmeal dao = new PhoneSetmeal();

	@Override
	public Page<PhoneSetmeal> getAllDataByPage(int pageNumber, int pageSize, PhoneSetmeal t) {
		StringBuilder sbSql = new StringBuilder();
		sbSql.append("from goods_small_type gst,phone_setmeal ps where gst.goods_big_type_id=1 and gst.goods_small_type_id=ps.goods_small_type_id");
		ArrayList<Object> values = new ArrayList<>();
		if(t!=null&&!t.getAttrs().isEmpty()){
			if(t.getGoodsSmallTypeId()!=null){
				sbSql.append(" and ps.goods_small_type_id=?");
				values.add(t.getGoodsSmallTypeId());
			}
			if(StrKit.notBlank(t.getPhoneSetmealName())){
				sbSql.append(" and ps.phone_setmeal_name like ?");
				values.add("%"+t.getPhoneSetmealName()+"%");
			}
		}
		return this.paginate(pageNumber,pageSize,"select gst.goods_small_type_name,ps.* ",sbSql.toString(),values.toArray());
	}

	@Override
	public List<PhoneSetmeal> getAllData(PhoneSetmeal t) {
		StringBuilder sbSql = new StringBuilder();
		sbSql.append("select gst.goods_small_type_name,ps.* from goods_small_type gst,phone_setmeal ps where gst.goods_big_type_id=1 and gst.goods_small_type_id=ps.goods_small_type_id");
		ArrayList<Object> values = new ArrayList<>();
		if(t!=null&&!t.getAttrs().isEmpty()) {
			if (t.getGoodsSmallTypeId() != null) {
				sbSql.append(" and ps.goods_small_type_id=?");
				values.add(t.getGoodsSmallTypeId());
			}
			if(StrKit.notBlank(t.getPhoneSetmealName())){
				sbSql.append(" and ps.phone_setmeal_name = ?");
				values.add(t.getPhoneSetmealName());
			}
			if(t.get("isUse",false)){
				sbSql.append(" and exists(select psd.phone_setmeal_detail_id from phone_setmeal_detail psd where psd.phone_setmeal_id=ps.phone_setmeal_id)");
			}
		}
		sbSql.append(" order by ps.setmeal_price");
		return this.find(sbSql.toString(),values.toArray());
	}
}
