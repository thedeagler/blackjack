class window.Hand extends Backbone.Collection
  model: Card

  defaults:
    name: 'Player'

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()
    # check game over function

  stand: ->
    # CHeck for bust

    # scoresArr = @scores()
    # if scoresArr[1] > 21 then score = scoresArr[0] else score =scoresArr[1]
    # @set 'playerScore', score
    # console.log(@get 'playerScore')

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  score: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    max = @minScore() + 10 * @hasAce()
    min = @minScore()

    if max > 21 then min else max

    ###
    1 ace - minscore = 1, 1 + (10 * true) = 11
    2 ace - minscore = 2, 2 + (10 * true) = 12
    ###


