class FlashPageController < ApplicationController
  before_filter :authenticate_user!
  layout nil

  def show
  end
end
