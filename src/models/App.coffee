# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: (numPlayers) ->
    @set 'currentGame', new Game(numPlayers)
