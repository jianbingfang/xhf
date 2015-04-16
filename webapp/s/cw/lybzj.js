/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartLybzj(year, month) {

    $('#loading-lybzj').show();

    month = month | (new Date().getMonth + 1);

    $.post('cw-lybzj-data.do', {year: year, month: month}, function (data) {

        $('#loading-lybzj').hide();

        data = [
            ['交纳', 10000],
            ['应收', 200000],
            ['已收', 30000],
            ['余额', 40000]
        ];

        $('#chart-lybzj').highcharts({
            chart: {
                type: 'column'
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: null
            },
            xAxis: {
                categories: ['类别']
            },
            yAxis: {
                title: {
                    text: '金额'
                }
            },
            credits: {
                enabled: false
            },
            tooltip: {
                valuePrefix: '￥'
            },
            plotOptions: {
                column: {
                    allowPointSelect: false,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        formatter: function () {
                            return this.y ? this.y : null;
                        }
                    },
                    events: {
                        click: function () {
                            window.location.href = "http://" + window.location.host + "/xhf/default/cw/cwBzj-info-list.do?type=2";
                        }
                    }
                }
            },
            series: [{
                name: data[0][0],
                data: [data[0][1]]
            }, {
                name: data[1][0],
                data: [data[1][1]],
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            console.log('redirect to page '
                            + this.series.index
                            + '-' + this.x);
                        }
                    }
                }
            }, {
                name: data[2][0],
                data: [data[2][1]],
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            console.log('redirect to page '
                            + this.series.index
                            + '-' + this.x);
                        }
                    }
                }
            }, {
                name: data[3][0],
                data: [data[3][1]],
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            console.log('redirect to page '
                            + this.series.index
                            + '-' + this.x);
                        }
                    }
                }
            }]
        });

    }).error(function () {
        alert('履约保证金数据获取失败');
        $('#loading-lybzj').hide();
    });
}