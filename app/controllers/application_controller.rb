# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  private


  def logged_in_user
      unless logged_in?
        redirect_to login_url
  end

  def logged_in_user
    redirect_to login_url unless logged_in?
   end
end
