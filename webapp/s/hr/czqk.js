/**
 * Created by jianbingfang on 2015/4/12.
 */

function drawChartCzqk(data) {

    $('#loading-czqk').show();

    $.post('hr-czqk-data.do', function (mdata) {

        mdata = mdata || [];

        mdata = [
            [2, 3, 4, 3, 2]
            , [5]
            , [8]
            , [6]
            , [10]
            , [3]
            , [2]
        ];

        var colors = Highcharts.getOptions().colors;
        var categories = ['注册人员', '专业监理工程师', '监理员', '见证员', '安全员', '资料员', '其他'];
        var data = [{
            y: mdata[0].sum(),
            color: colors[0],
            drilldown: {
                name: categories[0],
                categories: ['注册监理工程师', '注册造价工程师', '注册设计师', '一级建造师', '其他'],
                data: mdata[0],
                color: colors[0]
            }
        }];

        var totalSum = mdata[0].sum();
        for (var i = 1; i < mdata.length; i++) {
            data.push({
                y: mdata[i].sum(),
                color: colors[i],
                drilldown: {
                    name: categories[i],
                    categories: [categories[i]],
                    data: mdata[i],
                    color: colors[i]
                }
            });
            totalSum += mdata[i].sum();
        }

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

        $('#loading-czqk').hide();
        // Create the chart
        $('#chart-czqk').highcharts({
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
                text: '总数:' + totalSum
            },
            yAxis: {
                title: {
                    text: '数量'
                }
            },
            plotOptions: {
                pie: {
                    shadow: false,
                    center: ['50%', '50%'],
                    startAngle: (mdata[0][0] === 0 || mdata[0].slice(1).sum() === 0) ? 45 : 0
                }
            },
            tooltip: {
                formatter: function () {
                    var str = '<span style="font-size:15px"><b>' + this.point.name + '</b></span><table>';
                    str += '<tr>';
                    str += '<td style="color:' + this.series.color + ';padding:0">' + this.series.name + ': </td>';
                    str += '<td style="padding:0"><b>' + this.y + '</b></td>';
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
                        return this.y ? ('<b>' + this.point.name + '：</b>' + this.y) : null
                        //+ '<b>占比：</b>' + this.point.percentage + '%';
                    },
                    useHTML: true
                },
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            var url = "http://" + window.location.host + "/xhf/default/sckf/commHt-info-list.do";
                            //window.location.href = url;
                            window.open(url);
                        }
                    }
                }
            }]
        });

    }).error(function () {
        alert('持证情况数据获取失败');
        $('#loading-czqk').hide();
    });
}
