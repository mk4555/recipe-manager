$(function() {
  $(".js-show-recipes").on("click", function() {
    let id = $(this).data("id");
    $.get(`/users/${id}/recipes.json`, function(data) {
      // console.log(data)
      let recipe_details = '';
      console.log(data)
      data.forEach(function(recipe){
        let r = new Recipe(recipe)
        recipe_details += r.renderRecipeWithoutDescription();
      });
      $('#recipes').html(recipe_details);
    });
  });

  $(".js-next-recipe").on("click", function() {
    let nextId = parseInt($(".js-next-recipe").attr("data-id")) + 1;
    $.get(`/recipes/${nextId}.json`, function(recipe) {
      let r = new Recipe(recipe)
      let details = r.renderRecipeWithDescription();
      $(".recipe").html(details);
      let igr = r.renderIngredients();
      $(".ingredients").html(igr);
      let directions = r.renderDirections();
      $(".directions").html(directions);
      let reviews = r.renderReviews();
      $(".reviews").html(reviews);
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
