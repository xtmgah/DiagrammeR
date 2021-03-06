% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/edge_count.R
\name{edge_count}
\alias{edge_count}
\title{Get count of all edges or edges with distinct relationship types}
\usage{
edge_count(graph, relationship = FALSE)
}
\arguments{
\item{graph}{a graph object of class \code{dgr_graph} that is created using \code{create_graph}.}

\item{relationship}{either a logical value, where \code{TRUE} provides a named vector of edge count by type and \code{FALSE} (the default) provides a total count of edges, or, a string corresponding to one or more edge relationship types.}
}
\value{
a numeric vector of single length.
}
\description{
From a graph object of class \code{dgr_graph}, get a count of edges in the graph and optionally obtain a count of edges by their relationship type.
}
\examples{
\dontrun{
# Before getting counts of edges, create a simple graph
nodes <-
  create_nodes(nodes = LETTERS,
               label = TRUE,
               type = c(rep("a_to_g", 7),
                        rep("h_to_p", 9),
                        rep("q_to_x", 8),
                        rep("y_and_z",2)))

edges <-
  create_edges(from = sample(LETTERS, replace = TRUE),
               to = sample(LETTERS, replace = TRUE),
               label = "edge",
               relationship = "letter_to_letter")

graph <-
  create_graph(nodes_df = nodes,
               edges_df = edges,
               graph_attrs = "layout = neato",
               node_attrs = c("fontname = Helvetica",
                              "shape = circle"))

# Get a total count of edges with no grouping
edge_count(graph, relationship = FALSE)
#> [1] 26
}
}

