# Directly taken from Daniel Azuma here: 
# http://www.daniel-azuma.com/blog/archives/28
require 'rubygems'
require 'rgeo'

# Support Cartesian (flat) geometry
factory = RGeo::Cartesian.factory

# Create points
p1 = factory.point(1, 2)
p2 = factory.point(3, 4)
p3 = factory.point(5, 2)

# Create a more complex shapes
line1 = factory.line_string([p1, p2, p3])
polygon = factory.polygon(factory.linear_ring([p1, p2, p3, p1]))

# Parse "well-known text" format
line2 = factory.parse_wkt('LINESTRING(1 4, 4 1)')

# Perform geometric operations and calculations
line3 = polygon.intersection(line2)
dist = line3.distance(p3)
puts "Line3 to p3 distance: #{dist}"

# Support geographic calculations
geofactory = RGeo::Geographic.spherical_factory

# Longitude-latitude coordinates
loc1 = geofactory.point(-122.33, 47.62)  # (Seattle)
loc2 = geofactory.point(-73.97, 40.78)   # (New York)

# Uses spherical (haversine) formulas
dist = loc1.distance(loc2)
puts dist
