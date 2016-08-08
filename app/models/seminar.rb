class Seminar < ActiveRecord::Base
validates :title, :user_id, :team_id, presence: true
belongs_to :user#, dependent: :destroy
belongs_to :team#, dependent: :destroy
has_many :comments, as: :commentable
has_attached_file :document
validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
