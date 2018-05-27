class Recipe{
  constructor(recipe){
    this.id = recipe.id;
    this.name = recipe.name;
    this.rating = recipe.rating;
    this.cook_time = recipe.cook_time;
    this.description = recipe.description;
    this.user = recipe.user;
    this.recipe_ingredients = recipe.recipe_ingredients;
    this.ingredients = recipe.ingredients;
    this.directions = recipe.directions;
  }
}

Recipe.prototype.capitalizedName = function() {
  return this.name.charAt(0).toUpperCase() + this.name.slice(1);
}

Recipe.prototype.renderName = function(){
  return `<h4> ${this.capitalizedName()}</h4>`
}

Recipe.prototype.renderNameWithLink = function() {
  return `<h4><a href="/recipes/${this.id}"> ${this.capitalizedName()} </a></h4>`
}

Recipe.prototype.renderRating = function(){
return  `Rating: ${this.rating}/5 <br>`
}

Recipe.prototype.renderCookTime = function() {
  return `Cook Time: ${this.cook_time} <br>`
}

Recipe.prototype.renderDescription = function() {
  return `Description: ${this.description} <br>`
}

Recipe.prototype.renderCreator = function(){
  return `Recipe by: <a href='/users/${this.user.id}/recipes'>${this.user.email}</a> <br>`
}

Recipe.prototype.renderRecipeWithDescription = function(){
  return this.renderName() + this.renderRating() + this.renderCreator() + this.renderCookTime() + this.renderDescription();
}

Recipe.prototype.renderRecipeWithoutDescription = function(){
  return this.renderNameWithLink() + this.renderRating() + this.renderCreator() + this.renderCookTime();
}

Recipe.prototype.renderIngredients = function() {
  let list = ""
  this.recipe_ingredients.forEach((ri,index) => {
    list += `<li>${ri.quantity} - ${this.ingredients[index].name}</li>`
  });
  return list;
}

Recipe.prototype.renderDirections = function() {
  let directions = ""
  this.directions.forEach(function(direction, index){
    directions += `<li>${index + 1}. ${direction["direction"]}`
  });
  return directions;
}
