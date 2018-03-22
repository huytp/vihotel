class EventsController < ApplicationController
  def index
    @events = Post.where(post_type: "events")
  end

  def show
    @event = Post.where(friendly: params[:friendly]).last
    @events = Post.where(post_type: "events")
  end
end
