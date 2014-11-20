require 'sinatra'
require 'Haml'
require_relative './models/node.rb'
require_relative './models/tree.rb'

get '/' do
  tree = BinaryTree.new(10)
  20.times.each_with_index do |index|
    tree.insert(rand(20)+1)
  end

  params[:tree] = tree.to_a

  haml :index
end

post '/' do
  params[:firstname] = "Mickey"
  params[:lastname] = "Mouse"
  haml :index
end
