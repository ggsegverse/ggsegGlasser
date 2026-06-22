# Changelog

## ggsegGlasser 2.0.4

- Atlas 2D geometry migrated to the sf-optional `brain_polygons` format
  (`ggseg.formats` 0.0.3). The atlases now render without `sf` and its
  GDAL/GEOS/PROJ system libraries, enabling wasm and air-gapped
  installs. Plots are unchanged.

## ggsegGlasser 1.0.01

- adapted atlases to ggseg \<= 1.6.0
- Added a `NEWS.md` file to track changes to the package.
