require 'sinatra'
require 'haml'
require './models/node.rb'
require './models/tree.rb'

before do
  @lowest_common_ancestor = nil
  params["tree"] ||= ""

  if params["tree"].empty?
    @node_ids = Tree::DEFAULT_TREE
    params["tree"] = @node_ids.join(", ")
  else
    @node_ids = params["tree"].split(",").map(&:to_i).uniq
    params["tree"] = @node_ids.join(", ")
  end

  @tree = Tree.new(@node_ids)
end

get '/' do
  haml :index
end

post '/' do
  if (@tree.nodes[params["node1"].to_i] && @tree.nodes[params["node2"].to_i])
    @lowest_common_ancestor = Tree.lowest_common_ancestor(
      @tree.nodes[params["node1"].to_i],
      @tree.nodes[params["node2"].to_i]
    ).id
  end

  haml :index
end
