require 'rails_helper'

RSpec.describe "dish showpage" do
  before :each do
    @chef = Chef.create!(name: "Chef Terry")
    @dish = Dish.create!(name: "Curry", description: "Tasty Curry", chef_id: @chef.id)
    @ingredient1 = Ingredient.create!(name: "poltato", calories: 10)
    @ingredient2 = Ingredient.create!(name: "tomto", calories: 5)
    @ingredient3 = Ingredient.create!(name: "chimken", calories: 15)
    @d_i1 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish.id)
    @d_i2 = DishIngredient.create!(ingredient_id: @ingredient2.id, dish_id: @dish.id)
    @d_i3 = DishIngredient.create!(ingredient_id: @ingredient3.id, dish_id: @dish.id)

    visit "/dishes/#{@dish.id}"
  end

  it "Has the Dish's information" do
    expect(page).to have_content("Curry")
    expect(page).to have_content("Tasty Curry")
  end

  it "lists the ingredients for the dish" do
    expect(page).to have_content("poltato")
    expect(page).to have_content("tomto")
    expect(page).to have_content("chimken")
  end

end
