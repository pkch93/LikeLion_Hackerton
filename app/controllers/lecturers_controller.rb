class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]
  before_action :set_navbar, except: [:new]

  def index
    @new_lecturers = Lecturer.all.order(id: :desc).limit(5)
    @popular_lecturers = Lecturer.all.order(:id).limit(5)
    @lecturer_count = Lecturer.all.count
    @lecture_count = Lecture.all.count
    @review_count = Review.all.count
  end

  def show
   @lectures = Lecture.where(lecturer: @lecturer.id) # 해당 강사의 강연 정보들 가져오기
  end
  
  def new
    @lecturer = Lecturer.new
  end

  def edit
  end

  def create
    @lecturer = Lecturer.new(lecturer_params)
    @lecturer.phone = params[:phone1] + params[:phone2] + params[:phone3] 
    @lecturer.email = params[:email] + "@" + params[:email_domain]
    lecturer_categories = params.require(:lecturer_categories).permit(:category)
    respond_to do |format|
      if @lecturer.save
        lecturer_categories[:category].split(",").each do |ctg|
          LecturerCategory.new(lecturer_id: @lecturer.id, category: ctg).save
        end
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lecturer.phone = params[:phone1] + params[:phone2] + params[:phone3] 
    @lecturer.email = params[:email] + "@" + params[:email_domain]
    lecturer_categories = params.require(:lecturer_categories).permit(:category)
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        current_ctg = LecturerCategory.where(lecturer_id: @lecturer.id)
        lecturer_categories[:category].split(",").each do |ctg|
            count = 0
            if current_ctg[count].nil?
              LecturerCategory.new(category: ctg, lecturer_id: @lectruer.id).save
            else 
              current_ctg[count].update(category: ctg)
              count += 1
            end
        end
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecturer }
      else
        format.html { render :edit }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lecturers/1
  # DELETE /lecturers/1.json
  def destroy
    @lecturer.destroy
    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: 'Lecturer was successfully destroyed.' }
      format.json { head :no_content }
    end
    session[:id] = nil
    @current_user = nil
  end
  
  def search
    @lecturers = Lecturer.where("NAME LIKE ?", "%#{params[:search_lec]}%").order(:name)
  end
  
  def ctgsearch
    categories = params.permit(:category)
    keywords = categories[:category].split(",")
    @lecturers = Lecturer.where(id: LecturerCategory.includes(:lecturer).select(:lecturer_id).where(category: keywords))
    render lecturers_search_path
  end
  
  def lecturelist
    @lectures = Lecture.where(lecturer: current_user.id)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecturer_params
      params.require(:lecturer).permit(:lec_id, :pw, :pw_confirmation, :name, :sex, :age, :career, :region, :shortintro, :intro, :lec_img)
    end
end