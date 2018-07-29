class LoginController < ApplicationController
  def login
  end
  
  def logout
    session[:id] = nil
    @current_user = nil
    redirect_to '/'
  end
  
  def idfind
    name = params[:lecturer_name]
    phone = params[:lecturer_phone]
    
    @lec = Lecturer.where(name: name, phone: phone) # 일치하지 않더라도 빈 객체가 return
    @user_name = name
    if @lec.empty?
      render text: "일치하는 아이디가 없습니다."
    end
  end
  
  def pwfind
    id = params[:lecturer_id]
    name = params[:lecturer_name]
    phone = params[:lecturer_phone]
    
    @lec = Lecturer.where(lec_id: id, name: name, phone: phone)
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