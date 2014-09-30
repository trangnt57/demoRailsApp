class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  def index
  	@courses = Course.all
  end

  def new
    @course = Course.new
  end  

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course has been created."
      redirect_to courses_path
    else
      flash[:alert] = "Course has not been created."
      render "new"
    end
  end
    
  def show
  	render :text =>@course.to_json
  end
  
  def edit
  end 

  def update
    if @course.update(course_params)
      flash[:notice] = "Course has been updated."
      redirect_to courses_path
    else
      flash[:alert] = "Course has not been updated."
      render "edit"
    end
  end 

  def destroy
  	@course.destroy
  	
  	redirect_to courses_path
  end

  private 
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :code)
    end
end
