module RecipesHelper

  def is_index?
    current_page?(root_path) || current_page?(recipes_path) || is_user_nested?
  end

  def is_user_nested?
    params[:user_id]
  end

  def recipes_owner?
    current_user.id == params[:user_id].to_f
  end

  def is_show?(recipe)
    current_page?(recipe_path(recipe)) || current_page?(user_recipe_path(recipe.user, recipe))
  end
end
