require 'rails_helper'

RSpec.describe "Pies Index Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit the Pie index page I see every pie and the following:" do
    it 'shows all pies and their attributes' do
      visit '/pies'

      within "#pies_#{@mince.id}" do
        expect(page).to have_content("Name: #{@mince.name}")
        expect(page).to have_content("Category: #{@mince.category}")
        expect(page).to have_content("Wholesale?: #{@mince.wholesale}")
        expect(page).to have_content("Bake Time: #{@mince.bake_time}")
      end
    end
  end
end