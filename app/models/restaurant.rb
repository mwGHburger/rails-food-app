class Restaurant < ApplicationRecord
    has_many :reviews, dependent: :destroy
    belongs_to :user
    
    validates :name, presence: true
    validates :address, presence: true
    validates :cuisine, presence: true
    validates :description, presence: true
end
