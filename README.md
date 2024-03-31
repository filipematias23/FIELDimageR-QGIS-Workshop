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

[Step 12. Correlation and Principal component analysis (PCA)](#p12)

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

* **Download:** [RGB orthomosaics](https://github.com/filipematias23/FIELDimageR-QGIS-Workshop/tree/main/MOSAIC)
* **Download:** [DSM orthomosaics](https://github.com/filipematias23/FIELDimageR-QGIS-Workshop/tree/main/DSM)

<br />
    
> Open QGIS ... There are many ways to create or start a **New Project** in QGIS. The image below highlights some examples:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_29a.jpg">
</p>

<br />

> Upload the raster **MOSAIC/2_40.tif** to QGIS:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_30.jpg">
</p>

<br />

[Menu](#menu)

<div id="p4" />

---------------------------------------------
### Building the plot shapefile

> FIELDimageR-QGIS allows drawing the plot shape file using the function **fieldShape** at the **Processing Toolbox > R > FIELDimageR > fieldShape** to creat a basic *grid_shapefile*. 

<br />

* **Download field data example here:** [fieldData.csv](https://github.com/filipematias23/FIELDimageR-QGIS-Workshop/blob/main/fieldData.csv)
* **Download fieldMap matrix with plots ID example here:** [fieldMap.csv](https://github.com/filipematias23/FIELDimageR-QGIS-Workshop/blob/main/fieldMap.csv)

<br />

> This example has **10 rows** and **14 columns**:

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_6a.jpg">
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

<br />

> Upload the raster **DSM/1_30_dsm.tif** (soil base) and **DSM/3_70_dsm.tif** to QGIS:

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

> Save output_info shapefile (all data) as **Data_Total.shp**:

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/qgis_32.jpg">
</p>

<br />

[Menu](#menu)

<div id="p11" />

---------------------------------------------
### Traits heritability using R

> Open **RStudio** in your computer or launch the **Binder** button to open a virtual RStudio: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/filipematias23/FIELDimageR-QGIS-Workshop.git/main?urlpath=rstudio)

> The following code is an example how to calculate adjusted means and heritability in a simple and fast way. For instance, the same model was evaluated twice, the first with genotyped with random effect to calculate heritability (*package [lme4]( https://cran.r-project.org/web/packages/lme4/index.html)*) and the second as fixed effect (*function lm*) to calculate the adjusted means using the *package [emmeans]( https://cran.r-project.org/web/packages/emmeans/)*. The adjusted means will be used for further statistical analysis in this tutorial. 

```r
############################################
### FIELDimageR: Plant Breeding Pipeline ###
############################################

### Install Packages ###

# requiredPackages = c("devtools","sf","terra","ggplot2","DescTools","lme4","emmeans","reshape2","car","plyr","factoextra","ggrepel","agricolae","corrplot","RStoolbox","gridExtra")
# for(p in requiredPackages){
#   if(!require(p,character.only = TRUE)) install.packages(p)
#   library(p,character.only = TRUE)
# }
# devtools::install_github("filipematias23/FIELDimageR.Extra")
# devtools::install_github("OpenDroneMap/FIELDimageR")

### Necessary packages ###
library(FIELDimageR.Extra)
library(FIELDimageR)
library(mapview)
library(leafsync)
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

Data <- st_read("Data_Total_2.shp")
colnames(Data)
m1<-mapview(Data, zcol = "Trait", legend = TRUE)
m2<-mapview(Data, zcol = "Canopy_Are", legend = TRUE)
m3<-mapview(Data, zcol = "GLI_men", legend = TRUE)
m4<-mapview(Data, zcol = "GLI_m_1", legend = TRUE)
sync(m1,m2,m3,m4)

```

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/Emb5.jpg" width="70%" height="70%">
</p>

<br />

```r
### Field Data ###
Data<-data.frame(Data)
Data$Column<-as.factor(Data$Column)
Data$Row<-as.factor(Data$Row)
Data$Name<-as.factor(Data$Name)

### Mixed model: getting adjusted means and heritability (H2) ###
Trait<-c("Trait","GLI_men","GLI_m_1","Canopy_Are","Stand_area")
hist(Data$GLI_m_1,20)

H2.AG<-NULL
for(t in 1:length(Trait)){
  Data1<-droplevels(Data[!is.na(Data[,colnames(Data)==Trait[t]]),])
  # mod<-lmer(eval(parse(text = paste(Trait[t],"~Column+Row+(1|Name)",sep=""))),data = Data1)
  mod<-lmer(eval(parse(text = paste(Trait[t],"~(1|Name)",sep=""))),data = Data1)
  Var1<-as.data.frame(VarCorr(mod))$vcov
  names(Var1)<-as.data.frame(VarCorr(mod))$grp
  H2.AG<-rbind(H2.AG,data.frame(Trait=Trait[t],
                                H2=round(c(Var1[1]/sum(Var1[1],
                                                       Var1[2]/2 #2 replicates
                                )),3)
  ))
  # mod<-lm(eval(parse(text = paste(Trait[t],"~Column+Row+Name",sep=""))),data = Data1)
  mod<-lm(eval(parse(text = paste(Trait[t],"~Name",sep=""))),data = Data1)
  Adj.Mean<-emmeans(mod, ~ Name)
  if(t==1){
    Pheno.AG<-as.data.frame(Adj.Mean)[,c(1,2)]
  }
  if(t!=1){
    Pheno.AG<-merge(Pheno.AG,as.data.frame(Adj.Mean)[,c(1,2)],by="Name")
  }
}
colnames(Pheno.AG)<-c("Name",Trait)
head(Pheno.AG)

### Traits heritability ###
ggplot(data = H2.AG, 
       aes(x = Trait,
           y = H2*100,
           fill=as.factor(Trait))) +
  geom_bar(stat="identity", position = "dodge") +
  scale_fill_grey(start=0.2, end=0.8)+
  ylim(c(0,100))+
  labs(y="H2 (%)",
       x="", 
       fill="Traits") +
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

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/Emb1.jpg" width="70%" height="70%">
</p>

<br />

[Menu](#menu)

<div id="p12" />

---------------------------------------------
### Correlation and Principal Component Analysis (PCA)

```r
###################
### Correlation ###
###################

Pheno.COR<-scale(Pheno.AG[,-1],scale = T)
rownames(Pheno.COR)<-Pheno.AG[,1]

### Graphic ###
r<-correlation(Pheno.COR)
r$correlation
round(r$pvalue,2)
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(r$correlation, 
         p.mat = r$pvalue,
         sig.level = 0.05, # Level of significance 5%
         method="color", col=col(200),  
         type="upper", order="alphabet",addCoef.col = "black", 
         tl.col="black", tl.srt=45, 
         insig = "blank", 
         diag=FALSE)

```

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/Emb2.jpg" width="50%" height="50%">
</p>

<br />

```r
##########################################
### Principal component analysis (PCA) ###
##########################################

### Merging Agro and UAV adjusted means ###
Pheno.PCA<-Pheno.AG[,-1]
rownames(Pheno.PCA)<-Pheno.AG[,1]

### PCA ###
Pheno.PCA.1 <- prcomp(Pheno.PCA, center = TRUE, scale = TRUE)

### Highlighting checks ###
checks<-c("G20","G30","G51","G89")
groups <- as.character(Pheno.AG$Name)
groups[groups%in%checks]<-"Checks"
groups[groups!="Checks"]<-"Lines"
groups.text <- as.character(Pheno.AG$Name)
groups.text[!groups.text%in%checks]<-""

### PCA visualization ###
fviz_pca_biplot(Pheno.PCA.1,
                col.ind = groups, # color by groups
                legend.title = "",
                palette = c("black", "gray70"),
                repel = TRUE,
                geom.ind = "point",mean.point=F,
                pointsize = 3,
                fill.ind = groups
)+
  geom_text_repel(aes(label = groups.text),size = 3.5)+
  scale_shape_manual(values=c(17,21))+
  theme(legend.position = "right",
        legend.direction = "vertical",
        legend.text = element_text(color="black",size=18),
        legend.title = element_text(color="black",size=18),
        axis.text.y = element_text(color="black",size=14),
        # axis.title = element_text(color="black",size=18),
        axis.text.x = element_text(color="black",size=14),
        strip.text = element_text(color="black",size=18),
        strip.background = element_rect(fill="white"))

```

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/Emb3.jpg"  width="70%" height="70%">
</p>

<br />

[Menu](#menu)

<div id="p13" />
  
---------------------------------------------
### Linear regression

```r
#########################
### Linear Regression ###
#########################

DataTotal.Reg<-Pheno.AG
DataTotal.Reg$Check<-as.character(DataTotal.Reg$Name)
DataTotal.Reg$Check[!DataTotal.Reg$Check%in%c("G20","G30","G51","G89")]<-""

ggplot(DataTotal.Reg,aes(y=Trait, x=GLI_m_1)) + 
  geom_point() +
  geom_smooth(method=lm)+
  labs(y="Trait",x="GLI",fill="",alpha="")+
  geom_vline(aes(xintercept=0.15),col="red", linetype = 2, size=0.7) +
  theme_bw()+
  geom_text_repel(aes(label = Check),
                  size = 3.5, col="red",
                  box.padding   = 0.35, 
                  point.padding = 0.5,
                  segment.color = 'grey50')+
  theme(legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) 

ggplot(DataTotal.Reg,aes(y=Canopy_Are, x=GLI_men)) + 
  geom_point() +
  geom_smooth(method=lm)+
  labs(y="Canopy",x="GLI",fill="",alpha="")+
  geom_vline(aes(xintercept=0.025),col="red", linetype = 2, size=0.7) +
  theme_bw()+
  geom_text_repel(aes(label = Check),
                  size = 3.5, col="red",
                  box.padding   = 0.35, 
                  point.padding = 0.5,
                  segment.color = 'grey50')+
  theme(legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) 

```

<br />

<p align="center">
  <img src="https://github.com/filipematias23/images_FQ/blob/main/readme/Emb4.jpg">
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
  
* [Filipe Matias](https://www.linkedin.com/in/filipe-matias-27bab5199/)
* [Popat Pawar](https://www.linkedin.com/in/dr-popat-pawar-204bb136/)
  
<br />

[Menu](#menu)

<br />
