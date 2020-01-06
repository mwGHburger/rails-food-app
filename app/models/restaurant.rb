class Restaurant < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user

    has_one_attached :display_photo
    has_many_attached :menu_photos
    has_many_attached :food_photos
    has_many_attached :ambience_photos
    
    validates :name, presence: true
    validates :address, presence: true
    validates :cuisine, presence: true
    validates :description, presence: true
end
