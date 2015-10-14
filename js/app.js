/**
* Documento principal AngularJS para la aplicación WEB
*/

var app = angular.module('tripGripWebApp', ['ngRoute']);

/**
* Fábrica de funciones para consumir el servicio web
*/

app.factory("services", function($http) {
	var serviceBase = 'http://tripgrip.5gbfree.com/php_webservice/'
  	var obj = {};
    obj.getHabitacion = function(id){
    	return $http.get(serviceBase + 'getPedido?id=' + id).then(function(response){
    		return response.data;
    	})
    }
    obj.getPedidos = function(){
    	return $http.get(serviceBase + 'getPedidos').then(function(response){
    		return response.data;
    	})
    }
    return obj;   
});



/**
* Configuración de las rutas
*/
app.config(['$routeProvider', function ($routeProvider){
	$routeProvider
	//Home
	.when("/", {
		title: 'Página Principal',
        templateUrl: 'partials/home.html'
	})
	.when("/pedidos", {
		title: 'Pedidos',
		templateUrl: 'partials/pedidos.html',
		controller: 'PedidosCtrl'
	})
    .when("/habitaciones", {
        title: 'habitaciones',
        templateUrl: 'partials/habitaciones.html',
        controller: 'HabitacionesCtrl'
    })
    .when("/verHabitacion/:idHabitacion", {
        title: 'habitación',
        templateUrl: 'partials/habitacion.html',
        controller: 'verHabitacionCtrl',
        resolve: {
            habitacion: function(services, $route){
                var idHabitacion = $route.current.params.idHabitacion;
                return services.getHabitacion(idHabitacion);
            }
        }
    })
	.otherwise({
		redirectTo: '/'
	});
}]);

/**
* Controla la petición de pedidos
*/

app.controller('PedidosCtrl', function ($scope, services) {
    services.getPedidos().then(function(response){
        $scope.pedidos = response;
    }); 
});

/**
* Controla la petición de las habitaciones
*/
app.controller('HabitacionesCtrl', function ($scope, services) {
    services.getPedidos().then(function(response){
        $scope.habitaciones = response;
    }); 
});

/**
* Controla la petición de una habitación
*/
app.controller('verHabitacionCtrl', function($scope, $rootScope, $location, $routeParams, services, customer){

});
