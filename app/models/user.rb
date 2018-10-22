class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications, foreign_key: :recipient_id
  has_many :leaves, dependent: :destroy

  scope :admins, -> { where(admin: true) }
end
