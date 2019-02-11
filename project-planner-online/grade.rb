require_relative 'server'

project_1 = Project.create!(name: "Test Project" , description: "This is the project description!")
project_1.users.create!(first_name: "Kvothe" , last_name: "Vintas",  email: "fobad@foo.com")

all_users = User.all
all_projects = Project.all
first_project_users = Project.first.users
first_user_projects = User.first.projects

puts "\nUser.all:"
puts all_users.join("\n")

puts "\nProject.all:"
puts all_projects.join("\n")

puts "\nProject.first.users:"
puts first_project_users.join("\n")

puts "\nUser.first.projects:"
puts first_user_projects.join("\n")

## Uncomment the lines below to test for Exceeds


task_1 = Task.create!(name: "Learn to Code", description: "First one must master the art of the pry", due_date: Date.today, user: User.first, project: project_1)
puts "\nTask.all:"
puts Task.all.join("\n")

puts "\nProject.first.tasks"
puts Project.first.tasks.join("\n")

puts "\nTask.first.user:"
puts Task.first.user
