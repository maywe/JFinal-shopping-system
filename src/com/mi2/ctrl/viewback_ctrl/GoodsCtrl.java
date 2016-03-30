package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.kit.JsonKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 其他商品管理
 *
 * @author ChenMW 2016-03-21 22:09
 */
@RouteBind(path="/goodsCtrl")
@Before(LoginBackInterceptor.class)
public class GoodsCtrl extends BaseViewBackController{

    @Override
    public void showRequest() {
        this.commonRequest();
        //商品基本信息
        Goods goods = this.getModel(Goods.class);
        this.setAttr("goods",Goods.dao.findById(goods.getGoodsId()));
        //商品的颜色图片列表
        GoodsColor goodsColor = new GoodsColor();
        goodsColor.setGoodsId(goods.getGoodsId());
        this.setAttr("privateGoodsColorList",GoodsColor.dao.getAllData(goodsColor));
        //商品适配的机型
        GoodsAdapterPhone goodsAdapterPhone = new GoodsAdapterPhone();
        goodsAdapterPhone.setGoodsId(goods.getGoodsId());
        this.setAttr("privateGoodAdapterPhoneList",GoodsAdapterPhone.dao.getAllData(goodsAdapterPhone));
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.commonRequest();
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsDialog.jsp");
    }

    @Override
    public Boolean addData() {
        //1、拿到上传的文件列表/商品信息
        List<UploadFile> uploadFileList = getFiles(UPLOAD_IMAGES_OTHER_PATH);
        Goods goods = getModel(Goods.class);
        //2、解析上传的文件，获取上传的颜色的图片信息
        List<Record> goodsColorList = getGoodsColorList(goods,uploadFileList);
        //3、保存商品信息
        goods.save();
        //4、批量商品颜色图片信息
        for(int i=0,size=goodsColorList.size();i<size;i++){
            goodsColorList.get(i).set("GOODS_ID",goods.getGoodsId());
        }
        if(goodsColorList.size()>0){
            Db.batchSave(GoodsColor.TABLE_NAME,goodsColorList,goodsColorList.size());
        }
        //5、保存商品适配的手机类型
        String phoneSmallTypeIds = this.getPara("phone_small_type_ids");
        if(StrKit.notBlank(phoneSmallTypeIds)){
            new GoodsAdapterPhone().batchSave(goods.getGoodsId(),phoneSmallTypeIds);
        }
        this.renderJson(new ErrorVo(0,"新增商品成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        this.commonRequest();
        //商品基本信息
        Goods goods = this.getModel(Goods.class);
        this.setAttr("goods",Goods.dao.findById(goods.getGoodsId()));
        //商品的颜色图片列表
        GoodsColor goodsColor = new GoodsColor();
        goodsColor.setGoodsId(goods.getGoodsId());
        this.setAttr("privateGoodsColorList",GoodsColor.dao.getAllData(goodsColor));
        //商品适配的机型
        GoodsAdapterPhone goodsAdapterPhone = new GoodsAdapterPhone();
        goodsAdapterPhone.setGoodsId(goods.getGoodsId());
        this.setAttr("privateGoodAdapterPhoneList",GoodsAdapterPhone.dao.getAllData(goodsAdapterPhone));
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        //1、保存商品信息
        Goods goods = getModel(Goods.class);
        goods.update();
        //2、保存商品适配的手机类型
        String phoneSmallTypeIds = this.getPara("phone_small_type_ids");
        if(StrKit.notBlank(phoneSmallTypeIds)){
            new GoodsAdapterPhone().batchUpdate(goods.getGoodsId(),phoneSmallTypeIds);
        }
        this.renderJson(new ErrorVo(0,"修改商品成功!"));
        return true;
    }

    public Boolean updateFilesData(){
        //1、拿到上传的文件列表/商品信息
        List<UploadFile> uploadFileList = getFiles(UPLOAD_IMAGES_OTHER_PATH);
        Goods goods = getModel(Goods.class);
        //2、解析上传的文件，获取上传的颜色的图片信息
        List<Record> goodsColorList = getGoodsColorList(goods,uploadFileList);
        //3、修改商品信息
        goods.update();
        //4、批量修改商品颜色图片信息
        for(int i=0,size=goodsColorList.size();i<size;i++){
            goodsColorList.get(i).set("GOODS_ID",goods.getGoodsId());
        }
        if(goodsColorList.size()>0){
            new GoodsColor().batchUpdateGoodsColor(goodsColorList,false);
        }
        //5、批量修改商品适配的手机类型
        String phoneSmallTypeIds = this.getPara("phone_small_type_ids");
        if(StrKit.notBlank(phoneSmallTypeIds)){
            new GoodsAdapterPhone().batchUpdate(goods.getGoodsId(),phoneSmallTypeIds);
        }
        this.renderJson(new ErrorVo(0,"修改商品成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        Goods goods = this.getModel(Goods.class);
        boolean isDelete = new Goods().deletePhoneGoods(goods);
        this.renderJson(new ErrorVo(0,"删除商品成功!"));
        return isDelete;
    }

    @Override
    public void getDataByPage() {
        Goods goods = getModel(Goods.class);
        goods.put("goods_big_type_id",this.getPara("goods_big_type_id"));
        this.setAttr("goods",goods);

        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getNotPhoneAllData(null));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getNotPhoneAllData(null));

        Page pageUtil = Goods.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),goods);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsList.jsp");
    }

