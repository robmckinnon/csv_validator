class DataFile < ActiveRecord::Base

  belongs_to :web_resource

  before_validation :populate_origin

  def populate_origin
    if origin.blank?
      self.origin = if !agency.blank?
        agency
      elsif !entity_from_title.blank?
        entity_from_title
      elsif !department.blank?
        department
      elsif !domain.blank?
        domain
      else
        title
      end
    end
  end
end
