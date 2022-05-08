class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  
  has_many :items, foreign_key: 'user_id', dependent: :destroy
  has_many :reserveds, foreign_key: 'user_id', dependent: :destroy

  # validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end
