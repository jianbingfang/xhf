function drawChartFbqk() {

    $('#loading-fbqk').show();
    $('#chart-fbqk').hide();

    $.post('sckf-fbqk-data.do', null, function (data) {

        $('#loading-fbqk').hide();
        $('#chart-fbqk').show();
        //var data = [97, 3];

        $('#chart-fbqk').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: '废标比例 (' + Math.round(10 * 100 * data[1] / data.sum()) / 10 + '%)'
            },
            credits: {
                enabled: false
            },
            tooltip: {
                headerFormat: '<span style="font-size:15px"><b>{point.key}</b></span><br/>',
                pointFormat: '<b>共{point.y}个，占比{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: false,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        style: {"color": "#606060", "fontSize": "14px"},
                        format: '<span style="font-size:14px"><b>{point.name}</span></b>: {point.y}'
                    },
                    startAngle: 0,
                    events: {
                        click: function () {
                            alert('redirect to page');
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '数量',
                data: [{
                    name: '好标',
                    y: data[0],
                    color: Highcharts.getOptions().colors[0]
                }, {
                    name: '废标',
                    y: data[1],
                    color: Highcharts.getOptions().colors[5]
                }]
            }]
        });

    }).error(function () {
        alert('投标数据获取失败');
    });
}