$(function() {
  $(".js-show-recipes").on("click", function() {
    var id = $(this).data("id");
    $.get("/user/" + id + "/recipes.json", function(data) {
      console.log(data)

      // var inventoryText = "<strong>Available</strong>"
      // if (data["inventory"] === 0) {
      //   inventoryText = "<strong>Sold Out</strong>"
      // }
      // var descriptionText = "<p>" + data["description"] + "</p><p>" + inventoryText + "</p>"
      // $("#product-" + id).html(descriptionText);
      // var orders = data["orders"];
      // var orderList = "";
      // orders.forEach(function(order) {
      //   orderList += '<li>' + order["id"] + ' - created at' + order["created_at"] + '</li>';
      // });
      // $("#product-" + id + "-orders").html(orderList);
    });
  });
});
// 
// <% if is_index? %>
//   <h4><%= link_to recipe.capitalized_name, recipe_path(recipe) %></h4>
// <% else %>
//   <h4><%= recipe.capitalized_name %></h4>
// <% end %>
//
// Rating: <%= recipe.rating %> / 5 <br>
// Recipe by: <%= link_to recipe.user.email, user_recipes_path(recipe.user) %> <br>
// Cook Time: <%= recipe.cook_time %> Minutes <br>
//
// <% if is_show?(recipe) %>
//   Description: <%= recipe.description %> <br>
//   Ingredients:
//   <% @recipe.recipe_ingredients.each do |ri| %>
//     <li> <%= ri.quantity %> - <%= ri.capitalized_ingredient %> </li>
//   <% end %>
//
//   Directions:
//   <% recipe.directions.each_with_index do |d,i| %>
//     <li><%=i + 1 %>. <%= d.direction %></li>
//   <% end %>
// <% else %>
//   <button class="js-ingredients" data-id="<%= recipe.id %>">Ingredients</button>
//   <button class="js-directions" data-id="<%= recipe.id %>">Directions</button>
// <% end %>
// <br />
//
//
//
// <% if current_user.id == recipe.user.id && (is_user_nested? || is_show?(recipe)) %>
//   <%= link_to "Add Ingredient", new_recipe_recipe_ingredient_path(recipe, recipe.recipe_ingredients) %> <br />
//   <%= link_to "Edit", edit_recipe_path(recipe) %>
//   <%= link_to "Delete", recipe, method: :delete %>
// <% end %>
// <br>
