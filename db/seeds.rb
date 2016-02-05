# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |index|
  Tweet.create(
    user_id: rand(3) + 1,
    content: "#{index}番目のツイートです", :controller => "tweets", :action => "show" %>
    )
end
