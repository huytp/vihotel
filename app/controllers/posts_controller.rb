class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_resource
  authorize_resource
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.title = title_params
    @post.content = content_params
    @post.friendly = eval(@post.title)[:vi].parameterize
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        @post.title = title_params
        @post.content = content_params
        @post.friendly = eval(@post.title)[:vi].parameterize
        @post.save
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def title_params
      "{vi: '#{params[:title_vi]}', en: '#{params[:title_en]}'}"
    end

    def content_params
      "{vi: '#{params[:content_vi]}', en: '#{params[:content_en]}'}"
    end

    def post_params
      params.require(:post).permit(:image, :post_type)
    end
end
