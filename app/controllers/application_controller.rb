class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def agency_index
  end

  def org_index
    @name = params[:name].gsub('_',' ').gsub('amp;','&')
  end
end
