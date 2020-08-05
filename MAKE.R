# Required packages
pkgTest <- function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dep = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop("Package not found")
    }
  }
}
pkgTest("ape")
pkgTest("fasterize")
pkgTest("picante")
pkgTest("raster")
pkgTest("rotl")
pkgTest("sf")
pkgTest("tidyverse")

# Check that packages were installed
if (any(!pkgs %in% installed.packages())) {
  cat("Package installation error\n", file = "err.txt")
}

# Check that data loads
marmam_shp <- sf::st_read("data/marmam.shp", quiet = TRUE)
marmam_tr <- ape::read.tree("data/marmam.nex")
coastline_shp <- sf::st_read("data/coastline.shp", quiet = TRUE)
if (any(!c("marmam_shp", "marmam_tr", "coastline_shp") %in% ls())) {
  cat("Data load error\n", file = "err.txt", append = TRUE)
}
