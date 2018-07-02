# Write your code here.
require 'pry'

def dictionary
  dict = {
    "hello" => "hi",
    "to, two, too" => "2",
    "for, four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  shortened_tweet = []
  dict = dictionary
  split_tweet = tweet.split(' ')
  for i in (0...split_tweet.length)
    for key, value in dict
      if key.split(', ').include?(split_tweet[i].downcase)
        split_tweet[i] = value
      end
    end
  end
  split_tweet.join(' ')
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |tweet| puts word_substituter(tweet) end
end

def selective_tweet_shortener(tweet)
  tweet.length > 140 ? word_substituter(tweet) : tweet
end

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140 
    tweet = tweet[0,140]
    return tweet
  end
  tweet
end