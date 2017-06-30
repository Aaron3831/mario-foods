class Review < ActiveRecord::Base
  validates :author, :presence => true
end
