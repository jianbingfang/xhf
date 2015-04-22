/**
 * Created by jianbingfang on 2015/4/12.
 */
function drawChartRybd(year, month) {

    $('#loading-rybd').show();

    month = month | (new Date().getMonth + 1);

    $.post('hr-rybd-data.do', {year: year}, function (res) {

        console.log(res);
        $('#loading-rybd').hide();

        res = res || {num: 0, lzList: [], rzList: []};
        var rzData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];  //入职人数
        var lzData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];  //离职人数
        var zzData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];  //在职人数

        res.rzList.forEach(function (item) {
            rzData[item[0] - 1] = item[1];
        });

        res.lzList.forEach(function (item) {
            lzData[item[0] - 1] = item[1];
        });

        zzData[0] = res.num + rzData[0] - lzData[0];
        for (var i = 1; i < 12; i++) {
            zzData[i] = zzData[i - 1] + rzData[i] - lzData[i];
        }

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
                valuePrefix: '',
                shared: true,
                useHTML: true
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
                name: '在职人数',
                data: zzData
            },{
                name: '离职人数',
                data: lzData
            }]
        });

    }).error(function () {
        alert('人员变动数据获取失败');
        $('#loading-rybd').hide();
    });
}