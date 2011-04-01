class Pdf < ActiveRecord::Base
  belongs_to :brochure
  has_attached_file :attachment
  
  def url
    attachment.url
  end
end
