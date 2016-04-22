class Bookmark < ActiveRecord::Base
  validates :title, :url, presence: true
  belongs_to :user
  belongs_to :category
  include PgSearch
  multisearchable :against => [:description, :title]
end
