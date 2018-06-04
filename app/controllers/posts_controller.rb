class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  # Returns all +Posts+ for the current +User+
  # Also applies authorisation to ensure the current user is authorised to access the +Posts+.
  #
  #   API: GET /posts
  #        GET /posts?s=[search_term]
  #
  # @return [Array] An array of {Post Posts}

  def index
    @posts = Post.all
  end

  # Create a new +Post+ for the current +User+
  # API: GET /posts/new

  def new
    @post = current_user.posts.build
  end

  # Creates a new +Post+ and assigns it to the current +User+
  #
  #   API: POST /posts
  #
  # @return [Post] The created +Post+

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
     flash[:success] = 'Your post created'
    redirect_to posts_path
   else
     flash[:alert] = 'You need an image to post here!'
     render :new
   end
  end

  # Returns an individual +Post+
  #
  #   API: GET /posts/[id]
  #
  # @return [Post] The Post

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Post updated."
    else
      flash.now[:alert] = "Error occured"
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end
  
end
