class Post < ActiveRecord::Base
  attr_accessible :url, :title, :user_id
  validates_presence_of :url, :title
  has_many :comments
  belongs_to :user
end
