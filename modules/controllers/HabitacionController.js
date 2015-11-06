
angular.module('tripGripWebApp')
.controller('HabitacionController', function ($scope, $routeParams, services, anuncio) {
    
	$scope.anuncio = anuncio;
    
    services.getAnuncios().then(function(response){
        $scope.habitaciones = response;
    }); 


});