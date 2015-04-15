(function() {
  "use strict";
 
  angular.module("app").controller("commentsCtrl", function($scope, $http){


  	  	$scope.fetchData = function(id){
	  		$http.get("/api/v1/comments.json?article_id=" + id).then(function(response){
	  			$scope.comments = response.data;
	  		});
  		};


  		$scope.addNewComment = function(newComment, newArticleId){
	  		var comment = {
	  			comment: newComment,
	  			article_id: newArticleId
  			};

	  		$http.post("/api/v1/comments.json", comment).then(function(response){
	  			$scope.comments = response.data;
	  			$scope.newComment = null;
	  		});
  		};


		window.scope = $scope;
  });
}());