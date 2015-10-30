

angular.module('tripGripWebApp')
.controller('verPedidoCtrl', function($scope, $rootScope, $location, $routeParams, services, pedido) {
    var idHabitacion = ($routeParams.idHabitacion) ? parseInt($routeParams.idHabitacion) : 0;
    $scope.pedido = pedido;
});
