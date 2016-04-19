module ApplicationHelper
	def teams
	  Team.all
  end
  def admin_team
  	Team.where.not(:name => "admin")
  end
end
