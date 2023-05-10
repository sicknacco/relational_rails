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
  
    describe "page links" do
      it 'has a link to pies index at top of page' do
        visit '/shops'
        expect(page).to have_link("Pies Index")
      end
    end
  end
end