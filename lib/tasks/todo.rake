namespace :todo do
  desc "Delete items after seven days"
  task delete_items: :environment do
    Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
