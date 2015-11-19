class Session < ActiveRecord::Base
	has_many :documents, as: :imageable
end
