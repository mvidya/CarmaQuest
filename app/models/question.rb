class Question < ActiveRecord::Base
	validates :title, :user_id, :team_id, presence: true
	belongs_to :user
	belongs_to :team
	has_many :answers
end
