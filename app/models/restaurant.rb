class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian], message: 'Caterory is not in the list (chinese, italian, japanese, french, belgian)' }
  has_many :reviews, dependent: :destroy
  before_validation { self.category = self.category.downcase }
end
