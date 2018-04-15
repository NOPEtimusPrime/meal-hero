require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  it "is valid with a name" do
    recipe = FactoryGirl.build(:recipe)
    recipe.valid?
    expect(recipe.errors).to be_blank
  end
  
  it "is invalid without a name" do
    recipe = FactoryGirl.build(:recipe, name: nil)
    recipe.valid?
    expect(recipe.errors[:name]).to include("can't be blank")
  end
  
  it "is valid when quick" do
    recipe = FactoryGirl.build(:recipe, quick: true)
  end
  
end
