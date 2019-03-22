# parcoords draft version for use with SOS only                #
# adapted from timelyportfolio/parcoords                       #
# Please do not clone, unless you know what you are doing!     #
```
# use devtools::install_github to install
# devtools::install_github("brigitte-dorner/parcoordsSoS")

library(parcoordsSoS)

data(mtcars)

parcoords(
  mtcars
  ,reorderable = T
  ,brushMode = "2d-strums"
)
```

