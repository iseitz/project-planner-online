require 'sinatra'
require 'sinatra/flash'
require 'sinatra/activerecord'
require "sinatra/reloader" if development? || test?
require "pry" if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

configure do
  set :views, 'app/views'
end

enable :sessions

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  redirect '/projects'
end


get '/projects' do
  @projects = Project.all.order(:name)
  erb :'projects/index'
end


get "/projects/new" do
  @project = Project.new
  erb :'projects/new'
end

post "/projects" do
  @project = Project.new(params[:project])
  if @project.save
    flash[:notice] = "You have sucessfully created a project!"
    redirect "/projects"
  else
    @errors = @project.errors.full_messages
    erb :'projects/new'
  end
end

get "/projects/:id" do
  @id = params[:id].to_i
  @assignments = Assignment.where(project_id: @id)
  @users =[]
  @assignments.each do |assignment|
    user = User.find(assignment.user_id)
    @users << user
  end
  @project = Project.find(@id)
  @tasks = Task.where(project_id: @id)
  erb :'projects/project'
end
