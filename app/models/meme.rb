class Meme < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    has_one_attached :picture

    has_many :comments
end
