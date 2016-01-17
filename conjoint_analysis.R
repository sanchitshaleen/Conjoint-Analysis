library(conjoint)

attribute<-list(
  Origin=c("European","Canadian","Japanese"),
  Price=c("6.19","5.49","4.79"),
  Body=c("Rich full bodied","Regular","Crisp and clear"),
  Aftertaste=c("strong","mild", "very mild"),
  Calories=c("full", "regular", "low"),
  Packaging=c("Six 12Oz Large", "Six 12Oz Small",   "Four 16Oz"),
  Glass=c("Green Label",    "Brown Label",  "Brown Painted")
)

profiles<-expand.grid(attribute)

design<-caFactorialDesign(data=profiles,type="fractional", cards=21)
print(design)

nrow(design)

KrinLev <- read.csv("KrinLev.csv", header=F)
KrinPref <- read.csv("KrinPref.csv")

Conjoint(KrinPref,design,KrinLev)

imp<-caImportance(KrinPref,design)
imp

uti<-caPartUtilities(KrinPref,design,KrinLev)
uti

library(cluster)
library(fpc)
plotcluster(KrinPref, segments$cluster)
?plotcluster




