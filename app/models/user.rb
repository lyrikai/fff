class User < ApplicationRecord
    has_many :comments
    belongs_to :city
    has_many :gossips
    has_many :privatemessages
    has_secure_password
end
