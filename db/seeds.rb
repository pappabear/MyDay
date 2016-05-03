Todo.destroy_all
User.destroy_all


User.create(name: "Chip Irek", email: "chip.irek@gmail.com", password: "lollip0p", password_confirmation: "lollip0p",
            activated: true,
            activated_at: Time.zone.now)

User.create(name: "Michael Hartl", email: "mhartl@example.com", password: "foobar", password_confirmation: "foobar",
            activated: true,
            activated_at: Time.zone.now)

#User.create!(name:  "Example User",
#             email: "example@railstutorial.org",
#             password:              "foobar",
#             password_confirmation: "foobar",
#             admin: true,
#             activated: true,
#             activated_at: Time.zone.now)

Todo.create(:subject=>'1 due today',:due_date=>Date.today,:recurrence=>0, :user_id=>User.first.id)
Todo.create(:subject=>'2 completed today',:due_date=>Date.today,:recurrence=>0, :is_complete=>true, :user_id=>User.first.id)
Todo.create(:subject=>'9 due yesterday',:due_date=>Time.now.to_date.advance(:days=>-1).advance(:hours=>-5).strftime("%m/%d/%Y"),:recurrence=>0, :user_id=>User.first.id)
Todo.create(:subject=>'due tomorrow',:due_date=>Date.tomorrow,:recurrence=>0, :user_id=>User.first.id)
Todo.create(:subject=>'item with NO due date',:due_date=>nil,:recurrence=>0, :user_id=>User.first.id)
Todo.create(:subject=>'daily recurrence',:due_date=>Date.today,:recurrence=>1, :user_id=>User.first.id)
Todo.create(:subject=>"Chip should NOT see Hartl's items #1",:due_date=>Date.today,:recurrence=>1, :user_id=>User.last.id)
Todo.create(:subject=>"Chip should NOT see Hartl's items #2",:due_date=>Date.tomorrow,:recurrence=>1, :user_id=>User.last.id)


=begin
Todo.create(:subject=>'10am Martin',                                    :due_date=>'2016-05-01',:recurrence=>0, :is_complete=>true)
Todo.create(:subject=>'7am muck and clean barn',                        :due_date=>'2016-05-01',:recurrence=>2, :is_complete=>true)
Todo.create(:subject=>'finish UAT heroku deploy',                       :due_date=>'2016-05-01',:recurrence=>0)
Todo.create(:subject=>'catch-up email / plan the week',                 :due_date=>'2016-05-01',:recurrence=>2, :is_complete=>true)
Todo.create(:subject=>'note to martin',                                 :due_date=>'2016-05-01',:recurrence=>0, :is_complete=>true)
Todo.create(:subject=>'clean downstairs',                               :due_date=>'2016-05-01',:recurrence=>2, :is_complete=>true)
Todo.create(:subject=>'830pm skate LTP',                                :due_date=>'2016-05-01',:recurrence=>2)
Todo.create(:subject=>'clean upstairs',                                 :due_date=>'2016-05-01',:recurrence=>2, :is_complete=>true)
Todo.create(:subject=>'tan / antenna',                                  :due_date=>'2016-05-01',:recurrence=>0, :is_complete=>true)
Todo.create(:subject=>'find a networking oppty (LinkedIn, lunch, etc)', :due_date=>'2016-05-01',:recurrence=>2)
Todo.create(:subject=>'630am dogs + kitchen + horses',                  :due_date=>'2016-05-01',:recurrence=>1, :is_complete=>true)
Todo.create(:subject=>'7pm horses + dogs', :due_date=>'2016-05-01',:recurrence=>1)
Todo.create(:subject=>'write anthony about no NS support, write team', :due_date=>'2016-05-01',:recurrence=>0, :is_complete=>true)
Todo.create(:subject=>'work on GoPlay', :due_date=>'2016-05-01',:recurrence=>2, :is_complete=>true)
Todo.create(:subject=>'CIO / InfoWorld', :due_date=>'2016-05-01',:recurrence=>2, :is_complete=>true)
Todo.create(:subject=>'30mins with spanish', :due_date=>'2016-05-01',:recurrence=>1, :is_complete=>true)

Todo.create(:subject=>'945am Kaos standup', :due_date=>'2016-05-02',:recurrence=>1)
Todo.create(:subject=>'30mins with spanish', :due_date=>'2016-05-02',:recurrence=>1)
Todo.create(:subject=>'330pm scrum of scrums', :due_date=>'2016-05-02',:recurrence=>2)
Todo.create(:subject=>'12n UBWO', :due_date=>'2016-05-02',:recurrence=>2)
Todo.create(:subject=>'---------------', :due_date=>'2016-05-02',:recurrence=>2)
Todo.create(:subject=>'rip Game of Thrones', :due_date=>'2016-05-02',:recurrence=>2)
Todo.create(:subject=>'630am dogs + kitchen + horses', :due_date=>'2016-05-02',:recurrence=>1)
Todo.create(:subject=>'12n s&p', :due_date=>'2016-05-02',:recurrence=>2)

