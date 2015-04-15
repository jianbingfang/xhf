/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartProjectOnbuilding(year) {

    $('#loading-project-onbuilding').show();

    $.post('gcgl-project-onbuilding-data.do', {year: year}, function (res) {

        var data;
        if (res && res.length > 0) {
            data = [
                ['房屋建筑工程'],
                ['公路工程'],
                ['电力工程'],
                ['冶炼工程'],
                ['市政公用工程'],
                ['其它工程']
            ];

            res.forEach(function (item) {
                switch (item[0]) {
                    case '房屋建筑工程':
                        data[0].push(item[1]);
                        break;
                    case '公路工程':
                        data[1].push(item[1]);
                        break;
                    case '电力工程':
                        data[2].push(item[1]);
                        break;
                    case '冶炼工程':
                        data[3].push(item[1]);
                        break;
                    case '市政公用工程':
                        data[4].push(item[1]);
                        break;
                    default :
                        data[5].push(item[1]);
                        break;
                }
            });

            data.sort(function (a, b) {
                return b[1] - a[1];
            });
        }

        $('#loading-project-onbuilding').hide();

        $('#chart-project-onbuilding').highcharts({
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
                    allowPointSelect: true,
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
                data: data
            }]
        });

    }).error(function () {
        alert('投标数据获取失败');
        $('#loading-project-onbuilding').hide();
    });
}