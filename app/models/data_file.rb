class DataFile < ActiveRecord::Base

  belongs_to :web_resource

  def origin
    if !agency.blank?
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
