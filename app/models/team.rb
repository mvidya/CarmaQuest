class Team < ActiveRecord::Base
	validates :name, presence: true
	validates_format_of :email, :with => /\A([\w\.%\+\-]+)@carmatec\.com\z/i
	has_many :users, dependent: :destroy
	has_many :questions, dependent: :destroy
end
