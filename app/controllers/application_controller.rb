class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
    unless logged_in?
      redirect_to root_url
    end
  end

  def correct_user?
    @pessoa = Pessoa.find(params[:id])
    unless current_user == @pessoa
      redirect_to pessoas_path
    end
  end
end
