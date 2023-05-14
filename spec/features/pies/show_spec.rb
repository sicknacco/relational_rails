require 'rails_helper'

RSpec.describe "Pie's Show Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When visiting a pie's show page '/pies/:id'" do
    it "shows all the attributes of the selected pie" do
      visit "/pies/#{@curry.id}"
      
      expect(page).to have_content("#{@curry.name}'s Show Page!")
      expect(page).to have_content("Category: #{@curry.category}")
      expect(page).to have_content("Wholesale?: #{@curry.wholesale}")
      expect(page).to have_content("Bake Time: #{@curry.bake_time}")
    end
    
    it "shows all the attributes of a different pie" do
      visit "/pies/#{@chick.id}"
      
      expect(page).to have_content("#{@chick.name}'s Show Page!")
      expect(page).to have_content("Category: #{@chick.category}")
      expect(page).to have_content("Wholesale?: #{@chick.wholesale}")
      expect(page).to have_content("Bake Time: #{@chick.bake_time}")
    end

    it 'has a link to update this specific pie' do
      visit "/pies/#{@sausage.id}"

      expect(page).to have_link("Update #{@sausage.name}")

      click_link("Update #{@sausage.name}")

      expect(current_path).to eq("/pies/#{@sausage.id}/edit")
    end
  end

  describe "Pie Delete Link" do
    it "has a link to delete a pie" do
      visit "/pies/#{@sausage.id}"
      
      expect(page).to have_link("Delete #{@sausage.name}")
      click_link("Delete #{@sausage.name}")
      
      expect(current_path).to eq('/pies')

      expect(page).to_not have_content("#{@sausage.name}")

      visit "/pies/#{@steak.id}"
      
      expect(page).to have_link("Delete #{@steak.name}")

      click_link("Delete #{@steak.name}")

      expect(current_path).to eq('/pies')
      expect(page).to_not have_content("#{@steak.name}")
    end
  end
end