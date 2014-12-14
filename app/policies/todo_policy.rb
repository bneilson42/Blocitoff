class TodoPolicy < ApplicationPolicy

    def index?
        true
    end

    def show?
        user.present? && (record.user == user)
    end

    def destroy?
        user.present? && (record.user == user)
    end

end
