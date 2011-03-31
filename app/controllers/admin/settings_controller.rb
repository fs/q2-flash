class Admin::SettingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_required

  def edit
  end

  def update
  end
end
