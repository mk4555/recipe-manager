$(function() {
  $(".js-show-recipes").on("click", function() {
    let id = $(this).data("id");
    $.get(`/users/${id}/recipes.json`, function(data) {
      // console.log(data)
      let recipe_details = '';
      data.forEach(function(recipe){
        recipe_details += `<h4><a href="/recipes/${recipe["id"]}"> ${recipe["name"].charAt(0).toUpperCase() + recipe["name"].slice(1)} </a></h4>` +
        `Rating: ${recipe["rating"]}/5 <br/>`+
        `Recipe by: ${recipe["user"]["email"]} <br/>` +
        `Cook Time: ${recipe["cook_time"]} Minutes </br>`
      });
      $('#recipes').html(recipe_details);
    });
  });

  $(".js-next-recipe").on("click", function() {
    let nextId = parseInt($(".js-next-recipe").attr("data-id")) + 1;
    $.get(`/recipes/${nextId}.json`, function(recipe) {
      let r = new Recipe(recipe)
      let details = r.renderRecipe();
      $(".recipe").html(details);
      let igr = r.renderIngredients();
      $(".ingredients").html(igr);
      let directions = r.renderDirections();
      $(".directions").html(directions)
      $(".js-next-recipe").attr("data-id", recipe["id"]);
    });
  });

  $(".js-review-form").submit(function(event){
    event.preventDefault()
    let values = $(this).serialize();
    let posting = $.post(`/reviews`,values)
    posting.done(function(data){
        let review = new Review(data);
        console.log(review)
        let reviewBody = review.renderReviewBody()
        $(".reviews").append(reviewBody);
    });
  });

});
