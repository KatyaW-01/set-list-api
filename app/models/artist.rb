class Artist < ApplicationRecord
  has_many :songs

  def average_song_length
    song.average(:length)
  end
end