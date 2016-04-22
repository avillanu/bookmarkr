class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :bookmarks
  belongs_to :user
end
