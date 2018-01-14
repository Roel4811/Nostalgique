class Song < ApplicationRecord
  validates :name, presence: true
  validates :lyrics, presence: true

  belongs_to :artist
  belongs_to :member

  mount_uploader :image, ImageUploader

  def current_step
    @current_step || Wizard::Song::STEPS.first
  end

  def artist_name
    self.artist.name
  end
end
