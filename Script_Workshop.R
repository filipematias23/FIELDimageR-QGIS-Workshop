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

### Field data collected manually ###
Data <- st_read("Data_Total_2.shp")
colnames(Data)
m1<-mapview(Data, zcol = "Trait", legend = TRUE)
m2<-mapview(Data, zcol = "Canopy_Are", legend = TRUE)
m3<-mapview(Data, zcol = "GLI_men", legend = TRUE)
m4<-mapview(Data, zcol = "GLI_m_1", legend = TRUE)
sync(m1,m2,m3,m4)

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

##########
### END ##
##########