require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    test_product = Product.create(name: "Flight", price: 12.00, country: "USA")
    visit product_path(test_product.id)
    click_on 'Edit Super Power'
    fill_in 'Name', :with => 'Fly high'
    fill_in 'Price', :with => '100.00'
    fill_in 'Country', :with => 'United States of America'
    click_on 'Make it happen'
    expect(page).to have_content 'Fly high'
  end

  it "gives error when no name, price, or country is entered" do
    test_product = Product.create(name: "Flight", price: 12.00, country: "USA")
    visit edit_product_path(test_product.id)
    fill_in 'Name', :with => ''
    fill_in 'Price', :with => ''
    fill_in 'Country', :with => ''
    click_on 'Make it happen'
    expect(page).to have_content 'errors'
  end
end
