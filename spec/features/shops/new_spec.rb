require 'rails_helper'

RSpec.describe "New Shops Form", type: :feature do
  before(:each) do
    test_data
    visit '/shops/new'
  end

  describe "New shop page '/shops/new" do
    describe "It can create a new shop" do
      it "can verify form elements" do
        expect(current_path).to eq('/shops/new')
        expect(page).to have_field('name')
        expect(page).to have_field('city')
        expect(page).to have_field('employee_count')
        expect(page).to have_unchecked_field
        expect(page).to have_button("Create Shop")
      end

      it "fills in a form for a new shop and clicks a link to create a new record" do
        fill_in(:name, with: 'New Shop on Block')
        fill_in(:city, with: 'That big one')
        fill_in(:employee_count, with: 12)
        check(:order_ahead)
        click_button("Create Shop")
        expect(current_path).to eq('/shops')
        expect(page).to have_content("New Shop on Block")
      end

      it "won't let a form be submitted if a field is left empty" do
        
        click_button("Create Shop")

        expect(page).to have_content("Error: You must complete all fields")
      end
    end
  end
end