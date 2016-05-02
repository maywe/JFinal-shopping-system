<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
    .base-info-statistics-box{
        padding: 15px 0;
    }
    .base-info-statistics-box .display-table-cell{
        height:170px;
    }
    .base-info-statistics-box .my-fonts{
        font-size: 96px;
    }
    .base-info-statistics-box .val{
        text-align: right;
        font-size: 24px;
        font-weight: bold;
    }

    .red-color{
        color: rgb(253,114,111);
    }
    .purple-color{
        color: rgb(182,162,222);
    }
    .frog-color{
        color: rgb(39,191,177);
    }

    .base-info-statistics-box .user-sum{
        border-top: 1px solid rgb(253,114,111);
        border-bottom: 1px solid rgb(253,114,111);
        margin: 0;
    }
    .base-info-statistics-box .goods-sum{
        border-top: 1px solid rgb(182,162,222);
        border-bottom: 1px solid rgb(182,162,222);
        margin: 0;
    }
    .base-info-statistics-box .order-turnover-sum{
        border-top: 1px solid rgb(39,191,177);
        border-bottom: 1px solid rgb(39,191,177);
        margin: 0;
    }

    .panel-info{
        border-color: rgb(91,192,222);
        margin-bottom: 0;
    }
    .panel-info .panel-heading{
        background: rgb(91,192,222);
        color: #ffffff;
    }
    .panel-info .panel-body{
        padding: 0;
    }
    .charts-info-statistics-box{
        margin-bottom: 15px;
    }
    .charts-info-statistics-box .panel-body{
        height: 256px;
    }
    .goods-out-stock-statistics-box .table th{
        background: rgb(235,235,235);
    }
    .goods-out-stock-statistics-box .table th,.goods-out-stock-statistics-box .table td{
        text-align: center;
    }
