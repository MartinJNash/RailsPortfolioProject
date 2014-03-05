class PostPolicy < ApplicationPolicy


  Scope = Struct.new(:user, :scope) do
    def resolve
      if user
        return scope.where(author_id: user.id) if user.author?
        return scope.all if user.editor?
      end
      scope.where(published: true)
    end
  end

  def initialize(user, post)
    @user = user || NullUser.new
    @post = post
  end

  def update?
    @post.author == @user || @user.editor?
  end

  def create?
    @user.author? || @user.editor?
  end

  def publish?
    @user.editor?
  end

  def destroy?
    @user.editor?
  end



  def permitted_attributes
    attributes = []
    attributes << [:title, :body] if @user.author? || @user.editor?
    attributes << [:published] if @user.editor?
    attributes
  end

end
