
angular.module('tripGripWebApp')
.controller('Centro_AyudaController', ['$scope', 'ModalService', 'services', function($scope, ModalService, services) {
  
  services.getPreguntas().then(function(response){
        $scope.preguntas = response;
  });

  $scope.hacerPregunta = function()
  {
   
    ModalService.showModal({
      templateUrl: "partials/hacerPregunta.html",
      controller: "HacerPreguntaController"
    }).then(function(modal) {
      modal.element.modal();

      modal.close.then(function(result) {
        //$scope.preguntaResult = result;
        services.setPregunta(result).then(function(response){
          $scope.preguntaResult = response;
        }); 
        
      });

     
    }); 
  };

}]);
