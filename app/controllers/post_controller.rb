class PostController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
  end

  def create
    #1.
    post = Post.create(title:params[:title],body:params[:body])
    #1-1.
    # Post.create(:title=>params[:title], :body=>params[:body])
    #2.
    # post=Post.new
    # post.title=params[:title]
    # post.body=params[:body]
    # post.save
    #text안에 변수를 넣을때 텍스트인터폴레이션 반드시 ""사용
    redirect_to "/post/#{post.id}"
  end
  def show
      @post=Post.find(params[:id])
  end
  def edit
    @post=Post.find(params[:id])
  end

  def update
      @post=Post.find(params[:id])
    post=Post.update(title:params[:title], body:params[:body])
    redirect_to "/post/#{post.id}"
  end
  def destroy
    post=Post.find(params[:id])
    post.destroy
    redirect_to '/'
  end
end
