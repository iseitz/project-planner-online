require 'spec_helper'

 # As a user
# I want to see the details of a project
# So I can learn more about each project

# Acceptance Criteria:
# On the projects show page, I should see the name and description(if any)of the project


 feature 'On the index page user clicks on the name of the project and navigates to the show project details page' do

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

   end

   scenario 'Project has description and user views the project\'s detailed page with description' do

          visit '/projects'
          click_link("Homeless People Help Guide")

          expect(page).to have_content "Details of Homeless People Help Guide Project"
          expect(page).to have_content "Helps homeless people to find access to all medical, legal and other types of help"
          expect(page).to have_content "Description of the project"

    end
    scenario 'Project does not have description and user views the project\'s detailed page without description' do

           visit '/projects'
           click_link("Girls In Tech Resources Sharing")

           expect(page).to have_content "Details of Girls In Tech Resources Sharing Project"
           expect(page).to_not have_content "Description of the project"

    end

end
