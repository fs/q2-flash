class Admin::BrochuresController < ApplicationController
  before_filter :authenticate_user!
  inherit_resources
  def index
    @brochures = Brochure.all
    respond_to do |format|
      format.html
      format.xml do 
        render :xml => @brochures.to_xml(
          :include => :pdf,
          :only => [:name, :description, :created_at, :updated_at, :url]
        )
      end
    end
  end
end
