
angular.module('tripGripWebApp').config(['$routeProvider', function ($routeProvider){
	$routeProvider
	//Home
	.when("/", {
		title: 'Página Principal',
        templateUrl: 'partials/home.html'
	})
    .when("/faq", {
        title: 'Preguntas frecuentes',
        templateUrl: 'partials/faq.html'
    })
    .when("/centro_ayuda", {
        title: 'Centro de Ayuda',
        templateUrl: 'partials/centro_ayuda.html',
        controller: 'Centro_AyudaController'
    })
	.when("/pedidos", {
		title: 'Pedidos',
		templateUrl: 'partials/pedidos.html',
		controller: 'PedidosCtrl'
	})
    .when("/habitaciones", {
        title: 'habitaciones',
        templateUrl: 'partials/habitaciones.html',
        controller: 'HabitacionesController'
    })
    .when("/verHabitacion/:idHabitacion", {
        title: 'habitación',
        templateUrl: 'partials/habitacion.html',
        controller: 'verPedidoCtrl',
        resolve: {
            pedido: function(services, $route){
                var idHabitacion = $route.current.params.idHabitacion;
                return services.getPedido(idHabitacion);
            }
        }
    });
}]);