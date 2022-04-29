class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :reserveds, foreign_key: 'item_id', dependent: :destroy
end
