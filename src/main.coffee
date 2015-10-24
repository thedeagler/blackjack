numPlayers = prompt("HOW MANY PLAYAS YOU GOT");
new AppView(model: new App(numPlayers)).$el.appendTo 'body'
