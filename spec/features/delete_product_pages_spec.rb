require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    test_product = Product.create(name: "Flight", price: 12.00, country: "USA")
    visit product_path(test_product.id)
    click_on 'Delete Super Power'
    expect(page).to have_content 'Super power destroyed!'
  end
end
