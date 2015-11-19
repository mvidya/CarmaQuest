class DocumentsController < ApplicationController

	def index
		@imageable = find_imageable
		@documents = @imageable.documents
	end
	
# this method will loop each params and find params ending with "_id"
def find_imageable
	params.each do |name, value|
		if name =~ /(.+)_id$/   
			return $1.classify.constantize.find(value)
		end
	end
	nil
end

end
