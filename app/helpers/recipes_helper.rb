module RecipesHelper

  def is_index?
    current_page?(root_path) || current_page?(recipes_path) || is_user_nested?
  end

  def is_user_nested?
    params[:user_id]
  end

  def is_show?(recipe)
    current_page?(recipe_path(recipe))
  end
end
