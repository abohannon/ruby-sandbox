class Graph
  attr_reader :nodes, :edges

  def initialize
    @nodes = []
    @edges = {}
  end

  def add_node(node)
    @nodes << node
    @edges[node] = []
  end

  def add_edge(node1, node2, weight)
    @edges[node1] << { node: node2, weight: weight }
    @edges[node2] << { node: node1, weight: weight }
  end
end

graph = Graph.new

graph.add_node("Fullstack")
graph.add_node("Starbucks")
graph.add_node("Dig Inn")

graph.add_edge("Fullstack", "Starbucks", 6)
graph.add_edge("Fullstack", "Dig Inn", 7)

p graph.nodes
p graph.edges

