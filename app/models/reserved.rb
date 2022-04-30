class Reserved < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :item, foreign_key: 'item_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :city, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
end
