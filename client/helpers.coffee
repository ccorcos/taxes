Template.registerHelper 'sessionVar', (string) -> Session.get(string)

Template.registerHelper 'formatDate', (date) -> Date.create(date)?.format()

Template.registerHelper 'formatAmount', (amount) -> amount.format(2)

    