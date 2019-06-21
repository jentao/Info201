cat(nrow(iris), "different flowers \n")
with(iris, 
     plot(Sepal.Length ~Sepal.Width,
          col = Species, cex = 2)
     )
