require 'rails_helper'

RSpec.describe 'Food index view', type: :system do
  describe 'Index page' do
    before(:each) do
      @user_1 = User.create(name: 'Tom')
      @user_2 = User.create(name: 'Dianne')
      @food_1 = Food.create(name: 'Apple', measurement_unit: '5kg', price: 1.99, quantity: 3, user_id: 1)
      @food_2 = Food.create(name: 'Pizza', measurement_unit: '5kg', price: 75, quantity: 1, user_id: 2)

      @foods = Food.all
    end

    it 'Can see the names of each food' do
      visit root_path
      @foods.each do |food|
        expect(page).to have_content(food.measurement_unit.to_s)
      end
    end

    it 'Can see the names of each food' do
      visit root_path
      @foods.each do |food|
        expect(page).to have_content(food.name.to_s)
      end
    end

    it 'Can see the price of each food' do
      visit root_path
      @foods.each do |food|
        expect(page).to have_content(food.price)
      end
    end

    it 'Can see the quantity of each food' do
      visit root_path
      @foods.each do |food|
        expect(page).to have_content(food.quantity)
      end
    end

    it 'Can see a button that lets me add new food' do
      visit root_path
      expect(page).to have_content('Add Food')
    end

    it 'Can click on Add Food, to be redirected to a form to add new food' do
      visit root_path
      click_link 'Add Food'
      expect("#{page.current_url}foods/new").to match new_food_path
    end
  end
end

# require 'rails_helper'

# RSpec.describe 'Food index view', type: :system do
#   describe 'Index page' do
#     before(:each) do

#     end
#   end

# end
