/**
* Documento principal AngularJS para la aplicación WEB
*/
'use strict';

var app = angular.module('tripGripWebApp', ['ngRoute', 'angularModalService']);

app.controller('Centro_AyudaController', ['$scope', 'ModalService', function($scope, ModalService) {

  $scope.yesNoResult = null;
/* 
  $scope.showYesNo = function() {

    ModalService.showModal({
      templateUrl: "yesno/yesno.html",
      controller: "YesNoController"
    }).then(function(modal) {
      modal.element.modal();
      modal.close.then(function(result) {
        $scope.yesNoResult = result ? "You said Yes" : "You said No";
      });
    });

  };
*/
}]);