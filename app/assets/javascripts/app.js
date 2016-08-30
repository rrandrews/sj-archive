var app = angular.module('clues', []);
var app = angular.module('contestants', ['ngResource', 'ng-rails-csrf']);

app.controller("ContestantsSearchController", [
              "$scope",
      function($scope) {
        $scope.search = function(searchTerm) {
          $scope.searchedFor = searchTerm;
        }
      }
]);

app.controller("ContestantAddController", [
              "$scope", "$http", "$window",
      function($scope, $http, $window) {
        $scope.contestants = [];
        $scope.getContestants = function() {
            $http.get("/contestants").then(function(data) {
              console.log(data);
              $scope.contestants = data.data;
            }, function(error) {
              alert('error: ' + error.status);
            });
        }
        $scope.getContestants();

        $scope.status = '';
        $scope.add = function(firstName, lastName) {
          $http.post("/contestants.json", {"contestant" : {
                                                  "first_name": firstName,
                                                  "last_name" : lastName } }
          ).then(function(response) {
            $scope.status = "Contestant added.";
            $scope.getContestants();
          }, function(error) {
            $scope.status = "Failed to add contestant: " + error.status;
          });
        };

      }
]);

var ClueSearchController = function($scope, $http) {
  $scope.search = function(searchTerm) {
    $http.get("/clues.json", { "params": { "keywords": searchTerm } }
    ).then(function(response) {
      $scope.clues = response.data;
    }, function(response) {
      alert("There was a problem: " + response.status);
    });
  }
}

app.controller("ClueSearchController", ["$scope", "$http", ClueSearchController]);
