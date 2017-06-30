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

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :country, -> { where(country: "USA") }

end