</style>
<div class="tab-pane animated fadeInDown my-tab-pane" id="homeBox">
    <div class="base-info-statistics-box">
        <div class="row">
            <div class="col-xs-4">
                <div class="row user-sum">
                    <div class="col-xs-6 display-table">
                        <div class="display-table-cell">
                            <i class="fa fa-users my-fonts red-color"></i>
                        </div>
                    </div>
                    <div class="col-xs-6 display-table">
                        <div class="display-table-cell">
                            <div class="title red-color">用户总数</div>
                            <div class="val red-color">${baseRecord.user_sum}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="row goods-sum">
                    <div class="col-xs-6 display-table">
                        <div class="display-table-cell">
                            <i class="fa fa-cubes my-fonts purple-color"></i>
                        </div>
                    </div>
                    <div class="col-xs-6 display-table">
                        <div class="display-table-cell">
                            <div class="title purple-color">库存总量</div>
                            <div class="val purple-color">${baseRecord.goods_sum_stock}</div>
                            <div class="title purple-color">销售总量</div>
                            <div class="val purple-color">${baseRecord.goods_sum_sales}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="row order-turnover-sum">
                    <div class="col-xs-6 display-table">
                        <div class="display-table-cell">
                            <i class="fa fa-reply-all my-fonts frog-color"></i>
                        </div>
                    </div>
                    <div class="col-xs-6 display-table">
                        <div class="display-table-cell">
                            <div class="title frog-color">订单总量</div>
                            <div class="val frog-color">${baseRecord.order_sum}</div>
                            <div class="title frog-color">成交总额</div>
                            <div class="val frog-color">￥${baseRecord.order_sum_money}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--
    <div class="panel panel-info charts-info-statistics-box">
        <div class="panel-heading">
            <i class="fa fa-bar-chart-o"></i>
            商品销量总量构成统计柱状图
        </div>
        <div id="goodsSalesBarChartsBox" class="panel-body"></div>
    </div>
    <div class="panel panel-info charts-info-statistics-box">
        <div class="panel-heading">
            <i class="fa fa-bar-chart-o"></i>
            日交易订单量统计折线图
        </div>
        <div id="ordersLineChartsBox" class="panel-body"></div>
    </div>
    -->

    <div class="row charts-info-statistics-box">
        <div class="col-xs-6">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o"></i>
                    商品销量总量构成统计柱状图
                </div>
                <div id="goodsSalesBarChartsBox" class="panel-body"></div>
            </div>
        </div>
        <div class="col-xs-6">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <i class="fa fa-bar-chart-o"></i>
                    日交易订单量统计折线图
                </div>
                <div id="ordersLineChartsBox" class="panel-body"></div>
            </div>
        </div>
    </div>

    <div class="panel panel-info goods-out-stock-statistics-box">
        <div class="panel-heading">
            <i class="fa fa-table"></i>
            缺货商品统计
        </div>
        <div class="panel-body">
            <table class="table table-condensed table-bordered table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>商品大类别</th>
                    <th>商品小类别</th>
                    <th>商品名称</th>
                    <th>总库存量</th>
                    <th>预览图片</th>
                    <th>统计结果</th>
                </tr>
                </thead>
                <tbody>
                    <c:set var="table_index" value="0"></c:set>
                    <c:forEach items="${baseRecord.outStockPhoneGoodsList}" var="data" varStatus="status">
                        <c:set var="table_index" value="${status.count}"></c:set>
                        <tr class="${data.phone_stock>5?'info':data.phone_stock>0?'warning':'danger'}">
                            <td>${status.count}</td>
                            <td>${data.goods_bigl_type_name}</td>
                            <td>${data.goods_small_type_name}</td>
                            <td>${data.goods_small_type_name} ${data.phone_model_name} ${data.phone_version_name}</td>
                            <td>${data.phone_stock}</td>
                            <td><img alt="手机预览图" width="25" height="25" src="${pageContext.request.contextPath}${data.phone_preview_image}?width=25&height=25"/></td>
                            <td>${data.phone_stock>5?'<span class="text-info">轻度缺货</span>':data.phone_stock>0?'<span class="text-warning">严重缺货</span>':'<span class="text-danger">缺货警报</span>'}</td>
                        </tr>
                    </c:forEach>

                    <c:forEach items="${baseRecord.outStockOtherGoodsList}" var="data" varStatus="status">
                        <c:set var="table_index" value="${table_index+1}"></c:set>
                        <tr class="${data.goods_stock>5?'info':data.goods_stock>0?'warning':'danger'}">
                            <td>${table_index}</td>
                            <td>${data.goods_bigl_type_name}</td>
                            <td>${data.goods_small_type_name}</td>
                            <td>${data.goods_name}</td>
                            <td>${data.goods_stock}</td>
                            <td><img alt="商品预览图" width="25" height="25" src="${pageContext.request.contextPath}${data.goods_preview_image}?width=25&height=25"/></td>
                            <td>${data.goods_stock>5?'<span class="text-info">轻度缺货</span>':data.goods_stock>0?'<span class="text-warning">严重缺货</span>':'<span class="text-danger">缺货警报</span>'}</td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        // 路径配置
        require.config({
            paths: {
                echarts: '${pageContext.request.contextPath}/js/common/echarts/build/dist'
            }
        });

        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/line' // 使用折线图就加载bar模块，按需加载
            ],
            function (ec) {
                initGoodsSalesBarCharts(ec);
                initOrdersLineCharts(ec);
            }
        );
    });

    function initGoodsSalesBarCharts(ec){
        var goods_small_type_names = '${baseRecord.goods_small_type_names}';
        var goods_small_type_stocks = '${baseRecord.goods_small_type_stocks}';
        if(goods_small_type_names&&goods_small_type_stocks){
            goods_small_type_names = goods_small_type_names.split(',');
            goods_small_type_stocks = goods_small_type_stocks.split(',');
        }else{
            return;
        }
        var myChart = ec.init(document.getElementById('goodsSalesBarChartsBox'),'red');
        var option = {
            tooltip: {
                show: true
            },
            legend: {
                data:['商品销量']
            },
            toolbox: {
                show : true,
                feature : {
                    dataView : {show: true, readOnly: true},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            xAxis : [
                {
                    type : 'category',
                    data : goods_small_type_names
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value} 件'
                    }
                }
            ],
            series : [
                {
                    "name":"商品销量",
                    "type":"bar",
                    "data":goods_small_type_stocks
                }
            ]
        };
        myChart.setOption(option);
    }

    function initOrdersLineCharts(ec){
        var day_orders_times = '${baseRecord.day_orders_times}';
        var day_orders_nums = '${baseRecord.day_orders_nums}';
        if(day_orders_times&&day_orders_nums){
            day_orders_times = day_orders_times.split(',');
            day_orders_nums = day_orders_nums.split(',');
        }else{
            return;
        }
        var myChart = ec.init(document.getElementById('ordersLineChartsBox'),'macarons');
        var option = {
            title : {}
            ,
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['日订单量']
            },
            toolbox: {
                show : true,
                feature : {
                    dataView : {show: true, readOnly: true},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : day_orders_times
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value} 单'
                    }
                }
            ],
            series : [
                {
                    name:'日订单量',
                    type:'line',
                    data:day_orders_nums,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };
        myChart.setOption(option);
    }
</script>