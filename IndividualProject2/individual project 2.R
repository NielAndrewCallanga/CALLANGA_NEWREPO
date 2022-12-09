library(RColorBrewer)
library(tm)
library(dplyr)
library(wordcloud)
library(ggplot2)
library(twitteR)
library(plotly)

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
Trendtweets <- searchTwitter("1D", n=10000, lang="en", since="2022-12-1",
                              until="2022-12-7", retryOnRateLimit = 120)
Trendtweets

# CONVERTING LIST DATA TO DATA FRAME.
trendtweetsdf <- twListToDF(Trendtweets)

# SAVE DATA FRAME FILE.
save(trendtweetsdf,file = "trendtweetsdf.Rdata")

# LOAD DATA FRAME FILE.
load(file = "trendtweetsdf.Rdata")

# CHECKING FOR MISSING VALUES IN A DATA FRAME.
sap_ply <- sapply(trendtweetsdf, function(x) sum(is.na(x)))
sap_ply


#TWEETS

  # SUBSETTING USING THE dplyr() PACKAGE.
tweets <- trendtweetsdf %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
tweets

  # GROUPING THE DATA CREATED. 
tweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt1 <- tweets %>%  mutate(Created_At_Round = 
        created %>% round(units = 'hours') %>% as.POSIXct())
crt1

minimum <- tweets %>% pull(created) %>% min()

minimum 

maximum <- tweets %>% pull(created) %>% max()

maximum

  # Plot on tweets by time using the library(plotly) and ggplot().
ploty <- ggplot(crt1, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

ploty %>% ggplotly()

#RETWEETS

retweetss <- trendtweetsdf %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
retweetss


retweetss %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt2 <- retweetss %>%  mutate(Created_At_Round = 
      created %>% round(units = 'hours') %>% as.POSIXct())
crt2

minimum <- retweetss %>% pull(created) %>% min()

minimum 

maximum <- retweetss %>% pull(created) %>% max()

maximum

  # Plot on tweets by time using the library(plotly) and ggplot().
ploty <- ggplot(crt2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

ploty %>% ggplotly()
