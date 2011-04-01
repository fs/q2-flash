class Admin::BlackDomainsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_required

  def index
    @black_domains = BlackDomain.all
  end

  def create
    @black_domain = BlackDomain.new(params[:black_domain])

    respond_to do |format|
      if @black_domain.save
        format.html { redirect_to(admin_black_domains_path, :notice => 'Author was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def new
    @black_domain = BlackDomain.new
  end

  def destroy
    @black_domain = BlackDomain.find(params[:id])
    @black_domain.destroy
    redirect_to :admin_black_domains
  end
end
