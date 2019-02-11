require 'spec_helper'

 # As a user
# I want to see the tasks of each project
# So I know what needs to be completed in the project

# Acceptance Criteria:
# On the projects show page, I should see the full name of each task as well as the first and last name of the user assigned to the task(if there is someone assigned to the task)


 feature 'On the index page user clicks first project\'s link and gets to the show project page.' do

   let(:user) { User.create!(
        first_name: "Irina",
        last_name: "Seitz",
        email: "iseitz@gmail.com"
   )}

   before :each do

     user1 = User.create!(
       first_name: "Helen",
       last_name: "Seitz",
       email: "hseitz@gmail.com"
     )
     user2 = User.create!(
       first_name: "Rachel",
       last_name: "Mayers",
     )

     first_app_project = Project.create!(
       name: "Time Tracking App",
       description: "This app allows you to track how much time is spent on each particular activity, it disables FB, Instagram and Twitter during designated time if needed"
     )
     second_app_project = Project.create!(
       name: "Homeless People Help Guide",
       description: "Helps homeless people to find access to all medical, legal and other types of help"
     )
     third_app_project = Project.create!(
       name: "Girls In Tech Resources Sharing"
     )
     assignment1 = Assignment.create!(
       user_id: user2.id,
       project_id: first_app_project.id
     )
     assignment2 = Assignment.create!(
       user_id: user1.id,
       project_id: first_app_project.id
     )
     task1 = Task.create!(
       name: "Create start_time functionality on the page",
       project_id: first_app_project.id
     )
     task2 = Task.create!(
       name: "Create stop_time functionality on the page",
       project_id: first_app_project.id,
       user_id: user.id
     )

   end

   scenario 'On the show project page user views all project tasks' do

          visit '/projects'
          click_link("Time Tracking App")

          expect(page).to have_content "Details of Time Tracking App Project"
          expect(page).to have_content "This app allows you to track how much time is spent on each particular activity, it disables FB, Instagram and Twitter during designated time if needed"
          expect(page).to have_content "Description of the project"
          expect(page).to have_content "Memebers, working on the project"
          expect(page).to have_content "Helen Seitz (hseitz@gmail.com)"
          expect(page).to have_content "Rachel Mayers"
          expect(page).to have_content  "Tasks"
          expect(page).to have_content "Create start_time functionality on the page"

    end
    scenario 'On the project show page user sees persons assigned to tasks' do

           visit '/projects'
           click_link("Time Tracking App")

           expect(page).to have_content "Details of Time Tracking App Project"
           expect(page).to have_content "This app allows you to track how much time is spent on each particular activity, it disables FB, Instagram and Twitter during designated time if needed"
           expect(page).to have_content "Description of the project"
           expect(page).to have_content "Memebers, working on the project"
           expect(page).to have_content "Helen Seitz (hseitz@gmail.com)"
           expect(page).to have_content "Rachel Mayers"
           expect(page).to have_content  "Tasks for the project"
           expect(page).to have_content "Create start_time functionality on the page"
           expect(page).to have_content "Assigned to : Irina Seitz iseitz@gmail.com"

     end
     scenario 'On the index page user clicks first project\'s link and gets to the show page. On the show page user does not see any tasks if there are no tasks' do

          visit '/projects'
          click_link("Homeless People Help Guide")

          expect(page).to have_content "Details of Homeless People Help Guide Project"
          expect(page).to have_content "Description of the project"
          expect(page).to_not have_content  "Tasks for the project"

    end

end
