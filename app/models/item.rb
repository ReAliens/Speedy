class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :reserveds, foreign_key: 'item_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :photo, presence: true
  validates :specs, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 3, maximum: 200 }
  validates :price, presence: true, comparison: { greater_than: 0 }
end
