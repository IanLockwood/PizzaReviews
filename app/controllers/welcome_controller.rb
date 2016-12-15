class WelcomeController < ApplicationController
  include Mech

  def index
  end

  def search
    @title = params[:q]
    @results = Mech.get_reviews(params[:q])

    render 'index'
  end
end
