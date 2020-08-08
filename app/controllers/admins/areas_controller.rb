class Admins::AreasController < ApplicationController
	before_action :authenticate_admin!
	def index
		@areas = Area.all
	end

	def show
		@area = Area.find(params:[id])
		@araes = Area.all
	end

	def new
		@area = Area.new
	end

	def create
		@area = Area.new(area_params)
		if @area.save
			redirect_to admin_areas_path(@area), notice: "投稿に成功しました。"
		else
			render :new
		end
	end

	private
	def area_params
		params.require(:area).permit(:title, :body, :image)
	end
end

