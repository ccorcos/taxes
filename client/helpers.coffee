Template.registerHelper 'sessionVar', (string) -> Session.get(string)

Template.registerHelper 'formatDate', (date) -> Date.create(date)?.format("{M}.{d}.{yy} - {h}:{mm}")

Template.registerHelper 'formatAmount', (amount) -> amount.format(2)