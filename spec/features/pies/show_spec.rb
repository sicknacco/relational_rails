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
  end
  
  describe "page links" do
    it 'has a link to pies index at top of page' do
      visit "/pies/#{@curry.id}"
      expect(page).to have_link("Pies Index")
    end
  end
end