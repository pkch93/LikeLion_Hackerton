class LoginController < ApplicationController
  before_action :set_navbar, except: [:login]
  
  def login
  end
  
  def logout
    session[:id] = nil
    @current_user = nil
    redirect_to '/'
  end
  
  def idfind
    name = params[:name]
    phonenumber = params[:phonenumber]
    
    @lec = Lecturer.where(name: name, phone: phonenumber) # 일치하지 않더라도 빈 객체가 return
    @user_name = name
    if @lec.empty?
      render text: "일치하는 아이디가 없습니다."
    end
  end
  
  def pwfind
    find_id = params[:find_id]
    name = params[:name]
    phonenumber = params[:phonenumber]
    
    @lec = Lecturer.where(lec_id: find_id, name: name, phone: phonenumber)
    @user_name = name
    if @lec.empty?
      render text: "해당 정보로 가입된 회원이 없습니다."
    end
  end

  def logincheck
      id = params[:lec_id]
      pw = params[:lec_pw]
      temp = Lecturer.find_by lec_id: id
      if temp
        if temp.pw == pw
            session[:id] = id
            redirect_to '/' and return
        else
          render text: "아이디 또는 비밀번호가 틀립니다." and return
        end
      end
  end
end