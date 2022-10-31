class Tag < ApplicationRecord
    has_many :taglists
    has_many :gossips, through: :taglists
end
