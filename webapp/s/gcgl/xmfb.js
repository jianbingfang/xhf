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

        /*var count = {};

         if (addrList && addrList.length > 0) {
         var name;
         addrList.forEach(function (addr) {
         name = getProvinceName(addr);
         if (name) {
         if (!count[name]) {
         count[name] = 0;
         }
         count[name]++;
         }
         });
         }*/

        var data = [];

        if (list && list.length > 0) {
            list.forEach(function (item) {
                data.push({name: item[0], value: item[1], selected: true});
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
            series: [
                {
                    name: '中国',
                    type: 'map',
                    mapType: 'china',
                    itemStyle: {
                        normal: {label: {show: true}},
                        emphasis: {label: {show: true}}
                    },
                    data: data
                }
            ]
        };

        myChart.setOption(option);
        myChart.on(myChart.EVENT.MAP_SELECTED, function (param) {
            alert(param.selected);
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