################################################################
# Loading libraries;
################################################################

# For GNU/Linux users: Note, please, that rgdal can not be installed on R 
# if some libraries outside of R are not present; make sure the following 
# four libraries are installed:
# 
# sudo apt-get install gdal-bin proj-bin libgdal-dev libproj-dev

library(maps)
library(rgdal)

################################################################
# Loading shapefiles as separate R objects;
################################################################

# Countries of Eurasia (including some extensions beyond Eurasia) as borderlines and polygons;
cnt.l <- readOGR("Marx.1905.Countries.lines/Marx.1905.Countries.lines.shp")
cnt.p <- readOGR("Marx.1905.Countries.polygons/Marx.1905.Countries.polygons.shp")

# Governorates, provinces, territories, and districts of the Russian Empire as borderlines and polygons;
gvt.l <- readOGR("Marx.1905.Governorates.lines/Marx.1905.Governorates.lines.shp")
gvt.p <- readOGR("Marx.1905.Governorates.polygons/Marx.1905.Governorates.polygons.shp")

# Major lakes (surface bigger than 6,000 square km) polygons (some of them differ considerably from their present-day state);
lac.p <- readOGR("Marx.1905.Major_lakes.polygons/Marx.1905.Major_lakes.polygons.shp")

# Russian Empire and Empire of Japan after the 1905 war;
rusjap.1905.l <- readOGR("Marx.1905.Russia_and_Japan_after_the_war.lines/Marx.1905.Russia_and_Japan_after_the_war.lines.shp")
rusjap.1905.p <- readOGR("Marx.1905.Russia_and_Japan_after_the_war.polygons/Marx.1905.Russia_and_Japan_after_the_war.polygons.shp")

# Bosnia and Herzegovina AND Eastern Rumelia represented separately from Austria-Hungary and Greece;
bher.l <- readOGR("Marx.1905.Occupied_Ottoman_Dependencies.lines/Marx.1905.Occupied_Ottoman_Dependencies.lines.shp")
bher.p <- readOGR("Marx.1905.Occupied_Ottoman_Dependencies.polygons/Marx.1905.Occupied_Ottoman_Dependencies.polygons.shp")

################################################################
# Control plots;
################################################################

# World map showing the extent of the shapefiles;
map(fill=TRUE, col=8, border=8) # Basic world map with borders suppressed;
plot(cnt.p, col=3, add=TRUE) # Countries polygons object plotted;
plot(lac.p, col="cyan", add=TRUE) # Major lakes polygons object plotted;
dev.off() # Optional, to clean the graphical device, as the map() function changes the default graphical console parameters;

# Europe;
map(fill=TRUE, col=8, border=8, xlim=c(-10,60), ylim=c(35,75)) # Basic world map with borders suppressed (focus on Europe);
plot(cnt.p, col=3, add=TRUE) # Countries polygons object plotted;
plot(gvt.p, col=2, add=TRUE) # Governorates polygons object plotted;
plot(lac.p, col="cyan", add=TRUE) # Major lakes polygons object plotted;
dev.off() # Optional, to clean the graphical device, as the map() function changes the default graphical console parameters;

# Europe with no underlying 'map';
plot(cnt.p, col=3, xlim=c(-10,60), ylim=c(35,75)) # Countries polygons object plotted (focus on Europe);
plot(gvt.p, col=2, add=TRUE) # Governorates polygons object plotted;

# Boundaries old and new juxaposed;
map(fill=TRUE, col=8, xlim=c(-10,60), ylim=c(35,75)) # Basic world map with borders (focus on Europe);
plot(cnt.l, col=2, add=TRUE) # Countries lines object plotted;
plot(lac.p, col="cyan", add=TRUE) # Major lakes object plotted;
