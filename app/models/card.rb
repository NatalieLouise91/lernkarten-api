class Card < ApplicationRecord
    belongs_to :user
    validates :word, :definition, :gender, :sentence, presence: true
end
