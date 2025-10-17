class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy # dependent:... deletes all bookmarks when a list is deleted, but keeps movies intact.
  has_many :movies, through: :bookmarks # joined table bookmarks
  has_many :reviews, dependent: :destroy

  # A list must have a unique name.
  validates :name, presence: true, uniqueness: true
end
