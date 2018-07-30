class LecturersController < ApplicationController
  before_action :set_lecturer, only: [:show, :edit, :update, :destroy]
  before_action :set_navbar, except: [:new]

  def index
    @lecturers = Lecturer.all
    
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
    lecturer_categories = LecturerCategory.new(params.require(:lecturer_categories).permit(:category))
    respond_to do |format|
      if @lecturer.save
        lecturer_categories.lecturer_id = @lecturer.id
        lecturer_categories.save
        format.html { redirect_to @lecturer, notice: 'Lecturer was successfully created.' }
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecturer
      @lecturer = Lecturer.find_by(id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecturer_params
      params.require(:lecturer).permit(:lec_id, :pw, :name, :sex, :age, :career, :phone, :email, :region, :intro)
    end
end
