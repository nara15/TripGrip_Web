
angular.module('tripGripWebApp').factory("services", function($http) {
	var serviceBase = 'https://proyectos-m4ritox.c9.io/WebService/'
  	var obj = {};
    obj.getAnuncios = function(){
    	return $http.get(serviceBase + 'getAnuncios').then(function(response){
    		return response.data.anuncios;
    	})
    }
    obj.getAnuncio = function(idAnuncio){
        return $http.get(serviceBase + 'getAnuncio?id=' + idAnuncio).then(function(response){
            return response.data.anuncio;
        })
    }

    obj.getPreguntas = function (){
        return $http.get(serviceBase + 'getPreguntas').then(function(response){
            return response.data.preguntas;
        })
    }

    obj.setPregunta = function(pregunta){
        return $http.post(serviceBase + 'insertPregunta', pregunta).then(function(results){
            return results;
        })
    }

    return obj;   
});