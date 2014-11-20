require 'sinatra'
require 'haml'
require './models/node.rb'
require './models/tree.rb'

get '/' do
  tree = BinaryTree.new(10)
  20.times.each_with_index do |index|
    tree.insert(rand(20)+1)
  end

  params[:tree] = tree.to_a

  haml :index
end

post '/' do
  params["firstname"] = "Mickey"
  params["lastname"] = "Mouse"
  params.inspect
end
