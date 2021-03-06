class LecturesController < ApplicationController
  before_action :check_login, only: [:new, :edit]
  before_action :set_navbar
  
  
  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(set_lecture)
    @lecture.lecturer_id = params[:lecture][:lecturer]
    lecture_categories = params.require(:lecture_categories).permit(:category)
    # params 정보 가져오는 방법
    respond_to do |format|
      if @lecture.save
        lecture_categories[:category].split(",").each do |ctg|
          LectureCategory.new(lecture_id: @lecture.id, lec_category: ctg).save
        end
        format.html { redirect_to @lecture, notice: 'Lecturer was successfully created.' }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end
  
  def update
    
  end
  
  def destroy
    Lecture.find(params[:id]).destroy
    redirect_to :back
  end
  
  def show
    @lecture = Lecture.find_by(id: params[:id])
    @reviews = Review.where(lecture_id: params[:id])
    @review = Review.new
  end
  
  def create_review
    @review = Review.new(params.require(:review).permit(:sex, :age, :background, :point, :recommend, :content))
    @review.lecture_id = params[:review][:lecture]
    @review.save
    redirect_to lecture_path(params[:review][:lecture])
  end
  
  private
    def check_login
        if session[:id] == nil
          flash[:alert] = "로그인이 필요한 기능입니다. 로그인해주세요!"
          redirect_to login_login_path
        end 
    end
    
    def set_lecture
      params.require(:lecture).permit(:title, :subject, :time, :subject, :lec_poster, :intro)
    end
end
