require 'rails_helper'

describe "the delete a review process" do
  it "deletes a review" do
    test_product = Product.create(name: "Flight", price: 12.00, country: "USA")
    test_review = test_product.reviews.create(author: "Sally", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud ", rating: 5)
    visit product_path(test_product.id)
    click_on 'Delete Review'
    expect(page).to have_content 'Review deleted.'
  end
end
