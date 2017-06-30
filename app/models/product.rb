class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, :price, :country, presence: true
  validates :name, uniqueness: true
end
