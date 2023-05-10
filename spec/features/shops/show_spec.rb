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
end