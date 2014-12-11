# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['user', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end
User.create_with(password: 'admin123', role: Role.find_by_name('admin')).find_or_create_by(email: 'admin@fosubo.com')
s = Survey.find_or_create_by(name: 'Verizon') do |survey|
  survey.code = "vrzon109Xzv22"
  survey.description = "This is a test survey for Verizon"
  survey.active_from = "2014-12-10 00:00:00"
  survey.active_until = "2015-04-01 01:25:00"
  survey.public = true
end
Type.find_or_create_by(name: 'satisfaction-100')
Type.find_or_create_by(name: 'free-text')
2.times do |n|
  sect=Section.create(order: n, name: "Step " + (n+1).to_s, survey: s)
  if n == 0
    Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "Overall satisfaction of service:")
    Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "Professionalism and Courtesy of employee")
    Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "How satisfied were you with the wait time at this store?")
    Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "How satisfied were you with the in-store setup of your phone?")
  elsif n == 1
    q=Question.create(section: sect, type: Type.find_by_name('free-text'), text: "Please provide extra comments")
    Answer.create(question: q, value: "textarea")
  end
end
s = Survey.find_or_create_by(name: 'T-Mobile') do |survey|
  survey.code = "tmobXz123le"
  survey.description = "This is a test survey for T-Mobile"
  survey.active_from = "2014-12-10 00:00:00"
  survey.active_until = "2015-04-01 01:25:00"
  survey.public = true
end
sect=Section.create(order: n, name: "Step 1", survey: s)
Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "Overall satisfaction of service:")
Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "Professionalism and Courtesy of employee")
Question.create(section: sect, type: Type.find_by_name('satisfaction-100'), text: "How satisfied were you with the wait time at this store?")
Question.create(section: sect, type: Type.find_by_name('free-text'), text: "Please provide extra comments")