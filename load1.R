getSentiment <- function (text, key){

text <- URLencode(text);

#save all the spaces, then get rid of the weird characters that break the API, then convert back the URL-encoded spaces.
text <- str_replace_all(text, "%20", " ");
text <- str_replace_all(text, "%\\d\\d", "");
text <- str_replace_all(text, " ", "%20");

if (str_length(text) > 360){
text <- substr(text, 0, 359);
}
##########################################

data <- getURL(paste("http://api.datumbox.com/1.0/TwitterSentimentAnalysis.json?api_key=", key, "&text=",text, sep=""))

js <- fromJSON(data, asText=TRUE);

# get mood probability
sentiment = js$output$result

return(list(sentiment=sentiment))
}
