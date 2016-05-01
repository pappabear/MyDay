desc "Purge old tasks"
task :purge_old_stuff => :environment do

  Todo.where('due_date < ?', Date.today-7).where('is_complete is true').each do |e|
    e.destroy!
  end

end