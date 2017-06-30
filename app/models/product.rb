class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :name, :price, :country, presence: true
  validates :name, uniqueness: true

  scope :alphabetical, -> {( order(name: :asc))}

  scope :most_reviews, -> {(
    select("products.id, products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    )}
end
