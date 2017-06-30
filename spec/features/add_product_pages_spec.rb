require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'New Super Power'
    fill_in 'Name', :with => 'Flight'
    fill_in 'Price', :with => '1000000000.00'
    fill_in 'Country', :with => 'USA'
    click_on 'Make it happen'
    expect(page).to have_content 'Super Powers for Purchase'
  end

  it "gives error when no name, price, or country is entered" do
    visit new_product_path
    click_on 'Make it happen'
    expect(page).to have_content 'errors'
  end
end
