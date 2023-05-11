require 'rails_helper'

RSpec.describe "Shop Edit Form '/shops/:id/edit'" do
  before(:each) do
    test_data
    visit "/shops/#{@truck.id}/edit"
  end

  describe "I see a form to edit the parent's attributes" do
    describe "It can update a selected shop" do
      it "can verify form elements" do
        expect(current_path).to eq("/shops/#{@truck.id}/edit")
        expect(page).to have_field('name')
        expect(page).to have_field('city')
        expect(page).to have_field('employee_count')
        expect(page).to have_unchecked_field
        expect(page).to have_button("Update Shop")
      end

      it "fills in the form to edit and clicks a link to update the record" do
        fill_in(:name, with: 'The Pie Truck')
        fill_in(:city, with: 'Moves Around')
        fill_in(:employee_count, with: 4)
        check(:order_ahead)
        click_button("Update Shop")

        expect(current_path).to eq("/shops/#{@truck.id}")
        expect(page).to have_content("The Pie Truck")
      end

      it "won't let a form be submitted if a field is left empty" do
        click_button("Update Shop")

        expect(page).to have_content("Error: You must complete all fields")
      end
    end
  end
end