class Gossip < ApplicationRecord
    has_many :taglists
    belongs_to :user
    has_many :tags, through: :taglists


    validates :title, length: { minimum: 3 }
    validates :title, length: { maximum: 14 }
    validates :title, presence: true
    
    validates :content, presence: true
end
