class Card < ApplicationRecord
  belongs_to :user, required: true
end
