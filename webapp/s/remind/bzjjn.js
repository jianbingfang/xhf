var app = angular.module('myApp', [], function ($httpProvider) {
    $httpProvider.defaults.transformRequest = function (data) {
        if (data === undefined) {
            return data;
        }
        return $.param(data);
    };

    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded; charset=UTF-8';
});

app.controller('remindListCtrl', ['$scope', '$rootScope', '$http', function ($scope, $rootScope, $http) {

    $scope.queryRemindList = function () {
        $http.get('get-remind-list.do')
            .success(function (data) {
                console.log(data);
                $scope.remindList = data;
            }).error(function (data, status, headers, config) {
                console.log('提醒数据获取失败！' + status + ':' + data);
            });
    };

    $scope.done = function (fid) {
        $http.post($rootScope.scopePrefix + '/comm/remind-done-ajax.do', {
            fid: fid
        }).success(function (data) {
            if (data) {
                $('#remind' + fid).remove();
            }
        }).error(function () {
            alert("保存失败！");
        });
    };

    $scope.showRemind = function (fid) {
        $http.post($rootScope.scopePrefix + '/comm/remind-info-ajax.do', {
            fid: fid
        }).success(function (data) {
            alert(data.fname);
        }).error(function () {
            alert("保存失败！");
        });
    };

    $scope.ignore = function (fid) {
        $http.post($rootScope.scopePrefix + '/comm/remind-ignore-ajax.do', {
            fid: fid
        }).success(function (data) {
            if (data) {
                $('#remind' + fid).remove();
            }
        }).error(function () {
            alert("保存失败！");
        });
    };

    $scope.delay = function () {
        $http.post($rootScope.scopePrefix + '/comm/remind-delay-ajax.do', {
            fid: $scope.delayFid,
            nextRemindDate: $scope.nextRemindDate
        }).success(function (data) {
            if (data) {
                $('#remind' + $scope.delayFid).remove();
            }
        }).error(function () {
            alert("保存失败！");
        });

        $('.modal').modal('hide');
    };

    $scope.delayShow = function (fid) {
        $scope.delayFid = fid;
        $('.modal').modal();
    };

    setInterval(function () {
        $scope.queryRemindList();
    }, 60 * 60 * 1000);
}]);