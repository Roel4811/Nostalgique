class Song < ApplicationRecord
  validates :name, presence: true
  validates :lyrics, presence: true

  belongs_to :artist
end
