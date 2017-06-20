class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :favorites
  has_many :members, :through => :favorites, :source => :user
  validates :title, presence: true
end
