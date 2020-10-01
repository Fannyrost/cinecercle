class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  add_breadcrumb "Accueil ", :root_path

  def home
    if user_signed_in?
      redirect_to circles_path
    end
  end

  def wall
  end
end
