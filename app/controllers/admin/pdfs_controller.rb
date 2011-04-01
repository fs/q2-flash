class Admin::PdfsController < ApplicationController
  before_filter :authenticate_user!
  inherit_resources
  belongs_to :brochure
end
