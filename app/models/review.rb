class Review < ActiveRecord::Base
  validates :author, :presence => true

  belongs_to :product
  validates :author, :presence => true
  validates :content_body, :presence => true, length:{ minimum: 50, too_short:"Please, type more. At least 50 Characters", maximum: 250, too_long:"No more than 250 characters please"}
  validates :rating, :presence => true


  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { greater_than: 0 }
  validates :rating, numericality: { less_than: 6 }
end
