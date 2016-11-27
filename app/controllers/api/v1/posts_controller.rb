class Api::V1::PostsController < Api::V1::BaseController
  include ActiveHashRelation

  def_param_group :posts do
    param :auth_token, String, desc: "User access token", required: true
    param :api_key, String, "User api key", required: true
    param :title, String, "Get collection by title"
    param :content, String, "Get collection by content"
  end

  def_param_group :post do
    param :auth_token, String, desc: "User access token", required: true
    param :api_key, String, "User api key", required: true
    param :id, String, "Post id"
  end

  api :GET, '/posts', 'Get list posts / Search posts by title or content'
  param_group :posts
  formats ['json']
  example " 'api_key': 'your_api_key', 'auth_token': 'your_auth_token', 'title': 'seacrh title', 'content': 'search content' "
  def index
    posts = Post.preload(:topic, :category)

    posts = apply_filters(posts, params.slice(:title, :content))

    render json: posts,
           include: {topic: {only: :title}, category: {only: :title}},
           except: [:created_at, :updated_at],
           status: 200
  end

  api :GET, '/posts/:id', 'Get post info'
  param_group :post
  formats ['json']
  example " 'api_key': 'your_api_key', 'auth_token': 'your_auth_token', 'id': 'post id' "
  def show
    post = Post.find(params[:id])
    render json: post, status: 200
  end
end