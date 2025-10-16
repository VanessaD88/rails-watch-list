class Movie < ApplicationRecord
  has_many :bookmarks # referencial integrity ensures movie can't be deleted if it’s referenced in a bookmark
  has_many :lists, through: :bookmarks # joined table bookmarks

  # A movie must have a unique title and an overview.
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
