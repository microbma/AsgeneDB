setwd("$")
library(stringr)
library(dplyr)
list <- list.files(pattern = ".diamond")
for (i in list){ 
  a <- read.table(file=i,sep ="\t",header = F)
  colnames(a)[1] = "reads_id"
  colnames(a)[2] = "protein_id"
  a <- a[,1:2] %>% filter(!duplicated(a[,1]))
  i<- gsub(".diamond","",i)
  a1<- mutate(a,"sample"=i) 
  id_gene_tax_pathway <- read.csv("id_gene_tax_pathway.csv",sep=",",header = T)
  sample_gene_tax_pathway <- merge(a1,id_gene_tax_pathway,by="protein_id" )
  write.table(sample_gene_tax_pathway, file = paste("$",i,".csv",sep = ""),sep=",",quote = FALSE,row.names = FALSE)
}
a <- list.files(pattern = ".csv")
n <- length(a)
merge.data <- read.csv(file = a[1],header=T,sep=",") 
merge.data1 <- data.frame(merge.data)
for (i in 2:n){
  new.data =read.csv(file=a[i],sep = ",",header =T)
  merge.data1 = merge(merge.data1,new.data,all=T)
}
write.csv(merge.data1,file="sample_gene_tax_pathway.csv",row.names=F)