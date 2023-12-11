##FIELDimageR=group
##mosaic_layer=raster
##grid_shapefile_layer=vector
##fun_extract=selection mean;sum;min;max;summary
##output_shapefile_info=output vector

# Get input parameters from QGIS
library(terra)
library(dplyr)
library(sf)
library(exactextractr)
# Load the raster layer
mosaic <- rast(mosaic_layer)

# Load the shaoefile layer
fieldShape <- st_as_sf(grid_shapefile_layer)
fieldShape <- st_transform(fieldShape,st_crs(mosaic))
fun <- fun_extract
print(fun)
if(fun==0){
fun='mean'
plotInfo <- exact_extract(mosaic, fieldShape, fun = fun)
}else if(fun==1){
fun='sum'
plotInfo <- exact_extract(mosaic, fieldShape, fun = fun)
}else if(fun==2){
fun='min'
plotInfo <- exact_extract(mosaic, fieldShape, fun = fun)
}else if(fun==3){
fun='max'
plotInfo <- exact_extract(mosaic, fieldShape, fun = fun)
}else if(fun==4){
fun=c('mean','sum','max','min','mode','stdev','variance','coefficient_of_variation','majority','minority')
plotInfo <- exact_extract(mosaic, fieldShape, fun)
}

Out<-cbind(fieldShape, plotInfo[,!colnames(plotInfo)%in%c("ID"),drop=FALSE])

# Write the grid shapefile to disk
output_shapefile_info <- Out
