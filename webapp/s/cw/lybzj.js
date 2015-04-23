/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartLybzj() {

    $('#loading-lybzj').show();

    $.post('cw-bzj-data.do', {type: 2}, function (res) {

        console.log(res);

        $('#loading-lybzj').hide();

        var data;

        if (res) {
            data = [
                ['不可收', res[0] || 0]
                , ['应收', res[1] || 0]
                , ['已收', res[2] || 0]
            ];
            console.log('----------------');
        }
        console.log(data);

        $('#chart-lybzj').highcharts({
            lang: {
                noData: '无数据'
            },
            title: {
                text: '<b>交纳额</b>:￥' + (formatNum(res.sum()) || 0)
            },
            credits: {
                enabled: false
            },
            tooltip: {
                formatter: function () {
                    var str = '<span style="font-size:15px"><b>' + this.point.name + '</b></span><table>';
                    str += '<tr>';
                    str += '<td style="color:' + this.series.color + ';">' + this.series.name + ': </td>';
                    str += '<td style="padding:0"><b>￥' + (formatNum(this.y) || 0) + '</b></td>';
                    str += '</tr>';
                    str += '</table>';
                    return str;
                },
                useHTML: true
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
                            return '<span style="font-size:14px"><b>' + this.point.name + '</span></b>:￥' + (formatNum(this.point.y) || 0)
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
                type: 'pie',
                name: '金额',
                data: data
            }]
        });

    }).error(function () {
        alert('履约保证金数据获取失败');
        $('#loading-lybzj').hide();
    });
}