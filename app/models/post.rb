require 'uri'

class Post < ActiveRecord::Base
  paginates_per 30
  attr_accessible :url, :title
  validates_presence_of :url, :title
  validate :valid_url
  has_many :comments
  belongs_to :user
  acts_as_voteable

  private

	def valid_url
	  uri = URI.parse(url)
    errors.add(:url, "is invalid") unless uri.kind_of?(URI::HTTP)
	end
end