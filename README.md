## [FIELDimageR-QGIS-Workshop](https://github.com/filipematias23/FIELDimageR-QGIS-Workshop)

> Workshop presenting [FIELDimageR-QGIS](https://github.com/filipematias23/FIELDimageR-QGIS) pipeline and examples of remote sensing data applications on plant breeding experiments.

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_logo.jpg" width="50%" height="50%">
</p>

<div id="menu" />

---------------------------------------------
## Resources
  
[Step 1. Installation](#instal)

[Step 2. Orthomosaic using WebODM](#p2)

[Step 3. Loading mosaics and visualizing using QGIS](#p3)

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
2. [RStudio](https://posit.co/download/rstudio-desktop/)
3. [QGIS](https://qgis.org/en/site/)

<br />

> Videos:

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
### Loading mosaics and visualizing using QGIS

> Download data example:

* **Download:** [RGB orthomosaics](https://drive.google.com/file/d/1amEezZ1M2fNUkyXunHpl-w919qUWWDY_/view)
* **Download:** [DSM orthomosaics](https://drive.google.com/file/d/1rRKW0XWOzVe2h6qADadBGw5hchEGzjz2/view)

<br />
    
> Open QGIS ... There are many ways to create or start a **New Project** in QGIS. The image below highlights some examples:

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

* **Download field data example here:** [fieldData.csv]()
* **Download fieldMap matrix with plots ID example here:** [fieldMap.csv]()

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

* [**Download EX_DSM0.tif**](https://drive.google.com/open?id=1lrq-5T6x_GrbkCtpDSDiX1ldvSwEBFX-)
* [**Download EX_DSM1.tif**](https://drive.google.com/open?id=1q_H4Ef1f1yQJOPtkVMJfcb2SvHcxJ3ya) 

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

> Before saving the output, let´s join all data in one file at:

**`Layers Sidebar > Right mouse click on the layer containing the polygons > Properties > Joins > Add the layer you want to join based  on the columns name`**

> Saving shapefiles (e.g., grids, points, polygons, etc.):

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_32.jpg">
</p>

<br />

[Menu](#menu)

<div id="p11" />

---------------------------------------------
### Traits heritability using R

> Open **RStudio** in your computer or launch the **Binder** button to open a virtual RStudio: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/filipematias23/FIELDimageR.Extra-Workshop-02.git/main?urlpath=rstudio)

> The following code is an example how to calculate adjusted means and heritability in a simple and fast way. For instance, the same model was evaluated twice, the first with genotyped with random effect to calculate heritability (*package [lme4]( https://cran.r-project.org/web/packages/lme4/index.html)*) and the second as fixed effect (*function lm*) to calculate the adjusted means using the *package [emmeans]( https://cran.r-project.org/web/packages/emmeans/)*. The adjusted means will be used for further statistical analysis in this tutorial. 

```r
############################################
### FIELDimageR: Plant Breeding Pipeline ###
############################################

### Install Packages ###
requiredPackages = c("devtools","sf","terra","ggplot2","DescTools","lme4","emmeans","reshape2","car","plyr","factoextra","ggrepel","agricolae","corrplot","RStoolbox","gridExtra")
for(p in requiredPackages){
  if(!require(p,character.only = TRUE)) install.packages(p)
  library(p,character.only = TRUE)
}
devtools::install_github("filipematias23/FIELDimageR")

### Necessary packages ###
library(FIELDimageR)
library(sf)
library(terra)
library(ggplot2)
library(DescTools)
library(lme4)
library(emmeans)
library(reshape2)
library(car)
library(plyr)
library(factoextra)
library(ggrepel)
library(agricolae)
library(corrplot)
library(RStoolbox)
library(gridExtra)

#########################
### Evaluating Traits ###
#########################

### Field data collected manually ###
Data <- 
Data$RANGE<-as.factor(Data$RANGE)
Data$ROW<-as.factor(Data$ROW)
Data$NAME<-as.factor(Data$NAME)

### Mixed model: getting adjusted means and heritability (H2) ###
Trait<-c("MAT_DAY","HT","DH","LODG","YLD")
H2.AG<-NULL
for(t in 1:length(Trait)){
  Data1<-droplevels(Data[!is.na(Data[,colnames(Data)==Trait[t]]),])
  # mod<-lmer(eval(parse(text = paste(Trait[t],"~RANGE+ROW+(1|NAME)",sep=""))),data = Data1)
  mod<-lmer(eval(parse(text = paste(Trait[t],"~(1|NAME)",sep=""))),data = Data1)
  Var1<-as.data.frame(VarCorr(mod))$vcov
  names(Var1)<-as.data.frame(VarCorr(mod))$grp
  H2.AG<-rbind(H2.AG,data.frame(Trait=Trait[t],
                          H2=round(c(Var1[1]/sum(Var1[1],
                                           Var1[2]/2 #2 replicates
                          )),3)
                          ))
  # mod<-lm(eval(parse(text = paste(Trait[t],"~RANGE+ROW+NAME",sep=""))),data = Data1)
  mod<-lm(eval(parse(text = paste(Trait[t],"~NAME",sep=""))),data = Data1)
  Adj.Mean<-emmeans(mod, ~ NAME)
  if(t==1){
    Pheno.AG<-as.data.frame(Adj.Mean)[,c(1,2)]
  }
  if(t!=1){
    Pheno.AG<-merge(Pheno.AG,as.data.frame(Adj.Mean)[,c(1,2)],by="NAME")
  }
}
colnames(Pheno.AG)<-c("NAME",Trait)
head(Pheno.AG)

### Agronomical traits heritability ###
ggplot(data = H2.AG, 
       aes(x = Trait,
           y = H2*100,
           fill=as.factor(Trait))) +
  geom_bar(stat="identity", position = "dodge") +
  scale_fill_grey(start=0.2, end=0.8)+
  ylim(c(0,100))+
  labs(y="H2 (%)",
       x="", 
       fill="Agronomical Traits") +
  geom_text(aes(label=paste(H2*100,"%")),size=5, position=position_dodge(width=0.9), vjust=-0.25)+
  theme_bw()+
  theme(legend.position = "right",
        legend.direction = "vertical",
        legend.text = element_text(color="black",size=18),
        legend.title = element_text(color="black",size=18),
        axis.text.y = element_text(color="black",size=18),
        axis.title = element_text(color="black",size=18),
        axis.text.x = element_blank(),
        axis.ticks.x=element_blank(),
        strip.text = element_text(color="black",size=18),
        strip.background = element_rect(fill="white")) 
```

<p align="center">
  <img src="https://raw.githubusercontent.com/filipematias23/images/master/readme/BF_9a.jpeg" width="80%" height="80%">
</p>

<br />

[Menu](#menu)

<div id="p12" />

---------------------------------------------
### Correlation](#p12)



<br />

[Menu](#menu)

<div id="p13" />
  
---------------------------------------------
### Linear regression



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
