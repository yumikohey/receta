controllers = angular.module('controllers')
controllers.controller("RecipeController", [ '$scope', '$routeParams', '$resource',
  ($scope,$routeParams,$resource)->
    Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json' })

    Recipe.get({recipeId: $routeParams.recipeId},
      ( (recipe)-> $scope.recipe = recipe ),
      ( (httpResponse)->
        $scope.recipe = null
        flash.error   = "There is no recipe with ID #{$routeParams.recipeId}"
      )
    )
])