install.packages("tm")
install.packages("tidytext")
install.packages("plotly")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("dplyr")
install.packages("wordcloud2")
install.packages("syuzhet")
install.packages("magrittr")
install.packages("stringr")
install.packages("twitteR")

library(syuzhet)
library(wordcloud)
library(plotly)
library(tm)
library(tidytext)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(magrittr)
library(stringr)
library(twitteR)

# SETUP CREDENTIALS.
API_KEY <- "AVkKX52SdvJHVkL8FKkiWx1Zl"
API_SECRET_KEY <- "rX4kXD8LJbeNa8p19MCQvEIjhNXLa5gyBBeAhorC3C2dCpgh1Y"
ACCESS_TOKEN <-  "1595206858142121986-NZNHhytlvCoFo7eAFlNomofNthZLFk"
ACCESS_SECRET <-  "K7qSpHI15utrwDkoI3OwOHHg6IlwKT5RO0QQXwgvhcdIu"

setup_twitter_oauth(consumer_key = API_KEY,
                    consumer_secret = API_SECRET_KEY,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_SECRET)


# EXTRACTING TWEETS.
trending_Tweets <- searchTwitter("#SpotifyWrapped -filter:retweets", n=10000, 
                                 lang="en", since="2022-11-22", 
                                 until="2022-11-29", retryOnRateLimit = 120)
trending_Tweets

# CONVERTING LIST DATA TO DATA FRAME.
TTweetsdf <- twListToDF(trending_Tweets)
class(TTweetsdf)
names(TTweetsdf)
View(TTweetsdf)
head(TTweetsdf)[1:5]
head(TTweetsdf$text)[1:5]

# SAVE DATA FRAME FILE.
save(TTweetsdf,file = "TTweetsdf.Rdata")

# LOAD DATA FRAME FILE.
load(file = "TTweetsdf.Rdata")

# SAVING FILE AS RDATA.
save(TTweetsdf, file = "tweetsDF2.Rdata")

# CHECKING FOR MISSING VALUES IN A DATA FRAME.
sap_ply <- sapply(TTweetsdf, function(x) sum(is.na(x)))
sap_ply

# SUBSETTING USING THE dplyr() PACKAGE.
TTweetsdf2 <- TTweetsdf %>%
  select(screenName,text,created,statusSource)
TTweetsdf2

# GROUPING THE DATA CREATED. 
TTweetsdf2 %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

mutatee <- TTweetsdf %>%  mutate(Created_At_Round = created %>% 
                                    round(units = 'hours') %>% as.POSIXct())
mutatee

TTweetsdf2 %>% pull(created) %>% min() 
TTweetsdf2 %>% pull(created) %>% max()

# Plot on tweets by time using the library(plotly) and ggplot().
plotting <- mutatee %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plotting %>% ggplotly()

# ==============================================

ggplot(data = TTweetsdf, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

# PLOTTING STATUS SOURCE.
StatusSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  
    "facebook"
  }else {
    "others"
  }
}


TTweetsdf2$tweetSource = sapply(TTweetsdf$statusSource, StatusSource)

tweet_appSource1 <- TTweetsdf2 %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count))

ggplot(TTweetsdf2[TTweetsdf2$tweetSource 
                  != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

# ACCOUNTS WHICH TWEET ABOUT SpotifyWrapped.
tweet_appScreen1 <- TTweetsdf2 %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#CONVERT TO CORPUS
namesCorpus <- Corpus(VectorSource(TTweetsdf$screenName))  
class(TTweetsdf$screenName)

class_data <- class(VectorSource(TTweetsdf$screenName))
class_data

str(namesCorpus)

class(namesCorpus)

nameCorp <- namesCorpus
nameCorp

# WORDCLOUD FOR SCREEN NAMES.
pal1 <- brewer.pal(8, "Dark2")
pal2 <- pal1[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = namesCorpus, scale=c(3,0.5),
          max.words=10000,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal1)