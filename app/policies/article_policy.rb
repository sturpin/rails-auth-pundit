class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # Usuarios registrados y no registrados pueden ver index
    true
  end
 
  def create?
    # El usuario debe de estar registrado para crear un artículo
    user.present?
  end
 
  def update?
    # Solo el usuario que creó el artículo puede actualizar
    return true if user.present? && user == article.user
  end
 
  def destroy?
    # Solo el usuario que creó el artículo lo puede borrar 
    return true if user.present? && user == article.user
  end
 
  private
 
    def article
      record
    end

end
