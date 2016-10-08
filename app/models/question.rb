class Question < ActiveRecord::Base
	is_impressionable
	acts_as_votable
	validates :title, :user_id, :team_id, presence: true
	belongs_to :user
	belongs_to :team
	has_many :answers
	has_many :comments, as: :commentable
	has_one :document, as: :imageable
	accepts_nested_attributes_for :document
end
