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
    obj.getPedido = function(){
    	return $http.get(serviceBase + 'getPedido?id=1234').then(function(response){
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

/*
 app.controller('PedidosCtrl', function($scope, $http) {
      $http.get('http://tripgrip.5gbfree.com/php_webservice/getPedidos?id=1234')
      .success(function(response) {$scope.pedidos = response});
 }); */

/**
* Controla la petición de las habitaciones
*/
app.controller('HabitacionesCtrl', function ($scope, services) {
    services.getPedidos().then(function(response){
        $scope.habitaciones = response;
    }); 
});