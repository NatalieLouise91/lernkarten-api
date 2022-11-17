class Card < ApplicationRecord
    validates :word, :definition, :gender, :sentence, presence: true
end
