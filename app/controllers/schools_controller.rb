class SchoolsController < ApplicationController
  before_action :check_login


  def new
    @school = School.new
  end


  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to order_path(@school), notice: "Created #{@school.name}."
    else
      render action: 'new'
    end

    # if @school.save
    #   format.html { redirect_to @school, notice: 'School was successfully created.' }
    #   format.json { render action: 'show', status: :created, location: @school }
    #   # @town = @attraction.town
    #   # @attractions = @town.attractions.alphabetical.to_a
    #   format.js
    # else
    #   format.html { render action: 'new'}
    #   format.json { render json: @school.errors, status: :unprocessable_entity }
    #   # @town = @attraction.town
    #   # @attractions = @town.attractions.alphabetical.to_a
    #   format.js 
    # end
  end

  private


  def school_params
    params.require(:school).permit(:name, :street_1, :street_2, :city, :state, :zip, :min_grade, :max_grade, :active)
  end
  
end