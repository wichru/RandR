class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :noticifations, foreign_key: :recipient_id
  has_many :leaves, dependent: :destroy

  has_one_attached :image
end
