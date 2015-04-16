function drawChartZzxh(year) {

    $('#loading-zzxh').show();

    $.post('xz-gsfb-data.do', {year: year}, function (data) {


        data = [
            [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 0, 0],
            [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 0, 0, 0, 0, 0]
        ];

        data = data || [];

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
                name: '百旺纸',
                data: data[0]
            }, {
                name: '普通纸',
                data: data[1]
            }]
        });
    }).error(function () {
        alert('纸张消耗数据获取失败');
        $('#loading-zzxh').hide();
    });
}