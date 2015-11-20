class MembersController < ApplicationController

	def index
		@members = Member.all
		@member = Member.new
	end

	def create
		member = Member.create(member_params)

		if member.valid?
			redirect_to root_path
		else
			flash[:error] = "There was a problem saving the photo."
			redirect_to root_path
		end
	end

private

	def member_params
		params.require(:member).permit(:name, :avatar)
	end

end
