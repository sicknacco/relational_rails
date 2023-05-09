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
      end
    end
  end
end