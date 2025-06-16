# ArcPy Cairo Thermal Comfort Reclassification

This repository contains an ArcPy-based Python script to process and reclassify nighttime thermal comfort indices extracted from NetCDF files over Cairo for the year 2024. The script automates raster layer generation, classification into thermal comfort categories, and RGB color assignment for visualization.

## Features
- Handles multiple NetCDF climate datasets
- Converts NetCDF to raster using ArcPy
- Reclassifies values into 10 thermal comfort categories
- Assigns RGB colors for visual representation
- Adds a raster attribute table with color fields

## Prerequisites
- Python (3.x)
- ArcGIS Pro (ArcPy)
- netCDF4 Python package

## Run the Script
Update the base directory path:
```python
base_dir = r"E:\\path\\to\\your\\NetCDF\\files"
