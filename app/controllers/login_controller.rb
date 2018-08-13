class LoginController < ApplicationController
  before_action :set_navbar, except: [:login]
  
  def login
  end
  
  def logout
    $usertable.delete session[:id]
    session[:id] = nil
    @current_user = nil
    redirect_to '/'
  end
  
  def idfind
    name = params[:name]
    phonenumber = params[:phone1] + params[:phone2] + params[:phone3]
    email = params[:email]
    
    @lec = Lecturer.where(name: name, phone: phonenumber, email: email) # 일치하지 않더라도 빈 객체가 return
    @user_name = name
    if @lec.empty?
      flash[:alert] = "입력하신 정보가 일치하지 않습니다."
      render "find"
    end
  end
  
  def pwfind
    id = params[:id]
    name = params[:pw_name]
    email = params[:pw_email]
    
    @lec = Lecturer.where(lec_id: id, name: name, email: email)
    @user_name = name
    if @lec.empty?
      flash[:alert] = "입력하신 정보가 일치하지 않습니다."
      render "find"
    end
  end

  def logincheck
      lec_id = params[:lec_id]
      lec_pw = params[:lec_pw]
      temp = Lecturer.find_by lec_id: lec_id
      if temp && temp.pw == lec_pw
        session[:id] = lec_id
        $usertable[lec_id] = lec_id
        redirect_to '/' and return
      else
        flash[:alert] = "아이디 또는 비밀번호가 일치하지 않습니다."
        render "login" and return
      end
  end
end