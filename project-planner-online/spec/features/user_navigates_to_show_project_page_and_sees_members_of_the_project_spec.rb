require 'spec_helper'

 # As a user
# I want to see the members of each project
# So I know who is working on the project

# Acceptance Criteria:
# On the projects show page, I should see the first name, last name and email(if any)of each user who is working on the project


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

   end

   scenario 'On the show page user views all project members with emails' do

          visit '/projects'
          click_link("Time Tracking App")

          expect(page).to have_content "Details of Time Tracking App Project"
          expect(page).to have_content "This app allows you to track how much time is spent on each particular activity, it disables FB, Instagram and Twitter during designated time if needed"
          expect(page).to have_content "Description of the project"
          expect(page).to have_content "Memebers, working on the project"
          expect(page).to have_content "Helen Seitz (hseitz@gmail.com)"

    end
    scenario 'If users don\'t have any email on the show project page user sees those members without email.' do

           visit '/projects'
           click_link("Time Tracking App")

           expect(page).to have_content "Details of Time Tracking App Project"
           expect(page).to have_content "Memebers, working on the project"
           expect(page).to have_content "Helen Seitz (hseitz@gmail.com)"
           expect(page).to have_content "Rachel Mayers"

     end

end
