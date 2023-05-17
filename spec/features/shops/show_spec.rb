require 'rails_helper'

RSpec.describe "Shop's show page", type: :feature do
  before(:each) do
    test_data
  end

  describe "When I visit '/shops/:id'" do
    describe "I see the shop with that id" do
      it "shows attributes of a specific shop" do
        visit "/shops/#{@dub.id}"
        
        expect(page).to have_content(@dub.name)
        expect(page).to have_content(@dub.city)
        expect(page).to have_content(@dub.order_ahead)
        expect(page).to have_content(@dub.employee_count)

        visit "/shops/#{@truck.id}"
        
        expect(page).to have_content(@truck.name)
        expect(page).to have_content(@truck.city)
        expect(page).to have_content(@truck.order_ahead)
        expect(page).to have_content(@truck.employee_count)
      end
      
      it 'can show the number of pie varieties at this shop' do
        visit "/shops/#{@dub.id}"
        
        expect(page).to have_content("Pie Varieties Available: 3")
        
        visit "/shops/#{@truck.id}"
        
        expect(page).to have_content("Pie Varieties Available: 4")
      end
    end
  end
  
  describe "Shop's Pies Index Link" do
    describe "when visiting a shop's show page" do
      it 'has a link that leads to that shops pies' do
        visit "/shops/#{@truck.id}"
        
        expect(page).to have_link("#{@truck.name}'s Pies")
        
        click_link("#{@truck.name}'s Pies")
        
        expect(current_path).to eq("/shops/#{@truck.id}/pies")
        
        visit "/shops/#{@truck.id}"
        
        expect(page).to have_link("#{@truck.name}'s Pies")
        
        click_link("#{@truck.name}'s Pies")
        
        expect(current_path).to eq("/shops/#{@truck.id}/pies")
      end
    end
  end
  
  describe "Shop Update Link" do
    it "has a link to update a specific shop" do
      visit "/shops/#{@truck.id}"
      
      expect(page).to have_link("Update #{@truck.name}")
      
      click_link("Update #{@truck.name}")
      
      expect(current_path).to eq("/shops/#{@truck.id}/edit")
    end
  end
  
  describe "Shop Delete Link" do
    it "has a link to delete a shop and all of it's pies" do
      visit "/shops/#{@truck.id}"
      
      expect(page).to have_button("Delete #{@truck.name}")

      click_button("Delete #{@truck.name}")

      expect(current_path).to eq('/shops')
      expect(page).to_not have_content("#{@truck.name}")

      visit "/shops/#{@dub.id}"
      
      expect(page).to have_button("Delete #{@dub.name}")

      click_button("Delete #{@dub.name}")

      expect(current_path).to eq('/shops')
      expect(page).to_not have_content("#{@dub.name}")
    end
  end
end