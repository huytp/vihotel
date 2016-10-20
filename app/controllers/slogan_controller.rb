class SloganController < ApplicationController
  before_action :authenticate_user!
  load_resource
  authorize_resource
  def index
    @slogan = Slogan.last
  end
  def update
    @slogan = Slogan.find(params[:id])
    if @slogan.update(content: get_params)
      redirect_to slogan_index_path
      flash[:notice] = "Thành công"
    end
  end

  def get_params
    content = "{vi: '#{params[:content_vi]}', en: '#{params[:content_en]}'}"
  end
end
