class Answer < ActiveRecord::Base
	validates :user_id, :question_id, :description , presence: true
	belongs_to :question
end
