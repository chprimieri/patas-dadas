module SessionsHelper
  def sign_in(pessoa)
    session[:pessoa_id] = pessoa.id
  end

  def current_user
    @current_user ||= Pessoa.find_by(id: session[:pessoa_id])
  end

  def block_access
    if current_user.present?
      redirect_to pessoa_path
    end
  end

  def logged_in?
  	!current_user.nil?
  end

  def sign_out
    session.delete(:pessoa_id)
    @current_user = nil
  end
end