/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartJlf(year) {

    $('#loading-jlf').show();

    $('#txt-yingshou').html(' - ');
    $('#txt-yishou').html(' - ');
    $('#txt-weishou').html(' - ');

    $.post('cw-jlf-data.do', {year: year}, function (res) {

        console.log(res);

        $('#loading-jlf').hide();

        var dateStr = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

        var data = [
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        ];

        var rate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

        if (res && res.length) {
            for (var i = 0; i < res.length; i++) {
                data[0][res[i][0] - 1] = res[i][1];
                data[1][res[i][0] - 1] = res[i][2];
                rate[res[i][0] - 1] = (100 * res[i][2] / res[i][1]);
            }
            $('#txt-yingshou').html(formatNum(data[0].sum()));
            $('#txt-yishou').html(formatNum(data[1].sum()));
            $('#txt-weishou').html(formatNum(data[0].sum() - data[1].sum()));

        }

        console.log(data);

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
                categories: dateStr
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
                min: 0
            }, { // Secondary yAxis
                labels: {
                    format: '{value}',
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
                data: data[0],
                tooltip: {
                    valuePrefix: '￥'
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
                data: data[1],
                tooltip: {
                    valuePrefix: '￥'
                },
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            var url = "http://" + window.location.host + "/xhf/default/cw/cwYingShou-treelist.do";
                            //window.location.href = url;
                            window.open(url);
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