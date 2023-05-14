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
      
      within "#pies_#{@mush.id}" do
        expect(page).to have_content("Name: #{@mush.name}")
        expect(page).to have_content("Category: #{@mush.category}")
        expect(page).to have_content("Wholesale?: #{@mush.wholesale}")
        expect(page).to have_content("Bake Time: #{@mush.bake_time}")
      end
      
      within "#pies_#{@spin.id}" do
        expect(page).to have_content("Name: #{@spin.name}")
        expect(page).to have_content("Category: #{@spin.category}")
        expect(page).to have_content("Wholesale?: #{@spin.wholesale}")
        expect(page).to have_content("Bake Time: #{@spin.bake_time}")
      end
    end
    
    it 'only shows pies where wholesale is true' do
      visit '/pies'
      
      expect(page).to have_content("Name: #{@m_c.name}")
      expect(page).to have_content("Category: #{@m_c.category}")
      expect(page).to have_content("Wholesale?: #{@m_c.wholesale}")
      expect(page).to have_content("Bake Time: #{@m_c.bake_time}")
      
      expect(page).to have_content("Name: #{@cherry.name}")
      expect(page).to have_content("Category: #{@cherry.category}")
      expect(page).to have_content("Wholesale?: #{@cherry.wholesale}")
      expect(page).to have_content("Bake Time: #{@cherry.bake_time}")
      
      expect(page).to have_content("Name: #{@steak.name}")
      expect(page).to have_content("Category: #{@steak.category}")
      expect(page).to have_content("Wholesale?: #{@steak.wholesale}")
      expect(page).to have_content("Bake Time: #{@steak.bake_time}")
      
      expect(page).to_not have_content(@curry.name)
      expect(page).to_not have_content(@sausage.name)
      expect(page).to_not have_content(@chick.name)
    end
  end
  
  describe "There is a link next to each record to update that record" do
    it 'can click a link that leads to the form to update a pie' do
      visit '/pies'
      
      expect(page).to have_link("Edit #{@m_c.name}")
      expect(page).to have_link("Edit #{@cherry.name}")
      expect(page).to have_link("Edit #{@steak.name}")
      click_link("Edit #{@m_c.name}")

      expect(current_path).to eq("/pies/#{@m_c.id}/edit")
    end
  end
end