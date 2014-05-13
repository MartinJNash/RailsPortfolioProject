class InboundEmail::PostsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def create
    post = Post::CreateWithPostmark.call(request)
    if post.valid?
      render json: post
    else
      render json: { errors: post.errors }
    end
  end
end
