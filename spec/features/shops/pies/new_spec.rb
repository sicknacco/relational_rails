require 'rails_helper'

RSpec.describe "Shop's new pie form" do
  before(:each) do
    test_data
  end

  describe "Shop's pie creation form" do
    describe "It can create a new pie for a specific shop" do
      it 'can verify form elements' do
        visit "/shops/#{@dub.id}/pies/new"
        
        expect(page).to have_field('name')
        expect(page).to have_field('category')
        expect(page).to have_field('bake_time')
        expect(page).to have_unchecked_field
        expect(page).to have_button("Create Pie")
      end
      
      it "fills in a form to create a new pie for a shop" do
        visit "/shops/#{@dub.id}/pies/new"
        fill_in(:name, with: 'Egg and Cheese')
        fill_in(:category, with: 'Breakfast')
        fill_in(:bake_time, with: 30)
        check(:wholesale)
        click_button("Create Pie")
        
        expect(current_path).to eq("/shops/#{@dub.id}/pies")
        expect(page).to have_content("Egg and Cheese")
      end
      
      it "won't let a form be submitted if a field is left empty" do
        visit "/shops/#{@dub.id}/pies/new"
        
        click_button("Create Pie")

        expect(page).to have_content("Error: You must complete all fields")
      end
    end
  end
end