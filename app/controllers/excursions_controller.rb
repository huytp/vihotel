class ExcursionsController < ApplicationController
  def index
    @excursions = Post.where(post_type: "excursions")
  end

  def show
    @excursion = Post.where(friendly: params[:friendly]).last
    @excursions = Post.where(post_type: "excursions")
  end
end
