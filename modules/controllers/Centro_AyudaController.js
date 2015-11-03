
angular.module('tripGripWebApp')
.controller('Centro_AyudaController', ['$scope', 'ModalService', function($scope, ModalService) {
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
