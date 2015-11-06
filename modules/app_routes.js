
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
	.when("/verMultimedia", {
		title: 'Multimedia',
		templateUrl: 'partials/multimedia.html'
	})
    .when("/habitaciones", {
        title: 'habitaciones',
        templateUrl: 'partials/habitaciones.html',
        controller: 'HabitacionesController'
    })
    .when("/verHabitacion/:idaAnuncio", {
        title: 'habitación',
        templateUrl: 'partials/habitacion.html',
        controller: "HabitacionController",
        resolve: {
            anuncio: function(services, $route){
                var idanuncio = $route.current.params.idaAnuncio;
                return services.getAnuncio(idanuncio);
            }
        }
    })
    .when("/verNosotros", {
        title: "Nosotros",
        templateUrl: "partials/nosotros.html"
    })
}]);