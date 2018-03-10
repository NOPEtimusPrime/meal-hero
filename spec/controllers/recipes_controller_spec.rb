require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  let(:valid_attributes) {
    {name: 'Sesame Chicken'}
  }

  let(:invalid_attributes) {
    {name: nil}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      recipe = Recipe.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      recipe = Recipe.create! valid_attributes
      get :show, params: {id: recipe.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      recipe = Recipe.create! valid_attributes
      get :edit, params: {id: recipe.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Recipe" do
        expect {
          post :create, params: {recipe: valid_attributes}, session: valid_session
        }.to change(Recipe, :count).by(1)
      end

      it "redirects to the list of all recipes" do
        post :create, params: {recipe: valid_attributes}
        expect(response).to redirect_to(action: "index", notice: 'Recipe was successfully created.')
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {recipe: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'Mongolian Beef'}
      }

      it "updates the requested recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, params: {id: recipe.to_param, recipe: new_attributes}, session: valid_session
        recipe.reload
        expect(recipe.reload.name).to eq "Mongolian Beef"
      end

      it "redirects to the recipe" do
        recipe = Recipe.create! valid_attributes
        put :update, params: {id: recipe.to_param, recipe: valid_attributes}, session: valid_session
        expect(response).to redirect_to(recipe)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        recipe = Recipe.create! valid_attributes
        put :update, params: {id: recipe.to_param, recipe: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested recipe" do
      recipe = Recipe.create! valid_attributes
      expect {
        delete :destroy, params: {id: recipe.to_param}, session: valid_session
      }.to change(Recipe, :count).by(-1)
    end

    it "redirects to the recipes list" do
      recipe = Recipe.create! valid_attributes
      delete :destroy, params: {id: recipe.to_param}, session: valid_session
      expect(response).to redirect_to(recipes_url)
    end
  end

end
