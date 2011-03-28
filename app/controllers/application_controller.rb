class ApplicationController < ActionController::Base

  protect_from_forgery

  caches_page :index, :agency_index, :org_index unless (Rails.env.test? || Rails.env.development?)

  def index
  end

  def agencies
  end

  def methodology
  end

  def agency
    @name = params[:name].gsub('_',' ').gsub('amp;','&')
    @data_files = DataFile.where("origin = '#{@name}'").all
    @web_resources = @data_files.map(&:web_resource).select {|x| !x.file_path.include?('scraped/uk/gov/data/dataset') }
  end
end
