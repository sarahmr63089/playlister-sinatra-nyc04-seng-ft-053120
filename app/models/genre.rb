class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name = self.name.downcase
    slug = name.split(" ").join("-")
    slug
  end

  def self.find_by_slug(slug)
    self.all.find { |genre| genre.slug == slug }
  end

end