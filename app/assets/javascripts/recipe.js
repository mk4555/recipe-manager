$(function() {
  $(".js-show-recipes").on("click", function() {
    var id = $(this).data("id");
    $.get("/users/" + id + "/recipes.json", function(data) {
      // console.log(data)
      var recipe_details = '';
      data.forEach(function(recipe){
        recipe_details += `<h4><a href="/recipes/${recipe["id"]}"> ${recipe["name"].charAt(0).toUpperCase() + recipe["name"].slice(1)} </a></h4>` +
        `Rating: ${recipe["rating"]}/5 <br/>`+
        `Recipe by: ${recipe["user"]["email"]} <br/>` +
        `Cook Time: ${recipe["cook_time"]} Minutes </br>`
      });
      $('#recipes').html(recipe_details);
    });
  });
});

$(function () {
  $(".js-next-recipe").on("click", function() {
    var nextId = parseInt($(".js-next-recipe").attr("data-id")) + 1;
    $.get("/recipes/" + nextId + ".json", function(recipe) {
      console.log(recipe)
      $("#name").html(`<h4><a href='/recipes/${recipe["id"]}'> ${recipe["name"].charAt(0).toUpperCase() + recipe["name"].slice(1)}</a></h4>`)
      $(".rating").html(`Rating: ${recipe["rating"]}/5`);
      $(".email").html(`Recipe by: <a href='/users/${recipe["user"]["id"]}/recipes'>${recipe["user"]["email"]}</a>`);
      $(".cookTime").html(`Cook Time: ${recipe["cook_time"]}`);
      $(".description").html(`Description: ${recipe["description"]}`);
      $(".js-next").attr("data-id", recipe["id"]);
    });
  });
});
