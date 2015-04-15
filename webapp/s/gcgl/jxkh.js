/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartJxkh(year) {

    $('#loading-jxkh').show();

    $.post('gcgl-jxkh-data.do', {year: year}, function (data) {

        $('#loading-jxkh').hide();

        $('#chart-jxkh').highcharts({
            lang: {
                noData: '无数据'
            },
            credits: {
                enabled: false
            },
            chart: {
                type: 'bar'
            },
            title: {
                text: null
            },
            xAxis: {
                categories: ['90-100', '75-90', '0-75', '无'],
                title: {
                    text: '分数范围'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '人数'
                },
                labels: {
                    overflow: 'justify'
                },
                allowDecimals: false
            },
            tooltip: {
                valueSuffix: ' 人'
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            legend: {
                enabled: false
            },
            series: [{
                name: '人数',
                data: data,
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            window.location.href = "http://" + window.location.host + "/xhf/default/gcgl/pjkh-info-list.do";
                        }
                    }
                }
            }]
        });

    }).error(function () {
        alert('投标数据获取失败');
        $('#loading-jxkh').hide();
    });
}