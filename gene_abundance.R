setwd("$")
library(dplyr)
list <-read.table("sampleinfo.txt",sep = "\t",header =F)
for (i in list[,1]){ 
  a <- read.table(file=paste(i,"_R1",sep=""),sep = " ")
  a1 <- data.frame(a)
  b <- read.table(file=paste(i,"_R2",sep=""),sep = " ")
  b1 <- data.frame(b)
  e <- rbind(a1,b1) 
  e1 <- aggregate(e[,3]~e[,1],data=e,FUN="max")
  colnames(e1)[1] <- "V1"
  colnames(e1)[2] <- "V3"
  e1 <- merge(e1,e,by=c("V1","V3"))
  e1 <- e1 %>% filter(!duplicated(V1))
  write.table(e1,file=paste("/data2/sxw/global_asgene/diamond_fliter_id80/cxzp_merge/",i,".diamond",sep=""), sep= " ",quote = FALSE,row.names = FALSE,col.names = F)
}

file.name <- list.files(pattern = ".diamond")
for (i in file.name){ 
  a <- read.table(file=i,sep = " ")
  i<- gsub(".diamond","",i)
  a1<- mutate(a,v=i)
  
  #add total reads
  list<-data.frame(list)
  colnames(list)[1]<-"v"
  sample <- gsub(".diamond","",list$v)
  list$v <- sample
  t<- list [grep(i,list$v),]
  a2 <- merge(t,a1,by="v")
  
  b <- read.table("asgene.map",sep = "")
  colnames(a2)[5] <- "pi"
  colnames(b)[1] <- "pi"
  colnames(b)[2] <- "gene"
  g<-merge(a2,b,by="pi")
  g <- g[,-c(5,6,7,8,9,10,11,12,13,14,16)]
  colnames(g)[3]<-"totalreads"
  u <- read.table("length.txt",sep = "\t",header = F)
  colnames(u)[1] <- "pi"
  result <- merge(g,u,by="pi")
  colnames(result)[6]<-"length"
  x <- result
  x <-x[order(x$gene),]
  
  y<-count(x,x$pi)
  colnames(y)[1]<-"pi"
  v<-merge(x,y,by="pi")
  v1 <- v[!duplicated(v$pi),]
  
  #Formula=SUM protein{[mapped reads/(total reads*protein length)]*10^9} 
  
  df<- data.frame(v1)
  df<- mutate(df,c=v1$n*10^9/v1$length)
  df<- mutate(df,d=c/v1$totalreads)
  #group_by_sum 
  df1<-aggregate(df$d,by=list(df$gene),sum)
  colnames(df1) <- c("gene",as.character(i)) 
  gsub(".diamond","",df1)
  write.table(df1, file = paste("$",i, ".csv",sep = ""),sep=",",quote = FALSE,row.names = FALSE)
}

a <- list.files(pattern=".csv")
n <- length(a)
merge.data <- read.csv(file = a[1],header=T,sep=",") 
merge.data1 <- data.frame(merge.data)
for (i in 2:n){
  new.data =read.csv(file=a[i],sep = ",",header =T)
  #new.data1 = data.frame(new.data)
  merge.data1 = merge(merge.data1,new.data,by="gene",all=T)
}
write.csv(merge.data1,file="merge.csv",row.names=F)
