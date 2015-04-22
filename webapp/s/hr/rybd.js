/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartRybd(year, month) {

    $('#loading-rybd').show();

    month = month | (new Date().getMonth + 1);

    $.post('hr-rybd-data.do', {year: year}, function (res) {

        console.log(res);
        $('#loading-rybd').hide();

        res = res || [];
        var data = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        res.forEach(function (item) {
            data[item[0] - 1] = item[1];
        });

        $('#chart-rybd').highcharts({
            chart: {
                type: 'column'
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: year + '年人员离职情况'
            },
            xAxis: {
                categories: ['1月', '2月', '3月', '4月', '5月', '6月', '7月',
                    '8月', '9月', '10月', '11月', '12月']
            },
            yAxis: {
                title: {
                    text: '人数'
                },
                allowDecimals: false
            },
            credits: {
                enabled: false
            },
            tooltip: {
                valuePrefix: ''
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
                            var url = "http://" + window.location.host + "/xhf/default/hr/hrLz-info-list.do";
                            //window.location.href = url;
                            window.open(url);
                        }
                    }
                }
            },
            series: [{
                name: '离职人数',
                data: data
            }]
        });

    }).error(function () {
        alert('人员变动数据获取失败');
        $('#loading-rybd').hide();
    });
}