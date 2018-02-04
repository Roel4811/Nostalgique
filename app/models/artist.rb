class Artist < ApplicationRecord
  has_many :songs

  private

  def self.search(query)
    if query.present?
      query.strip!
      where('artists.name ILIKE :query', query: "%#{query.downcase}%")
    else
      all
    end
  end
end
