/**
 * Created by jianbingfang on 2015/4/12.
 */
var myChart = echarts.init(document.getElementById('chart-xmfb'));

function drawChartXmfb() {

    $('#loading-xmfb').show();
    myChart.showLoading({
        text: '加载中...'
    });

    $.post('gcgl-xmfb-data.do', null, function (list) {

        var data = [];

        var max = 100;  // max值至少为100
        if (list && list.length > 0) {
            list.forEach(function (item) {
                data.push({name: item[0], value: Math.round(item[1])});
                max = Math.max(max, Math.round(item[1]));
            });
        }

        $('#loading-xmfb').hide();
        myChart.hideLoading();

        var option = {
            tooltip: {
                trigger: 'item',
                formatter: function (a) {
                    return a[1] + '：' + a[2];
                }
            },
            dataRange: {
                min: 0,
                max: max,
                x: 'left',
                y: 'bottom',
                text: ['高', '低'],           // 文本，默认为数值文本
                calculable: true,
                splitNumber: 1,
                precision: 0
            },
            series: [
                {
                    name: '项目数',
                    type: 'map',
                    mapType: 'china',
                    roam: false,
                    itemStyle: {
                        normal: {label: {show: true}},
                        emphasis: {label: {show: true}}
                    },
                    data: data
                }
            ]
        };

        myChart.setOption(option);

        var ecConfig = getEcConfig();
        myChart.on(ecConfig.EVENT.CLICK, function () {
            var url = "http://" + window.location.host + "/xhf/default/gcgl/pjXm-info-list.do?fstatus=1";
            //window.location.href = url;
            window.open(url);
        });
    }).error(function () {
        alert('投标数据获取失败');
        $('#loading-xmfb').hide();
    });
}

var getProvinceName = function (addr) {
    for (var i = 0; i < province.length; i++) {
        if (province[i] === addr.substr(0, province[i].length)) {
            return province[i];
        }
    }
    return null;
};

var province = [
    '北京',
    '天津',
    '上海',
    '广东',
    '江西',
    '浙江',
    '福建',
    '江苏',
    '河南',
    '山东',
    '重庆',
    '湖南',
    '河北',
    '湖北',
    '陕西',
    '广西',
    '吉林',
    '辽宁',
    '山西',
    '安徽',
    '宁夏',
    '贵州',
    '四川',
    '黑龙江',
    '甘肃',
    '云南',
    '海南',
    '台湾',
    '新疆',
    '青海',
    '内蒙古',
    '香港',
    '澳门',
    '西藏'
];