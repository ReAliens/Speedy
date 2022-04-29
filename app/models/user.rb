class User < ApplicationRecord
  has_many :items, foreign_key: 'user_id', dependent: :destroy
  has_many :reserveds, foreign_key: 'user_id', dependent: :destroy
end
