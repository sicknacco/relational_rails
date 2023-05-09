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

    xit "shows each pies attributes" do

    end
  end
end