Todo.destroy_all
User.destroy_all

User.create(name: "Michael Hartl", email: "mhartl@example.com", password: "foobar", password_confirmation: "foobar",
            activated: true,
            activated_at: Time.zone.now)

User.create(name: "Chip Irek", email: "chip.irek@gmail.com", password: "lollip0p", password_confirmation: "lollip0p",
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

Todo.create(:subject=>'1 due today',:due_date=>Time.now.to_date.strftime("%m/%d/%Y"),:recurrence=>0)
Todo.create(:subject=>'2 completed today',:due_date=>Time.now.to_date.strftime("%m/%d/%Y"),:recurrence=>0, :is_complete=>true)
Todo.create(:subject=>'9 due yesterday',:due_date=>Time.now.to_date.advance(:days=>-1).advance(:hours=>-5).strftime("%m/%d/%Y"),:recurrence=>0)
Todo.create(:subject=>'due tomorrow',:due_date=>Time.now.to_date.advance(:days=>1).advance(:hours=>-5).strftime("%m/%d/%Y"),:recurrence=>0)
Todo.create(:subject=>'item with NO due date',:due_date=>nil,:recurrence=>0)
Todo.create(:subject=>'daily recurrence',:due_date=>Time.now.to_date.strftime("%m/%d/%Y"),:recurrence=>1)