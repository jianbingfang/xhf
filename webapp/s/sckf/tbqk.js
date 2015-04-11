function drawChartTbqk(year) {

    $('#loading-tbqk').show();
    $('#chart-tbqk').hide();

    $.post('sckf-tbqk-data.do', {year: year}, function (data) {

        console.log(data);
        $('#loading-tbqk').hide();
        $('#chart-tbqk').show();

        //var data = [
        //    [83, 78, 98, 93, 106, 84, 105, 104, 91, 83, 106, 92],
        //    [48, 38, 39, 41, 47, 48, 59, 59, 52, 65, 59, 51],
        //    [32, 41, 64, 22, 14, 51, 85, 48, 34, 72, 65, 58]
        //];

        $('#chart-tbqk').highcharts({
            chart: {
                type: 'column'
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: year + '年投标情况'
            },
            subtitle: {
                text: '中标数:' + data[1].sum() + '    总金额:￥'
                + formatNum(data[2].sum())
            },
            credits: {
                enabled: false
            },
            xAxis: {
                categories: ['1', '2', '3', '4', '5', '6', '7',
                    '8', '9', '10', '11', '12']
            },
            yAxis: {
                min: 0,
                title: {
                    text: '数目'
                }
            },
            tooltip: {
                formatter: function () {
                    var str = '<span style="font-size:15px">'
                        + this.x + '月</span><table>';
                    $.each(this.points, function () {
                        str += '<tr>';
                        str += '<td style="color:'
                        + this.series.color
                        + ';padding:0">' + this.series.name
                        + ': </td>';
                        str += '<td style="padding:0"><b>' + this.y
                        + '</b></td>';
                        str += '</tr>';
                    });
                    str += '<tr>';
                    str += '<td style="color:#804000;padding:0">中标金额: </td>';
                    str += '<td style="padding:0"><b>￥'
                    + formatNum(data[2][this.x - 1])
                    + '</b></td>';
                    str += '</tr>';
                    str += '</table>';
                    return str;
                },

                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            series: [{
                name: '投标数',
                data: data[0],
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
                name: '中标数',
                data: data[1],
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
        alert('投标数据获取失败');
        $('#loading-tbqk').hide();
    });
}