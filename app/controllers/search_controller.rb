class SearchController < ApplicationController
  def search
    term = params[:term]
    Feedback.reindex
    Category.reindex
    Topic.reindex
    @posts = Post.search term
    @comments = Comment.search term
    @feedbacks = Feedback.search term
    @categories = Category.search term
    @topics = Topic.search term
    @books = Book.search term
  end
end
