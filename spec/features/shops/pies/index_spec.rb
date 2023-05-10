require 'rails_helper'

RSpec.describe "Shop Pie's index Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit '/shops/:parent_id/pies'" do
    it "shows each pie that is associated with this shop" do
      visit "/shops/#{@dub.id}/pies"
      
      expect(page).to have_content(@dub.name)
      expect(page).to have_content(@mince.name)
      expect(page).to have_content(@mush.name)
      expect(page).to have_content(@curry.name)
      expect(page).to_not have_content(@spin.name)
    end
    
    it "shows each pies attributes" do
      visit "/shops/#{@dub.id}/pies"

      within "#pies_#{@mince.id}" do
        expect(page).to have_content(@mince.name)
        expect(page).to have_content(@mince.category)
        expect(page).to have_content(@mince.wholesale)
        expect(page).to have_content(@mince.bake_time)
        expect(page).to_not have_content(@spin.name)
      end
      
      within "#pies_#{@mush.id}" do
        expect(page).to have_content(@mush.name)
        expect(page).to have_content(@mush.category)
        expect(page).to have_content(@mush.wholesale)
        expect(page).to have_content(@mush.bake_time)
        expect(page).to_not have_content(@spin.name)
      end

      within "#pies_#{@curry.id}" do
        expect(page).to have_content(@curry.name)
        expect(page).to have_content(@curry.category)
        expect(page).to have_content(@curry.wholesale)
        expect(page).to have_content(@curry.bake_time)
        expect(page).to_not have_content(@spin.name)
      end
    end
  end
end