Todo.create(:subject=>'4pm Adrian', :due_date=>'2016-05-03',:recurrence=>3)
Todo.create(:subject=>'2pm arch guild', :due_date=>'2016-05-03',:recurrence=>2)
Todo.create(:subject=>'---------------', :due_date=>'2016-05-03',:recurrence=>2)
Todo.create(:subject=>'9am magento meet-up', :due_date=>'2016-05-03',:recurrence=>2)
Todo.create(:subject=>'10am sr mngt mtg', :due_date=>'2016-05-03',:recurrence=>2)
Todo.create(:subject=>'prepare for call with Martin/Anthony at 9am tomorrow', :due_date=>'2016-05-03',:recurrence=>2)

Todo.create(:subject=>'---------------', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'clean upstairs', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'230pm review update for tomorrows 90-day review', :due_date=>'2016-05-04',:recurrence=>3)
Todo.create(:subject=>'work on GoPlay', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'clean downstairs + laundry room', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'9am catch-up with Martin & Anthony', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'10am put together notes after Martin & Anthony', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'1130am skate @ Plex', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'muck', :due_date=>'2016-05-04',:recurrence=>2)
Todo.create(:subject=>'330pm Scrum of Scrums', :due_date=>'2016-05-04',:recurrence=>2)

Todo.create(:subject=>'pack for hockey', :due_date=>'2016-05-05',:recurrence=>2)
Todo.create(:subject=>'230pm HR meeting', :due_date=>'2016-05-05',:recurrence=>3)
Todo.create(:subject=>'muck', :due_date=>'2016-05-05',:recurrence=>2)
Todo.create(:subject=>'9am weekly progress meeting', :due_date=>'2016-05-05',:recurrence=>3)
Todo.create(:subject=>'send out updated 90-day slides after meeting', :due_date=>'2016-05-05',:recurrence=>3)
Todo.create(:subject=>'10am Raleigh / Marketing meet-up', :due_date=>'2016-05-05',:recurrence=>2)
Todo.create(:subject=>'1030am Chris 1-on-1 3', :due_date=>'2016-05-05',:recurrence=>3)
Todo.create(:subject=>'1pm UBWO', :due_date=>'2016-05-05',:recurrence=>2)
Todo.create(:subject=>'8pm garbage to corner', :due_date=>'2016-05-05',:recurrence=>2)
Todo.create(:subject=>'---------------', :due_date=>'2016-05-05',:recurrence=>2)

Todo.create(:subject=>'830am Mike Hall 1-on-1', :due_date=>'2016-05-06',:recurrence=>2)
Todo.create(:subject=>'330pm Business Update', :due_date=>'2016-05-06',:recurrence=>2)
Todo.create(:subject=>'an hour with GoPlay', :due_date=>'2016-05-06',:recurrence=>2)
Todo.create(:subject=>'10am Martin 1-on-1', :due_date=>'2016-05-06',:recurrence=>2)
Todo.create(:subject=>'530am skate', :due_date=>'2016-05-06',:recurrence=>2)
Todo.create(:subject=>'prepare daily update of SWAT team tickets', :due_date=>'2016-05-06',:recurrence=>2)

Todo.create(:subject=>'work on GoPlay', :due_date=>'2016-05-07',:recurrence=>2)
Todo.create(:subject=>'mow backyard', :due_date=>'2016-05-07',:recurrence=>2)
Todo.create(:subject=>'mow roadside + bottom', :due_date=>'2016-05-07',:recurrence=>2)
Todo.create(:subject=>'pick the backyard / clean garage', :due_date=>'2016-05-07',:recurrence=>2)
Todo.create(:subject=>'out: drycleaning', :due_date=>'2016-05-07',:recurrence=>2)
Todo.create(:subject=>'out: gym/tan', :due_date=>'2016-05-07',:recurrence=>2)
Todo.create(:subject=>'muck + empty trailer for week?', :due_date=>'2016-05-07',:recurrence=>2)

Todo.create(:subject=>'catch-up email / plan the week', :due_date=>'2016-05-08',:recurrence=>2)
Todo.create(:subject=>'clean upstairs', :due_date=>'2016-05-08',:recurrence=>2)
Todo.create(:subject=>'CIO / InfoWorld', :due_date=>'2016-05-08',:recurrence=>2)
Todo.create(:subject=>'7am muck and clean barn', :due_date=>'2016-05-08',:recurrence=>2)
Todo.create(:subject=>'work on GoPlay', :due_date=>'2016-05-08',:recurrence=>2)
Todo.create(:subject=>'mangle', :due_date=>'2016-05-08',:recurrence=>2)
Todo.create(:subject=>'clean downstairs', :due_date=>'2016-05-08',:recurrence=>2)

Todo.create(:subject=>'3pm Amanda 1-on-1', :due_date=>'2016-05-10',:recurrence=>3)
Todo.create(:subject=>'4pm Mike 1-on-1', :due_date=>'2016-05-10',:recurrence=>3)

Todo.create(:subject=>'1030am sprint demo', :due_date=>'2016-05-12',:recurrence=>3)
Todo.create(:subject=>'2pm Ben 1-on-1', :due_date=>'2016-05-12',:recurrence=>3)

Todo.create(:subject=>'xena nails + molly nails + brush molly', :due_date=>'2016-05-14',:recurrence=>3)
=end


