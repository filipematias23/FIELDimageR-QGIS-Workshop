## [FIELDimageR-QGIS-Workshop](https://github.com/filipematias23/FIELDimageR-QGIS-Workshop)

> Workshop presenting the [FIELDimageR-QGIS](https://github.com/filipematias23/FIELDimageR-QGIS) tutorial and phenomics application on plant breeding.

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_logo.jpg" width="50%" height="50%">
</p>

<div id="menu" />

---------------------------------------------
## Resources
  
[Step 1. Installation](#instal)

[Step 2. Orthomosaic using WebODM](#p2)

[Step 3. Loading mosaics and visualizing](#p3)

[Step 4. Plot grid-shapefile](#p4)

[Step 5. Building vegetation indices](#p5)

[Step 6. Estimating plant height and biomass](#p6)

[Step 7. Canopy evaluation](#p7) 

[Step 8. Extracting data per plot](#p8)

[Step 9. Stand Count](#p9)

[Step 10. Saving output files](#p10)

[Step 11. Traits heritability using R](#p11)

[Step 12. Correlation](#p12)

[Step 13. Linear regression](#p13)

[Contact](#contact)

<div id="instal" />

---------------------------------------------
### Installation

> Start the pipeline by installing the software:

1. [R](https://www.r-project.org/) 
2. [QGIS](https://qgis.org/en/site/).

<br />

* **Video Tutorial 01:** FIELDimageR Installation [https://youtu.be/vEp-iUpJCIQ](https://youtu.be/vEp-iUpJCIQ)

* **Video Tutorial 02:** FIELDimageR-QGIS Installation [https://youtu.be/1ugwjOSe_Qo](https://youtu.be/1ugwjOSe_Qo)

<br />

[Menu](#menu)

<div id="p2" />

---------------------------------------------
### Orthomosaic using **[WebODM](https://www.opendronemap.org/webodm/)**

> After collecting single images using drones the next step is to stitch all images in one orthophoto. For instance, we will use the open-source software **WebODM** from the [OpenDroneMap](https://www.opendronemap.org/) community.

* First of all, open and register to use the free version of WebODM: [https://webodm.net/](https://webodm.net/) 

> **Donwload pictures:** [Images Dataset](https://drive.google.com/open?id=1t0kjcBy6QzmIz_fVs6vsgZXi9Afqe09b).

For this workshop, our goal is to use an example of RGB images from one experimental trials of UW-Madison Potato Breeding and Genetics Laboratory during the flowering time at Hancock Agricultural Research Station. Flight altitude was 60 m above ground, flight speed was 24 km/h, and image overlap was 75%. 

* *If needed you can donwload the final ortho here:* [odm_orthophoto.tif](https://drive.google.com/open?id=1XCDvbFdzHDmRA1dJSMp_veX_xC_ThiqC)*.

<br />

<p align="center">
  <img src="https://raw.githubusercontent.com/filipematias23/images/master/readme/ODM_FIELDimageR_New.jpg" width="60%" height="60%">
</p>

<br />

[Menu](#menu)

<div id="p3" />

---------------------------------------------
### Loading mosaics and visualizing

> There are many ways to create or start a **New Project** in QGIS. The image below highlights some examples:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_29a.jpg">
</p>

<br />

> Uploading files (e.g., raster, table, shapefiles, etc.) to QGIS is very simple:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_30.jpg">
</p>

<br />

[Menu](#menu)

<div id="p4" />

---------------------------------------------
### Building the plot shapefile

> FIELDimageR-QGIS allows drawing the plot shape file using the function **fieldShape** at the **Processing Toolbox > R > FIELDimageR > fieldShape** to creat a basic *grid_shapefile*. 

* **Download field data example here:** [fieldData.csv](https://drive.google.com/file/d/1elAOEg-tw_zMQuPnZT5MTwWmrpB-sYSv/view?usp=sharing)
* **Download fieldMap matrix with plots ID example here:** [fieldMap.csv](https://drive.google.com/file/d/1lFqZFmaXqzk3UqoN5VH_lOLRilzB6K_d/view?usp=sharing)

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_6a.jpg">
</p>

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_8.jpg">
</p>

<br />

> **Editing the plot shapefile:** QGIS has great tools to edit shapefiles and plots.

* Activate it at **View > Toolbars > Advanced Digitizing Toolbar**

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_27.jpg">
</p>

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_28.jpg">
</p>

<br />

[Menu](#menu)

<div id="p5" />

---------------------------------------------
### Building vegetation indices

> Let´s use the function [**`fieldIndex`**](https://github.com/filipematias23/FIELDimageR-QGIS?tab=readme-ov-file#p5) to calculate vegetation indices. You need to write a name as **'Index.tif'** or save the **output_index** in a folder (Do not forget to write/save it otherwise the function doesn´t work) !!!

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_14a.jpg">
</p>

<br />

> To better visualize specific vegetation index you can coloring it by doing a duble click at **Indices layer** and folowing the steps below:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_15.jpg">
</p>

<br />

[Menu](#menu)

<div id="p6" />

---------------------------------------------
### Estimating plant height and biomass

> The plant height can be estimated with the function **`fieldHeight`** by calculating the Canopy Height Model (CHM) and biomass by calculating Canopy Volume Model (CVM).

* [**Download EX_DSM0.tif**](https://drive.google.com/open?id=1lrq-5T6x_GrbkCtpDSDiX1ldvSwEBFX-))
* [**Download EX_DSM1.tif**](https://drive.google.com/open?id=1q_H4Ef1f1yQJOPtkVMJfcb2SvHcxJ3ya)) 

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_19.jpg" width="70%" height="70%">
</p>

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_20.jpg">
</p>

<br />

[Menu](#menu)

<div id="p7" />

---------------------------------------------
### Canopy Evaluation

> The mask output from **`fieldMask`** and the grig_fieldshape output from **`fieldShape`** can be used with the function to use: **`fieldArea`** to calculate canopy cover.

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_24.jpg">
</p>

<br />

[Menu](#menu)

<div id="p8" />

---------------------------------------------
### Extracting Data

> Extracting the mean, max, min, and sum per plot is very intuitive by using the function **`fieldInfo`**. Checking the **Attribute Table** to make sure data were extracted.

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_17.jpg">
</p>

<br />

> Coloring plots:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_33.jpg">
</p>

<br />

[Menu](#menu)

<div id="p9" />

---------------------------------------------
#### Stand count

> To count plants during early stages the *mosaic_NoSoil* from **`fieldMask`** and the *grid_fieldshape* from **`fieldShape`** can be used with the function **`fieldCount`**.

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_46.jpg">
</p>

<br />

[Menu](#menu)

<div id="p10" />

---------------------------------------------
### Saving output files

> Saving shapefiles (e.g., grids, points, polygons, etc.):

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_32.jpg">
</p>

<br />

[Menu](#menu)

<div id="contact" />

---------------------------------------------
### More information:

* [FIELDimageR R package](https://github.com/OpenDroneMap/FIELDimageR)
* [FIELDimageR.Extra R package](https://github.com/filipematias23/FIELDimageR.Extra)

<br />

### Authors
  
> [Filipe Matias](https://www.linkedin.com/in/filipe-matias-27bab5199/)
> [Popat Pawar](https://www.linkedin.com/in/dr-popat-pawar-204bb136/)
  
<br />

[Menu](#menu)

<br />
