class window.Hand extends Backbone.Collection
  model: Card

  defaults:
    name: 'Player'

  initialize: (array, @deck, @isDealer) ->

  changePlayer: ->
    @trigger('current')

  hit: ->
    @add(@deck.pop())
    @last()
    @score()
    # add class for bust
    # CHeck for bust
    # check game over function

  show: ->
    # Show dealer card
    if @isDealer
      @at(0).flip()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  isWin: (bool) ->
    if bool is 'push'
      @trigger('push')
    else if bool
      @trigger('CHRISCHRISCHRIS')
    else
      @trigger('lose')

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  score: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    max = @minScore() + 10 * @hasAce()
    min = @minScore()

    if min > 21 then @trigger('bust')
    if max > 21 then min else max

