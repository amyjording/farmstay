class ProfilePolicy < ApplicationPolicy

  def index?
    @farmie
  end

  def show?
    @farmie
  end

  def new?
    @farmie
  end

  def create?
    @farmie
  end

  def update?
    @farmie && @farmie.profile == @record
  end

  def edit?
    @farmie && @farmie.profile == @record
  end

  def destroy?
    @farmie && @farmie.profile == @record
  end

end