# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i = Ingredient.all
i.destroy_all
puts('all ingredients deleted')
Ingredient.create(name: "pasta")
Ingredient.create(name: "rice")
Ingredient.create(name: "chorizo")
Ingredient.create(name: "salt")
Ingredient.create(name: "pepper")
Ingredient.create(name: "olive oil")
Ingredient.create(name: "lemon")



Recipe.destroy_all
IngredientsRecipe.destroy_all

Recipe.create(title: "Pesto Pasta", preparation: 'Ingredients out // Kettle boiled // Large frying pan - high heat // Large lidded casserole pan, high heat // Food processor (bowl blade).
	On a large sheet of greaseproof paper, toss the chicken with salt, pepper, fennel seeds and the rosemary leaves • Fold over the paper, then bash and flatten the chicken to 1.5cm thick with a rolling pin • Put into the frying pan with the rapeseed oil, the bashed unpeeled garlic cloves and halved chillies, turning after about 3 or 4 minutes, until golden and cooked through • Line the beans up and cut off the stalks, put into the casserole pan, cover with boiling salted water and cook for 6 minutes with the lid on. 

	Pick a few basil leaves for garnish, then rip off the stalks and put the rest of the bunch into the processor with the almonds, Parmesan, extra virgin olive oil and lemon juice • Squash in the unpeeled garlic through a garlic crusher • Blitz until smooth, adding a ladle or two of cooking water from the beans to loosen, then season to taste • Slice the lasagne sheets up into random handkerchief shapes and add to the beans to cook for a couple of minutes • Halve or quarter the tomatoes, add to the chicken and give the pan a shake.

	Stir the spinach into the pasta pan, then drain, reserving a cupful of the starchy cooking water • Return the pasta, beans and spinach to the pan, pour in the pesto from the processor and stir together, loosening with splashes of cooking water until silky • Slice the chicken breasts in half and serve with the tomatoes and chilli spooned over the top • Finely grate a little extra Parmesan over the pasta, then sprinkle everything with basil leaves.', time: 15 )

Recipe.create(title: "Chorizo Carbonara", preparation: 'Ingredients out // Kettle boiled // Large frying pan, medium heat // Large lidded pan, high heat.
	Toast the pine nuts in the frying pan for a few minutes, tossing often • Put the pasta into the lidded pan, cover with boiling salted water and cook according to packet instructions • Finely slice the stalk ends of the chicory and click apart the upper leaves into a serving bowl • Peel and finely slice the clementines, add to the bowl with the baby spinach, then pick over the mint leaves • Shave over a tiny bit of Manchego and scatter with the hot nuts, returning the frying pan to a medium heat.

	In a cup, make your dressing with the vinegar, extra virgin olive oil and honey, then season to taste and put aside • Finely slice the chorizo, chilli and rosemary leaves and put into the frying pan with 1 teaspoon of olive oil and a pinch of pepper, then squash in the unpeeled garlic through a garlic crusher and move everything around until lightly golden.

	Beat the egg, lemon juice, yoghurt and remaining finely grated Manchego together in a bowl • Drain the pasta, reserving a cupful of the starchy cooking water • Toss the pasta into the chorizo pan, remove from the heat and mix well with the creamy sauce, loosening with a splash of cooking water, if needed, then season to taste • Dress and toss the salad, then serve with the pasta.', time: 15)

IngredientsRecipe.create(recipe_id: Recipe.first.id, ingredient_id: Ingredient.first.id, quantity: 200, measure: "grams")
IngredientsRecipe.create(recipe_id: Recipe.last.id, ingredient_id: Ingredient.last.id, quantity: 200, measure: "grams")
#RecipeWithIngredient.create(recipe_id: Recipe.last.id, ingredient_id: Ingredient.new.id, quantity: 70, measure: "grams")


