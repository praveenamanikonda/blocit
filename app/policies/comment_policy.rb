class CommentPolicy < ApplicationPolicy
  def index?
    true 
  end   
  
  def create?
    user.present? || user.admin?
  end  
  
  def destroy?
    can_moderate? 
  end   
end   