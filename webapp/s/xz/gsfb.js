/**
 * Created by jianbingfang on 2015/4/12.
 */
var myChart = echarts.init(document.getElementById('chart-gsfb'));

function drawChartGsfb() {

    $('#loading-gsfb').show();
    myChart.showLoading({
        text: '加载中...'
    });

    $.post('xz-gsfb-data.do', null, function (addrList) {

        addrList = addrList || [];

        var comInfo = {};
        var cntInfo = {};
        var unknown = [];

        var name;
        addrList.forEach(function (item) {
            name = getProvinceName(item[0]);
            if (name) {
                if (!comInfo[name]) {
                    comInfo[name] = item[1];
                } else {
                    comInfo[name] += '<br/>' + item[1];
                }

                if (!cntInfo[name]) {
                    cntInfo[name] = 0;
                }
                cntInfo[name]++;

            } else {
                unknown.push(item[1]);
            }
        });

        var data = [];
        var max = 0;
        for (var province in comInfo) {
            data.push({name: province, value: cntInfo[province]});
            if (max < cntInfo[province]) {
                max = cntInfo[province];
            }
        }

        $('#loading-gsfb').hide();
        myChart.hideLoading();

        var option = {
            title: {
                text: '共' + addrList.length + '家分公司',
                subtext: unknown.length ? ('其中有' + unknown.length + '家分公司地址不详：\n' + unknown.join('\n')) : undefined,
                x: 'left',
                y: 'bottom'
            },
            tooltip: {
                trigger: 'item',
                formatter: function (a) {
                    return comInfo[a[1]] ? comInfo[a[1]] : '无';
                }
            },
            dataRange: {
                min: 0,
                max: max,
                color: ['orange', 'yellow'],
                text: ['多', '少'],
                orient: 'horizontal',
                x: 'center',
                y: 'top',
                calculable: true,
                splitNumber: 5,
                precision: 0
            },
            series: [{
                name: '分公司',
                type: 'map',
                mapType: 'china',
                itemStyle: {
                    normal: {label: {show: true}},
                    emphasis: {label: {show: true}}
                },
                data: data
            }]
        };

        myChart.setOption(option);

        var ecConfig = getEcConfig();
        myChart.on(ecConfig.EVENT.CLICK, function () {
            var url = "http://" + window.location.host + "/xhf/default/xz/commpany-info-list.do";
            //window.location.href = url;
            window.open(url);
        });
    }).error(function () {
        alert('公司分布数据获取失败');
        $('#loading-gsfb').hide();
    });
}

var getProvinceName = function (addr) {
    var provinceList = ['北京', '天津', '上海', '广东', '江西', '浙江', '福建', '江苏', '河南', '山东', '重庆', '湖南', '河北', '湖北', '陕西', '广西', '吉林', '辽宁', '山西', '安徽', '宁夏', '贵州', '四川', '黑龙江', '甘肃', '云南', '海南', '台湾', '新疆', '青海', '内蒙古', '香港', '澳门', '西藏'];
    for (var i = 0; i < provinceList.length; i++) {
        if (provinceList[i] === addr.substr(0, provinceList[i].length)) {
            return provinceList[i];
        }
    }
    return null;
};

