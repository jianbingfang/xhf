/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartTbbzj(year, month) {

    $('#loading-tbbzj').show();

    month = month | (new Date().getMonth + 1);

    $.post('cw-tbbzj-data.do', {year: year, month: month}, function (data) {

        $('#loading-tbbzj').hide();

        data = [
            ['交纳', 10],
            ['应收', 20],
            ['已收', 30],
            ['余额', 40]
        ];

        $('#chart-tbbzj').highcharts({
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
                            var url = "http://" + window.location.host + "/xhf/default/cw/cwBzj-info-list.do?type=2";
                            //window.location.href = url;
                            window.open(url);
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
        alert('投标保证金数据获取失败');
        $('#loading-tbbzj').hide();
    });
}