devtools::install_github("bradleyboehmke/harrypotter")

library(tidyverse)
library(stringr)
library(tidytext)
library(harrypotter)

View(philosophers_stone[1:2])

text_tb <- tibble(chapter = seq_along(philosophers_stone),
                  text = philosophers_stone)
View(text_tb)

text_tb %>% unnest_tokens(word, text)

text_tb

titles <- c("Philosorpher's Stone", "Chamber of Secrets", "Prisoners of Azkaban",
           "Goblet of Fire", "Order of the Pheonix", "Half-Blood Prince",
           "Deathly Hallows")
titles

books <- list(philosophers_stone, chamber_of_secrets, prisoner_of_azkaban,
              goblet_of_fire,order_of_the_phoenix, half_blood_prince,
              deathly_hallows)
View(books)

series <- tibble()

for(i in seq_along(titles)){
   clean <- tibble(chapter = seq_along(books[[i]]), text= books[[i]]) %>%
     unnest_tokens(word,text) %>% mutate(book = titles[i]) %>%
     select(book, everything())
series <- rbind( series, clean)}
View(clean)
View(series)

series$book <- factor(series$book, levels =rev(titles))
View(series)

series %>% count(word, sort = TRUE)

View(stop_words)

series %>% anti_join(stop_words) %>% count(word, sort = TRUE)

series %>% anti_join(stop_words) %>% group_by(book) %>%
  count(word, sort = TRUE) %>% top_n(10)

series %>% anti_join(stop_words) %>% group_by(book) %>%
  count(word, sort = TRUE) %>% top_n(10) %>% ungroup() %>%
  mutate(book = factor(book, levels = titles), text_order = nrow(.):1) %>%
  ggplot(aes(reorder(word, text_order), n, fill = book)) +
  geom_bar(stat = "identity") + facet_wrap(~ book, scales = "free_y") +
  labs(x = "words", y="frequency") + coord_flip() +
  theme(legend.position="none")

potter_pct <- series %>% anti_join(stop_words) %>% count(word) %>%
  transmute(word, all_words = n / sum(n))
View(potter_pct)
  
frequency <- series %>% anti_join(stop_words) %>% count(book,word) %>%
  mutate(book_words = n/sum(n)) %>% left_join(potter_pct) %>%
  arrange(desc(book_words)) %>% ungroup()
View(frequency)

ggplot(frequency, aes(x = book_words, y = all_words, color = abs(all_words - book_words))) +
  geom_abline(color = "gray40" , lty = 2)+
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.3, height = 0.3) +
  geom_text(aes(label = word), check_overlap = TRUE , vjust = 1.5) +
  scale_x_log10(labels = scales::percent_format()) +
  scale_y_log10(labels = scales::percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), low  = "darkslategray4" , high = "gray75") +
  facet_wrap(~ book, ncol = 2) +
  theme(legend.position = "none") +
  labs(y = "Harry Potter Series", x= NULL)  
  
frequency %>% 
  group_by(book) %>%summarise(correlation = cor(book_words, all_words), p_value = cor.test(book_words, all_words)$p.value)

  
