#' Render graph with visNetwork
#' @description Render a graph object with the visNetwork R package.
#' @param graph a \code{dgr_graph} object, created using the \code{create_graph} function.
#' @param nav_buttons a boolean value that determines whether navigation buttons should be displayed along with the rendered graph.

visnetwork <- function(graph,
                       nav_buttons = TRUE){

  # Extract node and edge data frames from the graph object
  nodes <- graph$nodes_df
  edges <- graph$edges_df

  # Modify names of columns in 'nodes' for compatibility with
  # visNetwork data frames for nodes
  colnames(nodes)[which(colnames(nodes) == "nodes")] <- "id"
  colnames(nodes)[which(colnames(nodes) == "type")] <- "group"
  colnames(nodes)[which(colnames(nodes) == "fillcolor")] <- "color"

  # Modify names of columns in 'edges' for compatibility with
  # visNetwork data frames for edges
  colnames(edges)[which(colnames(edges) == "relationship")] <- "label"
  colnames(edges)[which(colnames(edges) == "label")] <- "title"
  colnames(edges)[which(colnames(edges) == "penwidth")] <- "value"

  # Change all X11 colors to hexadecimal values for node colors
  if ("color" %in% colnames(nodes)){
    for (i in 1:length(nodes$color)){

      if (i == 1) hex_color_values <- vector(mode = 'character', length = 0)

      a_hex_color <- x11_hex()[which(x11_hex()[,1] %in% nodes$color[i]),2]

      hex_color_values <- c(hex_color_values, a_hex_color)

      if (i == length(nodes$color)) nodes$color <- hex_color_values
    }
  }

  # Render the graph
  visNetwork(nodes = nodes, edges = edges) %>%
    visEdges(arrow = 'to', color = 'gray') %>%
    visInteraction(navigationButtons = TRUE)
}