    public void getLookupDataByPage() {
        Goods goods = getModel(Goods.class);
        goods.put("goods_big_type_id",this.getPara("goods_big_type_id"));
        goods.put("phone_small_type_id",this.getPara("phone_small_type_id"));
        this.setAttr("goods",goods);

        //只查出手机配件信息
        GoodsBigType goodsBigType = new GoodsBigType();
        goodsBigType.setGoodsBigTypeId(BigDecimal.valueOf(2));
        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getNotPhoneAllData(goodsBigType));
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(2));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getNotPhoneAllData(goodsSmallType));

        //查出手机类型信息
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("phoneSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));

        Page pageUtil = Goods.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),goods);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsLookupBackListDialog.jsp");
    }

    @Override
    public void getAllData() {

    }

    /**
     * 批量上传时，解析上传文件获取商品图片信息列表
     */
    private List<Record> getGoodsColorList(Goods goods, List<UploadFile> uploadFileList){
        List<Record> goodsColorList = new ArrayList<>();
        for(UploadFile f: uploadFileList){
            String parameterName = f.getParameterName();
            String imageUrl = UPLOAD_PATH + UPLOAD_IMAGES_OTHER_PATH + "/" + f.getFileName();
            //手机预览图
            if("goods_preview_image".equals(parameterName)){
                //对象的引用传递
                goods.setGoodsPreviewImage(imageUrl);
            }else{
                //商品颜色图片
                GoodsColor gc = new GoodsColor();
                Record gcRecord = new Record();
                gc.setGoodsAddributeValId(BigDecimal.valueOf(Long.valueOf(parameterName.replace("goods_color_img_url",""))));
                gc.setGoodsColorImgUrl(imageUrl);

                gcRecord.setColumns(gc);
                goodsColorList.add(gcRecord);
            }
        }
        return goodsColorList;
    }

    public void commonRequest(){
        //商品类别
        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getNotPhoneAllData(null));
        List<GoodsSmallType> goodsSmallTypeList = GoodsSmallType.dao.getNotPhoneAllData(null);
        this.setAttr("goodsSmallTypeList", goodsSmallTypeList);
        this.setAttr("goodsSmallTypeListJson", JsonKit.toJson(goodsSmallTypeList));
        //商品颜色
        GoodsAddributeVal goodsAddributeVal = new GoodsAddributeVal();
        goodsAddributeVal.setGoodsAddributeId(BigDecimal.valueOf(1));
        this.setAttr("goodsColorList", GoodsAddributeVal.dao.getAllData(goodsAddributeVal));
        //手机类别
        GoodsSmallType phoneSmallType = new GoodsSmallType();
        phoneSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("phoneSmallTypeList", GoodsSmallType.dao.getAllData(phoneSmallType));
    }
}
