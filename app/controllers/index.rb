require 'haml'
require 'byebug'

get '/' do
  @tasks = Task.all.order(priority: :asc)
  haml :index
end

post '/tasks' do
  Task.create({description: params[:description], priority: params[:priority]})
  redirect to ('/')
end

put '/tasks/:id' do
  p params
  # p checkbox('complete?').checked?
  updated_task = Task.find_by_id(params[:id])
  if params[:complete?]
    complete = true
  else
    complete = false
  end
  updated_task.update({
    description: params[:description],# || updated_task.description,
    complete?: complete,
    priority: params[:priority],# || updated_task.priority
    })
  redirect to ('/')
end

delete '/tasks/:id' do
  Task.find_by_id(params[:id]).destroy
  redirect to ('/')
end
