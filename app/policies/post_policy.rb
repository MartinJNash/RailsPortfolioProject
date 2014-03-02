class PostPolicy < ApplicationPolicy


  class Scope < Struct.new(:user, :scope)
    def resolve
      if user
        return scope.where(author_id: user.id) if user.author?
        return scope.all if user.editor?
      else
        scope.where(published: true)
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
