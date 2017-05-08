class SchoolsController < ApplicationController
  before_action :check_login

  def index
    @schools = School.all.alphabetical
  end

  def edit
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      respond_to do |format|
        name = "Created " + @school.name
        format.html { redirect_to new_order_path, notice: name } 
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to new_order_path}
        format.js 
      end
    end
  end

  private


  def school_params
    params.require(:school).permit(:name, :street_1, :street_2, :city, :state, :zip, :min_grade, :max_grade, :active)
  end
  
end 