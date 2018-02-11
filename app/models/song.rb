class Song < ApplicationRecord
  validates :name, presence: true
  validates :lyrics, presence: true
  validates :image_url, presence: true

  belongs_to :artist
  belongs_to :member

  enum status: [:pending, :active]

  scope :without_deleted, -> { where(songs: { deleted_at: nil }) }
  scope :only_deleted, -> { where.not(songs: { deleted_at: nil }) }

  def current_step
    @current_step || Wizard::Song::STEPS.first
  end

  def artist_name
    self.artist.name if self.artist
  end

  def member_name
    self.member.whole_name if self.member
  end

  private

  def self.search(query)
    if query.present?
      query.strip!
      where('songs.name ILIKE :query', query: "%#{query.downcase}%")
    else
      all
    end
  end

end
