class AddQuickToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :quick, :boolean, default: false
  end
end
