class Airline < ApplicationRecord
  has_many :reviews

  before_create :slugify

  # Slugify airline name into a url safe param before create
  # Ex: 'United Airlines'.parameterize => 'united-airlines'
  def slugify
    self.slug = name.parameterize
  end

  # Get the average score of all review for an airline
  def avg_score
    reviews.average(:score).round(2).to_f
  end
end
