beer = Category.where(name: "Beer", alc_percent: 6).first_or_create
tequila = Category.where(name: "Tequila", alc_percent: 40).first_or_create
vodka = Category.where(name: "Vodka", alc_percent: 40).first_or_create
brandy = Category.where(name: "Brandy", alc_percent: 40).first_or_create
rum = Category.where(name: "Rum", alc_percent: 60).first_or_create
whisky = Category.where(name: "Whisky", alc_percent: 40).first_or_create
red_wine = Category.where(name: "Red Wine", alc_percent: 13).first_or_create
white_wine = Category.where(name: "White Wine", alc_percent: 13).first_or_create

Drink.create(name: "Miller Genuine Draft", category: beer, alc_percent: 5, serving: 340, serving_type: "Bottle")
Drink.create(name: "Amstel Light", category: beer, alc_percent: 3.5, serving: 340, serving_type: "Bottle")
Drink.create(name: "Budweiser", category: beer, alc_percent: 5, serving: 340, serving_type: "Bottle")
Drink.create(name: "Coors Light", category: beer, alc_percent: 4.2, serving: 340, serving_type: "Bottle")
Drink.create(name: "Corona Extra", category: beer, alc_percent: 4.6, serving: 340, serving_type: "Bottle")
Drink.create(name: "San Miguel Premium All-Malt", category: beer, alc_percent: 5, serving: 340, serving_type: "Bottle")
Drink.create(name: "San Miguel Pale Pilsen", category: beer, alc_percent: 5, serving: 340, serving_type: "Bottle")
Drink.create(name: "San Mig Light", category: beer, alc_percent: 5, serving: 340, serving_type: "Bottle")
Drink.create(name: "Red Horse Extra Strong", category: beer, alc_percent: 6.9, serving: 340, serving_type: "Bottle")
Drink.create(name: "San Miguel Super Dry", category: beer, alc_percent: 4.8, serving: 340, serving_type: "Bottle")
Drink.create(name: "1800 Silver (Blanco)", category: tequila , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "1800 Select Silver", category: tequila , alc_percent:  50 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Jose Cuervo Gold", category: tequila , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Jose Cuervo Sliver", category: tequila , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Tequila Rose", category: tequila , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Absolut Vodka", category: vodka , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Stolichnaya Vodka", category: vodka , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Smirnoff", category: vodka , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Grey Goose", category: vodka , alc_percent:  40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Fundador", category: brandy, alc_percent: 40 , serving: 44 , serving_type: "Shot")
Drink.create(name: "Remy Martin", category: brandy, alc_percent: 40 , serving: 44 , serving_type: "Shot")

