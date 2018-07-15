module RecipesHelper
  
  def icons(recipe)
    html = ''
    
    html << %Q{<i class="far fa-clock"></i>}if recipe.quick == true
    
    return html.html_safe
  end
  
end
