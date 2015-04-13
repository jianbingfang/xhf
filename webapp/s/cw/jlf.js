/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartJlf(year) {

    $('#loading-jlf').show();

    $('#txt-yingshou').html(' - ');
    $('#txt-yishou').html(' - ');
    $('#txt-weishou').html(' - ');

    $.post('cw-jlf-data.do', {year: year}, function (data) {

        $('#loading-jlf').hide();

        var data = [
            ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
            [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
            [42.9, 41.5, 106.4, 49.2, 104.0, 176.0, 55.6, 128.5, 176.4, 154.1, 35.6, 44.4]
        ];

        $('#txt-yingshou').html(data[1].sum());
        $('#txt-yishou').html(data[2].sum());
        $('#txt-weishou').html(data[1].sum()  - data[2].sum());

        var rate = [];

        for (var i = 0; i < data[1].length; i++) {
            rate.push(100 * data[2][i] / data[1][i]);
        }

        $('#chart-jlf').highcharts({
            lang: {
                noData: '无数据'
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            xAxis: [{
                categories: data[0]
            }],
            yAxis: [{ // Primary yAxis
                title: {
                    text: '回收率',
                    style: {
                        color: '#89A54E'
                    }
                },
                labels: {
                    format: '{value}%',
                    style: {
                        color: '#89A54E'
                    }
                },
                opposite: true,
                max: 100
            }, { // Secondary yAxis
                labels: {
                    format: '{value} 万',
                    style: {
                        color: '#4572A7'
                    }
                },
                title: {
                    text: '金额',
                    style: {
                        color: '#4572A7'
                    }
                }
            }],
            tooltip: {
                shared: true
            },

            series: [{
                name: '应收',
                type: 'column',
                yAxis: 1,
                data: data[1],
                tooltip: {
                    valueSuffix: ' 万'
                },
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            window.location.href = "http://" + window.location.host + "/xhf/default/cw/cwYingShou-treelist.do";
                        }
                    }
                }
            }, {
                name: '已收',
                type: 'column',
                yAxis: 1,
                data: data[2],
                tooltip: {
                    valueSuffix: ' 万'
                },
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            window.location.href = "http://" + window.location.host + "/xhf/default/cw/cwYingShou-treelist.do";
                        }
                    }
                }
            }, {
                name: '回收率',
                type: 'spline',
                color: '#89A54E',
                data: rate,
                tooltip: {
                    valueSuffix: '%',
                    valueDecimals: 2
                }
            }]
        });

    }).error(function () {
        alert('投标数据获取失败');
        $('#loading-jlf').hide();
    });
}