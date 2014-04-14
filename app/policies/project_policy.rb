class ProjectPolicy < ApplicationPolicy


  def initialize(user, project)
    @user = user || NullUser.new
    @project = project
  end

  def update?
    @user.editor?
  end

  def create?
    @user.editor?
  end

  def publish?
    @user.editor?
  end

  def destroy?
    @user.editor?
  end

end
