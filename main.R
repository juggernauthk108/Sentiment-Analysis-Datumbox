library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)

source("./load1.R")
source("./load2.R")



api_key <- "" ##get these credentials from twitter##
api_secret <- ""##get these credentials from twitter##
access_token <- ""##get these credentials from twitter##
access_token_secret <- ""##get these credentials from twitter##
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)




# harvest tweets
tweets = searchTwitter("BREXIT", n=10, lang="en")
print(tweets)
# get text
tweet_txt = sapply(tweets, function(x) x$getText())
 
# clean text
tweet_clean = clean.text(tweet_txt)

# how many tweets
tweet_num = length(tweet_clean)
 
# data frame (text, sentiment, score)
tweet_df = data.frame(text=tweet_clean, sentiment=rep("", tweet_num),
subject=1:tweet_num, topic=1:tweet_num, gender=1:tweet_num, stringsAsFactors=FALSE)

# apply function getSentiment
sentiment = rep(0, tweet_num)
for (i in 1:tweet_num)
{
tmp = getSentiment(tweet_clean[i], "")
 tweet_df$sentiment[i] = tmp$sentiment
 }
print(tweet_df)

