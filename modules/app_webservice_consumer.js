
angular.module('tripGripWebApp').factory("services", function($http) {
	var serviceBase = 'https://proyectos-m4ritox.c9.io/WebService/'
  	var obj = {};
    obj.getPedido = function(id){
    	return $http.get(serviceBase + 'getPedido?id=' + id).then(function(response){
    		return response.data;
    	})
    }
    obj.getAnuncios = function(){
    	return $http.get(serviceBase + 'getAnuncios').then(function(response){
    		return response.data.anuncios;
    	})
    }
    return obj;   
});