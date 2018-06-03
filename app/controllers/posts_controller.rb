class PostsController < ApplicationController

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
    @post = Post.new
  end

  # Creates a new +Post+ and assigns it to the current +User+
  #
  #   API: POST /posts
  #
  # @return [Post] The created +Post+

  def create
    @post = Post.create(post_params)
    if @post.save
     flash[:success] = 'Your post created'
    redirect_to @posts_path
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
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
  
end
