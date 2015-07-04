function drawChartFbqk(year) {

    $('#loading-fbqk').show();

    $.post('sckf-fbqk-data.do', {year: year}, function (data) {

        $('#loading-fbqk').hide();

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
                text: '废标比例'
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
                            var url = getBaseURL() + "/default/sckf/jyXm-info-list.do";
                            //window.location.href = url;
                            window.open(url);
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '数量',
                data: data
            }]
        });

    }).error(function () {
        alert('废标数据获取失败');
        $('#loading-fbqk').hide();
    });
}