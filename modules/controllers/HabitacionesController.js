
angular.module('tripGripWebApp').controller('HabitacionesController', function ($scope, services) {
    services.getAnuncios().then(function(response){
        $scope.habitaciones = response;
    }); 
});
