require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: "Chef Terry")
      @dish = Dish.create!(name: "Curry", description: "Tasty Curry", chef_id: @chef.id)
      @i1 = Ingredient.create!(name: "poltato", calories: 10)
      @i2 = Ingredient.create!(name: "tomto", calories: 5)
      @i3 = Ingredient.create!(name: "chimken", calories: 15)
      @d_i1 = DishIngredient.create!(ingredient_id: @i1.id, dish_id: @dish.id)
      @d_i2 = DishIngredient.create!(ingredient_id: @i2.id, dish_id: @dish.id)
      @d_i3 = DishIngredient.create!(ingredient_id: @i3.id, dish_id: @dish.id)
    end

    describe '.dish ingredients' do
      it 'returns a list of ingredients in the dish' do
        require 'pry' ; binding.pry
        expect(@dish.dish_ingredients.length).to eq(3)
      end
    end
  end

end
