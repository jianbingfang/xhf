function drawChartHtgl(year) {

    $('#loading-htgl').show();
    $('#chart-htgl').hide();

    $.post('sckf-htgl-data.do', {year: year}, function (mdata) {

        console.log(mdata);
        $('#loading-htgl').hide();
        $('#chart-htgl').show();

        //mdata = [
        //    [4, 1, 3, 2],
        //    [36, 6, 14, 8]
        //];

        var colors = Highcharts.getOptions().colors,
            categories = ['已签订', '未签订'],
            name = '合同签订情况',
            data = [{
                y: mdata[0][0],
                color: colors[0],
                drilldown: {
                    name: categories[0],
                    categories: ['已签订'],
                    data: mdata[0].slice(0, 1),
                    color: colors[0]
                }
            }, {
                y: mdata[0].slice(1).sum(),
                color: colors[4],
                drilldown: {
                    name: categories[1],
                    categories: ['谈判中', '已起草', '未起草'],
                    data: mdata[0].slice(1),
                    color: colors[4]
                }
            }];


        // Build the data arrays
        var typeData = [];
        var detailData = [];
        for (var i = 0; i < data.length; i++) {

            typeData.push({
                name: categories[i],
                y: data[i].y,
                color: data[i].color
            });

            // add version data
            for (var j = 0; j < data[i].drilldown.data.length; j++) {
                var brightness = 0.2 - (j / data[i].drilldown.data.length) / 5;
                detailData.push({
                    name: data[i].drilldown.categories[j],
                    y: data[i].drilldown.data[j],
                    color: Highcharts.Color(data[i].color).brighten(brightness).get()
                });
            }
        }

        // Create the chart
        $('#chart-htgl').highcharts({
            chart: {
                type: 'pie'
            },
            lang: {
                noData: '无数据'
            },
            credits: {
                enabled: false
            },
            title: {
                text: '合同签订情况(总数:' + mdata[0].sum() + ')'
            },
            yAxis: {
                title: {
                    text: '数量'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false,
                    center: ['50%', '50%']
                }
            },
            tooltip: {
                formatter: function () {
                    var str = '<span style="font-size:15px"><b>' + this.point.name + '</b></span><table>';
                    str += '<tr>';
                    str += '<td style="color:' + this.series.color + ';padding:0">' + this.series.name + ': </td>';
                    str += '<td style="padding:0"><b>' + this.y + '</b></td>';
                    str += '</tr>';
                    str += '<tr>';
                    str += '<td style="color:#804000;padding:0">金额: </td>';
                    var t_amount;
                    if (this.series.index === 0) {
                        if (this.point.x === 0) {
                            t_amount = mdata[1].slice(0, 1).sum();
                        } else {
                            t_amount = mdata[1].slice(1).sum();
                        }
                    } else {
                        t_amount = mdata[1][this.point.x];
                    }
                    str += '<td style="padding:0"><b>￥' + formatNum(t_amount, 3) + '万</b></td>';
                    str += '</tr>';
                    str += '</table>';
                    return str;
                },
                useHTML: true
            },
            series: [{
                name: '数量',
                data: typeData,
                size: '60%',
                dataLabels: {
                    formatter: function () {
                        return this.point.name;
                    },
                    color: 'white',
                    distance: -30
                }
            }, {
                name: '数量',
                data: detailData,
                size: '80%',
                innerSize: '60%',
                dataLabels: {
                    formatter: function () {
                        return this.y ? ('<b>' + this.point.name + '：</b>' + this.y + '<br/>'
                        + '<b>总金额：</b>￥' + formatNum(mdata[1][this.point.x], 3) + '万<br/>') : null
                        //+ '<b>占比：</b>' + this.point.percentage + '%';
                    },
                    useHTML: true
                },
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            window.location.href = "http://" + window.location.host + "/xhf/default/sckf/commHt-info-list.do";
                        }
                    }
                }
            }]
        });
    }).error(function () {
        alert('合同数据获取失败');
    });
}