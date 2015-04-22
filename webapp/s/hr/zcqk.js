/**
 * Created by jianbingfang on 2015/4/12.
 */

function drawChartZcqk() {

    $('#loading-zcqk').show();

    $.post('hr-zcqk-data.do', function (data) {

        data = data || [];

        $('#loading-zcqk').hide();

        $('#chart-zcqk').highcharts({
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
                    startAngle: 0,
                    events: {
                        click: function () {
                            var url = "http://" + window.location.host + "/xhf/default/hr/hrRyZj-treelist.do";
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
        alert('职称情况数据获取失败');
        $('#loading-zcqk').hide();
    });
}
