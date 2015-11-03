

/**
* Documento principal AngularJS para la aplicación WEB
*/
'use strict';
var app = angular.module('tripGripWebApp', ['ngRoute','angularModalService']);


app.controller('verPedidoCtrl', function($scope, $rootScope, $location, $routeParams, services, pedido) {
    var idHabitacion = ($routeParams.idHabitacion) ? parseInt($routeParams.idHabitacion) : 0;
    $scope.pedido = pedido;
});

/*
app.controller('Centro_AyudaController', ['$scope', 'ModalService', function($scope, ModalService) {
  $scope.showYesNo = function()
  {
   
    ModalService.showModal({
      templateUrl: "partials/yesno.html",
      controller: "YesNoController"
    }).then(function(modal) {
      modal.element.modal();
      modal.close.then(function(result) {
        $scope.yesNoResult = result ? "You said Yes" : "You said No";
      });
    }); 

  };
}]);
*/