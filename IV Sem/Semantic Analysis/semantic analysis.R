library(tm)
library(ggplot2)
library(lsa)

text <- c("transporting food by cars will cause global warming .so we should go local",
          "we should try to convince our parents to stop using cause  because it will cause global warming",
          "some food, such as mongo,require  a warm weather to grow.so htey have to be transported to canada",
          "a typical electronic circuit can be build wth a battert,a bulb, and a switch",
          "electricy flow form batteries to the bulb, just like water flows through a tube ",    
          "batteries have chemical energe in it. then electrongs flow through a bulb to light it up",
          "birds can flu because they have feather and they are light",
          "why some birds like pigeon can fly while some others like chicken cannot?",
          "feather is important for birds fly.if feather on a bird's wing is removed, this bird cannot fly.")
text
#factoring 
view <- factor(rep(c("view 1", "view 2", "view 3"), each = 3))
view

#converting it to data frame
df <- data.frame(text,view,stringAsFactors=FALSE)
df
View(df)


#corpus
corpus <- Corpus(VectorSource(df$text))
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, function(x) removeWords(x, stopwords("english")))
corpus <- tm_map(corpus, stemDocument,language = "english")
corpus

#term document matrix
td.mat <- as.matrix(TermDocumentMatrix(corpus))
View(td.mat)

#distance matrix
dist.mat <- dist(t(as.matrix(td.mat)))
dist.mat

#classical mulidimensional scalling
fit <- cmdscale(dist.mat, eig=TRUE, k=2)
fit

#converting to dataframe
points <-data.frame(x=fit$points[, 1],y=fit$points[, 2])
View(points)
points
#plot
ggplot(points, aes(x=x,y=y))+
       geom_point(data=points,aes(x=x,y=y, color=df$view))+
       geom_text(data=points,aes(x=x,y=y-0.2,label=row.names(df)))

#weightim
td.mat.lsa <- lw_bintf(td.mat)*gw_idf(td.mat)
View(td.mat.lsa)

#LSA
lsaSpace <- lsa(td.mat.lsa)
lsaSpace

#computing distance matrix for LSA
dist.mat.lsa <- dist(t(as.textmatrix(lsaSpace)))
dist.mat.lsa

#classical multidimensional scalling for LSA
fit_lsa <- cmdscale(dist.mat.lsa, eig=TRUE, k=2)
fit_lsa

#converting to Dataframe
points_lsa <-data.frame(x=fit$points[, 1],y=fit$points[, 2])
View(points_lsa)

#plot for LSA
ggplot(points_lsa, aes(x=x,y=y))+
  geom_point(data=points_lsa,aes(x=x,y=y, color=df$view))+
  geom_text(data=points_lsa,aes(x=x,y=y-0.2,label=row.names(df)))

#Importing 3D visualization library
library(scatterplot3d)

#classical multidimensional scalling ofr lsa
fit2 <- cmdscale(dist.mat.lsa, eig=TRUE,k=3)
fit2

colors <- rep(c("blue", "green", "red"), each=3)
colors

#3D sctterplot
scatterplot3d(fit2$points[, 1], fit2$points[, 2], fit2$points[, 3],
              color=colors, pch=16,main="semantic space scaled to 3D",
              xlab="x", ylab = "y", zlab = "z", type = "h")
