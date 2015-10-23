beer_category = Category.create(name: 'Beer', alc_percent: 6)
whiskey_category = Category.create(name: 'Whiskey', alc_percent: 40)

Drink.create(name: "Red Horse", category: beer_category, alc_percent: 5, serving: 500, serving_type: 'Bottle')
Drink.create(name: "San Mig Pale Pilsen", category: beer_category, alc_percent: 5, serving: 355, serving_type: 'Bottle')
Drink.create(name: "San Mig Light", category: beer_category, alc_percent: 6.9, serving: 330, serving_type: 'Bottle')

Drink.create(name: "Jack Daniel's", category: whiskey_category, alc_percent: 40, serving: 44, serving_type: 'Shot')
Drink.create(name: "Johnnie Walker Black Label", category: whiskey_category, alc_percent: 40, serving: 44, serving_type: 'Shot')

