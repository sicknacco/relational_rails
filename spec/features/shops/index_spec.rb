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
  end
end