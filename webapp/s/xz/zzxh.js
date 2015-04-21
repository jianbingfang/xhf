function drawChartZzxh(year) {

    $('#loading-zzxh').show();

    $.post('xz-zzxh-data.do', {year: year}, function (res) {

        console.log(res);

        res = res || [];

        var data = [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ];

        res[0].forEach(function (item) {
            data[0][parseInt(item[0])-1] = item[1];
        });

        res[1].forEach(function (item) {
            data[1][parseInt(item[0])-1] = item[1];
        });

        if (data[0].sum() + data[1].sum() === 0) {
            data = [[], []];
        }

        $('#loading-zzxh').hide();

        $('#chart-zzxh').highcharts({
            chart: {
                type: 'line'
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: year + '年纸张消耗统计'
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: ['1月', '2月', '3月', '4月', '5月', '6月', '7月',
                    '8月', '9月', '10月', '11月', '12月']
            },
            yAxis: {
                title: {
                    text: '数目（包）'
                }
            },
            tooltip: {
                valueSuffix: '包',
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: true
                }
            },
            series: [{
                name: '普通纸',
                data: data[0]
            }, {
                name: '百旺纸',
                data: data[1]
            }]
        });
    }).error(function () {
        alert('纸张消耗数据获取失败');
        $('#loading-zzxh').hide();
    });
}