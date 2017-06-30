require 'rails_helper'

describe "the add a review process" do
  it "adds a review to a product" do
    test_product = Product.create(name: "Flight", price: 12.00, country: "USA")
    visit product_path(test_product)
    click_on 'Write a review and good karma will follow...'
    fill_in 'Author', :with => "person"
    fill_in 'Content', :with => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"
    select('1', :from => 'Rating')
    click_on 'Create Review'
    expect(page).to have_content 'Flight'
  end

  it "gives error when no author, content, or rating is entered" do
    test_product = Product.create(name: "Flight", price: 12.00, country: "USA")
    visit new_product_review_path(test_product)
    fill_in 'Author', :with => ''
    fill_in 'Content', :with => ''
    select('', :from => 'Rating')
    click_button 'Create Review'
    expect(page).to have_content 'errors'
  end
end
