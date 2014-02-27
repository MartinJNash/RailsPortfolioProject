class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def create?
    @user && @user.author?
  end

  def publish?
    @user && @user.editor?
  end

  def permitted_attributes
    attributes = [:title, :body]
    attributes << [:published] if @user.editor?
    attributes
  end

end
