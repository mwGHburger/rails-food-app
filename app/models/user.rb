class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :photo, presence: true
end
