require 'spec_helper'

 # As a user
# I want to view a list of all projects
# So that I know what projects are ongoing

# Acceptance Criteria:
# On the projects index page, I should see the name of each project.
# On the projects index page, the name of each project should be a link to the project's show page

 feature 'user goes to the index page and views all projects' do

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
       name: "Girls In Tech Resources Sharing",
       description: "Helps women to start their career in Tech via exchange of knowlege and resources"
     )

   end

      scenario 'On the main page user views all the projects' do

          visit '/projects'

          expect(page).to have_content "Projects"
          expect(page).to have_content "Homeless People Help Guide"
          expect(page).to have_content "Time Tracking App"

      end
      scenario 'On the main page user views all the projects as clickable links to project\'s detailed page' do

          visit '/projects'
          click_link("Homeless People Help Guide")

          expect(page).to have_content "Details of Homeless People Help Guide Project"
          expect(page).to have_content "Helps homeless people to find access to all medical, legal and other types of help"
          expect(page).to have_content "Description of the project"

      end
      scenario 'On the main page user views all the projects in alphabetical order' do

          visit '/projects'

          page.body.index("Homeless People Help Guide").should < page.body.index("Time Tracking App")
          page.body.index("Girls In Tech Resources Sharing").should < page.body.index("Homeless People Help Guide")

      end

end
