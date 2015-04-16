/**
 * Created by jianbingfang on 2015/4/12.
 */

function drawChartGdzc() {

    $('#loading-gdzc').show();

    $.post('xz-gdzc-data.do', function (data) {

        $('#loading-gdzc').hide();

        $('#chart-gdzc').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            tooltip: {
                headerFormat: '<span style="font-size:15px"><b>{point.key}</b></span><br/>',
                pointFormat: '共{point.y}个，占比{point.percentage:.1f}%'
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
                        formatter: function () {
                            return this.y ?
                                ('<span style="font-size:14px"><b>' + this.point.name + '</span></b>: ' + this.y)
                                : null
                        }
                    },
                    startAngle: 0
                }
            },
            series: [{
                type: 'pie',
                name: '数量',
                data: data,
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            window.location.href = "http://" + window.location.host + "/xhf/default/xz/wzList-info-list.do";
                        }
                    }
                }
            }]
        });

    }).error(function () {
        alert('固定资产数据获取失败');
        $('#loading-gdzc').hide();
    });
}
