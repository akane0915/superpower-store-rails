class Product < ActiveRecord::Base
  validates :name, :price, :country, presence: true
end
