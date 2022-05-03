class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  has_many :items, foreign_key: 'user_id', dependent: :destroy
  has_many :reserveds, foreign_key: 'user_id', dependent: :destroy
end
