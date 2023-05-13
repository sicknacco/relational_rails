require 'rails_helper'

RSpec.describe "Shops index page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit the Shops index page '/shops'" do
    it 'shows the name of each shop in the system' do
      visit '/shops'
      
      expect(page).to have_content(@dub.name)
      expect(page).to have_content(@truck.name)
      expect(page).to have_content(@flushing.name)
    end
    
    it 'lists shops in order from most recently created' do
      visit '/shops'
      
      expect(@flushing.name).to appear_before(@truck.name)
      expect(@truck.name).to appear_before(@dub.name)
      expect(@dub.name).to_not appear_before(@flushing.name)
    end
    
    it 'has a link to create a new shop that leads to a form' do
      visit '/shops'
      
      expect(page).to have_link("New Shop")
      
      click_link("New Shop")
      
      expect(current_path).to eq("/shops/new")
    end
    
    it 'has a link to update each shop record on index page' do
      visit '/shops'

      expect(page).to have_button("Update #{@dub.name}")
      expect(page).to have_button("Update #{@truck.name}")
      expect(page).to have_button("Update #{@flushing.name}")

      click_button("Update #{@dub.name}")

      expect(current_path).to eq("/shops/#{@dub.id}/edit")
    end
  end
end