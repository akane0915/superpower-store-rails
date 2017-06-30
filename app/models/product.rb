class Product < ActiveRecord::Base
  has_many :reviews
  
  validates :name, :price, :country, presence: true
end
