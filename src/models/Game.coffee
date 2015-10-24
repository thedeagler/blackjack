###
  Game LOGICCCCCC
  1. 21 auto wins
  3. Over 21 auto lose
  2. Dealer stays over certain number
  4. When everyone is done hitting, anyone who has higher score than dealer wins
  *. Split if initial cards are equal value
  *. Betting
  *. Double Down: double your initial bet following the initial two-card deal, but you can hit one card only.
###

class window.Game extends Backbone.Model
  defaults:
    currentPlayerIndex: 0
    playerScores: []

  initialize: (numPlayers) ->
    @set 'deck', deck = new Deck()
    @set 'players', [0...numPlayers]
    playArr = @get 'players'
    for player, index in @get 'players'
      playArr[index] = deck.dealPlayer()
    @set 'players', playArr
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'currentPlayer', @get('players')[@get 'currentPlayerIndex']

  changeCurrentPlayer: ->
    index = @get 'currentPlayerIndex'
    @set 'currentPlayerIndex', index + 1
    @set 'currentPlayer', @get('players')[@get 'currentPlayerIndex']
    # If currentPlayerIndex > @get 'players'.length
      # @playDealer()

  setPlayerScore: ->
    @get('playerScores')[@get 'currentPlayerIndex'] = @get('currentPlayer').score()

  playDealer: ->
    while(@get('dealerHand').scores[1] < 17)
      @get('dealerHand').hit()
