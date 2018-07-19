class LoginController < ApplicationController
  
  def login
  end
  
  def logout
    session[:id] = nil
    redirect_to '/'
  end 
  
  def logincheck
    id = params[:lec_id]
      pw = params[:lec_pw]
      temp = Lecturer.find_by lec_id: id
      if temp
        if temp.pw == pw
            session[:id] = id
            redirect_to '/'
        else
          render text: "아이디 또는 비밀번호가 틀립니다." # 더 멋있게 수정 필요
        end
      else
        render text: "아이디 또는 비밀번호가 틀립니다." # 더 멋있게 수정 필요
      end
  end
end