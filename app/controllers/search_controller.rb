class SearchController < ApplicationController
  def search
    term = params[:term]
    @posts = Post.search term
    @comments = Comment.search term
    @topics = Topic.search term
    @books = Book.search term
  end
end
