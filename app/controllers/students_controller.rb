class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.create(student_params)

    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:user_errors] = @student.errors.full_messages
      redirect_to new_student_path
    end 
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
      @student.update(student_name_params)

      if @student.update
        redirect_to student_path(@student)
      else
        redirect_to new_student_path
      end 

  end
  


  private 
  def student_params
    params.require(:student).permit(:name, :mod)
    # params.require(:student).permit!
  end

  def student_name_params
    params.require(:student).permit(:name)
    # params.require(:student).permit!
  end




end
