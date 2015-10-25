###
  Game LOGICCCCCC
 x1. 21 auto wins
 x3. Over 21 auto lose
 x2. Dealer stays over certain number
 x4. When everyone is done hitting, anyone who has higher score than dealer wins
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
    @set 'dealerScore', @get('dealerHand').score()
    @set 'currentPlayer', @get('players')[@get 'currentPlayerIndex']

  changeCurrentPlayer: ->
    if @get('currentPlayerIndex') + 1 >= @get('players').length
      @playDealer()
    else
      index = @get 'currentPlayerIndex'
      @set 'currentPlayerIndex', index + 1
      @set 'currentPlayer', @get('players')[@get 'currentPlayerIndex']

  setPlayerScore: ->
    @get('playerScores')[@get 'currentPlayerIndex'] = @get('currentPlayer').score()

  playDealer: ->
    @get('dealerHand').show()
    while(@get('dealerScore') < 17)
      @get('dealerHand').hit()
      @set 'dealerScore', @get('dealerHand').score()
    # Check winners
    @muchWinnerization()

  muchWinnerization: =>
    _.each(@get('playerScores'), (score, index) =>
      if score <= 21
        if score == @get('dealerScore')
          @get('players')[index] .isWin('push')
        else if @get('dealerScore') > 21 or score > @get('dealerScore')
          @get('players')[index] .isWin(true)
        else
          @get('players')[index] .isWin(false)
    , @)







