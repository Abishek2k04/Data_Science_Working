library(udpipe)

data(brussels_listings, package = 'udpipe')
View(data)

x <- table(brussels_listings$neighbourhood)
View(x)

#sorting
x <- sort(x)
x1<- sort(x,decreasing = TRUE)
View(x)
View(x1)

library(textplot)
textplot_bar(x,panel = "Locations", col.panel = "darkgrey",
             xlab = "Listings", cextext =0.75,addpct = TRUE,
             cexpct = 0.5)
#imp data set
data(brussels_reviews_anno, package = 'udpipe')
View(brussels_reviews_anno)

#segmentation
y <- subset(brussels_reviews_anno,
            xpos%in% "NN" & language %in% "nl" & !is.na(lemma))
View(y)

#document term frequency
y1 <- document_term_frequencies(y , document = "doc_id", term = "lemma")
View(y1)

dtm <- document_term_matrix(y1)
dtm
#remoe lowfreq
dtm <- dtm_remove_lowfreq(dtm, maxterms = 60)
dtm

#correlation matrix
cor <- dtm_cor(dtm)
View(cor)


library(glasso)
#word occupation plot

w<- subset(brussels_reviews_anno, xpos %in% "JJ" & language %in% "fr")
View(w)

w <-cooccurrence(w, group = "doc_id", term = "lemma")
w

textplot_cooccurrence(w, top_n = 40, subtitle = "showing only top 25")

#dependancy parshing
sentence <- "Hey friends, welcome to the class learn to the video editing to imporve skills for toyr growth")
