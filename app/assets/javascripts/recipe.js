$(function() {
  $(".js-show-recipes").on("click", function() {
    var id = $(this).data("id");
    $.get("/users/" + id + "/recipes.json", function(data) {
      // console.log(data)
      var recipe_details = ''
      data.forEach(function(recipe){
        recipe_details += "<h4>" + recipe["name"] + "</h4>" +
        "Rating: " + recipe["rating"] + "</br>" +
        "Recipe by: " + recipe["user"]["email"] + "</br>" +
        "Cook Time: " + recipe["cook_time"] + " Minutes" + "</br>"
      })

      // var recipe_name = "<h4><%= link_to " + data["name"] + ".capitalized_name, recipe_path(recipe) %></h4>"
      $('#recipes').html(recipe_details)


      // <% if is_index? %>
      //   <h4><%= link_to recipe.capitalized_name, recipe_path(recipe) %></h4>
      // <% else %>
      //   <h4><%= recipe.capitalized_name %></h4>
      // <% end %>
      //
      // Rating: <%= recipe.rating %> / 5 <br>
      // Recipe by: <%= link_to recipe.user.email, user_recipes_path(recipe.user) %> <br>
      // Cook Time: <%= recipe.cook_time %> Minutes <br>

    });
  });
});
