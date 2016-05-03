class StaticPagesController < ApplicationController
  
  def home
    session[:path] = 'Choose...'
  end

  def help
  end

  def about
  end
  
  def contact
  end
end
