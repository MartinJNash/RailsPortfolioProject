class PostPolicy < ApplicationPolicy


  class Scope < Struct.new(:user, :scope)
    def resolve
      if user && user.author?
        scope.where(author_id: user.id)
      else
        scope.all
      end
    end
  end

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    @post.author == @user
  end

  def create?
    @user && @user.author?
  end

  def publish?
    @user && @user.editor?
  end

  def delete?
    @user && @user.editor?
  end

  def permitted_attributes
    attributes = [:title, :body]
    attributes << [:published] if @user.editor?
    attributes
  end

end
