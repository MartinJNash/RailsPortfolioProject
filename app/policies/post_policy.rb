class PostPolicy < ApplicationPolicy


  class Scope < Struct.new(:user, :scope)
    def resolve
      if user
        return scope.where(author_id: user.id) if user.author?
        return scope.all if user.editor?
      end
      scope.where(published: true)
    end
  end

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    return false if @user.nil?
    @post.author == @user || @user.editor?
  end

  def create?
    return false if @user.nil?
    @user.author? || @user.editor?
  end

  def publish?
    return false if @user.nil?
    @user.editor?
  end

  def destroy?
    return false if @user.nil?
    @user.editor?
  end



  def permitted_attributes
    return [] if user.nil?
    attributes = [:title, :body]
    attributes << [:published] if @user.editor?
    attributes
  end

end
