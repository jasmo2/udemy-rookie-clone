class CoursesController < ApplicationController
  def destroy
  	course = Course.find(courses_parameters[:id])
  	course.destroy
  	redirect_to :controller => "users", :action => "show"
  end

  def create
  	course = Course.new(owner_id: create_courses_parameters[:owner_id], name: create_courses_parameters[:name], description: create_courses_parameters[:description])
    if course.save
      redirect_to :controller => "users", :action => "index"
    else
      flash[:error] = course.errors
      redirect_to :controller => "users" , :action => "new"

    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
  end
  private
  def courses_parameters
  	params.require(:course).permit(:id)
  end
  def create_courses_parameters
  	params.require(:course).permit(:description, :owner_id, :name)
  end
end
