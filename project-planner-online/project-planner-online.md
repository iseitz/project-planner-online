## Instructions

We want to design a database architecture to represent team members working on projects together.

### Getting Set up

Retrieve this challenge via `et` and install the necessary dependencies using the `bundle` command.

```no-highlight
et get project-planner-online
cd project-planner-online
bundle
```

When running your migrations, please be sure to run them with the rollback command as well. You should also be prepending your rake commands with bundle exec in order to ensure that your application is using the correct gem versions

```
bundle exec rake db:migrate && bundle exec rake db:drop && bundle exec rake db:migrate
```

## Meeting Expectations Requirements

This challenge will test your knowledge of ActiveRecord and acceptance testing.

Focus on **migrations**, **models**, and the database **schema**. Views for displaying data are not required to meet expectations.

* The relevant files that will be checked are:
  - All files in the `app/models` directory.
  - All files in the `db/migrate` directory.
* You **must** include database constraints and model validations where appropriate.

Create a schema and the necessary migrations and models to represent the following data and object relationships:

#### Users

* Users must have a first name and a last name.
* Users can optionally have an email.
* Users can be involved with multiple projects.

#### Projects

* A project must have a name.
* A project can optionally have a description.
* A project can have many users working on it.


### Tips

* You should feel free to add whatever additional migrations/models etc. you need to make these associations work.
* Draw out the ER Diagram on paper so that you can understand what data you will need to save and the relationships that you will need to create.
* Test your models in `pry` by running `pry -r "./server.rb"`. For example, you should be able to run `User.first.projects` to get all of the projects for the first user.
* You do not need to add any routes to the application to make it functional for the meets expectations requirement.
* **DO NOT** start the requirements for exceeding expectations before completing the requirements necessary to meet expectations.

### Exceeds Expectations Requirements

We now want to be able to add tasks to our app.

#### Tasks

* Tasks must have a name.
* Tasks can optionally have a description and a due date.
* Tasks can optionally be assigned to a single user. (Tasks can also remain unassigned.)
* A task must belong to a single project.

#### Projects

* A project has a collection of individual tasks assigned to it.

### Satisfy User Stories

Write an **acceptance test** for each user story and get the tests to pass.

Note: You should be running `rake db:test:prepare` in order to sync any new migrations
between your test and development databases.

```no-highlight
As a user
I want to view a list of all projects
So I know what projects are ongoing
```

Acceptance Criteria:

* On the projects index page (`/projects`), I should see the name of each project.
* On the projects index page, the name of each project should be a link to the project's show page.

```no-highlight
As a user
I want to see the details of a project
So I can learn more about each project
```

Acceptance Criteria:

* On a project's show page (`/projects/4` for the project with an `id` of `4`, etc.), I should see the name and description (if any) of the project.

```no-highlight
As a user
I want to see the members of each project
So I know who is working on the project
```

Acceptance Criteria:

* On a project's show page, I should see the first name, last name, and email (if any) of each user who is working on the project.

```no-highlight
As a user
I want to see the tasks of each project
So I know what needs to be completed in the project
```

Acceptance Criteria:

* On a project's show page, I should see all the names of each task as well as the first and last name of the user assigned to the task (if there is someone assigned to the task).
