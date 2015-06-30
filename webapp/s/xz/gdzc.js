/**
 * Created by jianbingfang on 2015/4/12.
 */

function drawChartGdzc() {

    $('#loading-gdzc').show();

    $.post('xz-gdzc-data.do', function (mdata) {

        var data;
        if (mdata && mdata.length > 0) {
            data = [];
            var nm;
            var other = 0;
            var kt = 0;
            var xj = 0;
            for (var i = 0; i < mdata.length; i++) {
                nm = mdata[i][0];
                if (nm === '主机'
                    || nm === '显示器'
                    || nm === '笔记本电脑'
                    || nm === '打印机'
                    || nm === '水准仪'
                    || nm === '办公桌'
                    || nm === '办公椅'
                    || nm === '移动硬盘'
                ) {
                    data.push(mdata[i]);
                } else if (nm.indexOf('空调') >= 0) {
                    kt += mdata[i][1];
                } else if (nm.indexOf('相机') >= 0) {
                    xj += mdata[i][1];
                } else {
                    other += mdata[i][1];
                }
            }
            data.push(['空调', kt]);
            data.push(['照相机', xj]);
            data.sort(function (a, b) {
                return b[1] - a[1];
            });
            data.push(['其他', other]);
        }

        $('#loading-gdzc').hide();

        $('#chart-gdzc').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            lang: {
                noData: '无数据'
            },
            title: {
                text: null
            },
            credits: {
                enabled: false
            },
            tooltip: {
                headerFormat: '<span style="font-size:15px"><b>{point.key}</b></span><br/>',
                pointFormat: '共{point.y}个，占比{point.percentage:.1f}%'
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
                            return this.y ?
                                ('<span style="font-size:14px"><b>' + this.point.name + '</span></b>: ' + this.y)
                                : null
                        }
                    },
                    startAngle: 0
                }
            },
            series: [{
                type: 'pie',
                name: '数量',
                data: data,
                cursor: 'pointer',
                point: {
                    events: {
                        click: function () {
                            var url = getBaseURL() + "/default/xz/wzList-info-list.do";
                            //window.location.href = url;
                            window.open(url);
                        }
                    }
                }
            }]
        });

    }).error(function () {
        alert('固定资产数据获取失败');
        $('#loading-gdzc').hide();
    });
}
