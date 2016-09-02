// function EpisodeFactory($resource) {
//   var Episode = $resource('/episodes/:id.json');
//   return Episode;
// }

//var jq = $.noConflict();
var app = angular.module('episodeForm', ['ngResource', 'ng-rails-csrf'])
                        .factory('Episode', ['$resource', function ($resource) {
                          var Episode = $resource('/episodes/:id.json');
                          return Episode;
                        }]);


app.controller("episodeFormController", [
              "$scope", "$http", "Episode",
      function($scope, $http, Episode) {

        $scope.contestants = [];
        $scope.getContestants = function() {
            $http.get("/contestants").then(function(data) {
              console.log(data);
              $scope.contestants = data.data;
            }, function(error) {
              alert('Error retreiving contestants: ' + error.status);
            });
        }

        $scope.episode = [];
        $scope.getEpisode = function() {
          $http.get("/episodes").then(function(data) {
            $scope.episode = data.data;
          }, function(error) {
            alert('Error retreiving episode: ' + error.status);
          });
        }

        // Create new contestant
        $scope.status = '';
        $scope.add = function(firstName, lastName) {
          $http.post("/contestants.json", {"contestant" : {
                                                  "first_name": firstName,
                                                  "last_name" : lastName } }
          ).then(function(response) {
            $scope.status = "Contestant added.";
            d = response.data;
            new_item = '<option value="' + d.id + '">' +
                        d.last_name + ', ' + d.first_name + '</option>';
            jQuery('.contestants').append(new_item);
          }, function(error) {
            $scope.status = "Failed to add contestant: " + error.status;
          });
        };

      }
]);
