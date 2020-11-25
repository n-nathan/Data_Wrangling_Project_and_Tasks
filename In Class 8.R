rtimes = "https://cran.r-project.org/src/contrib/Archive/rtimes/rtimes_0.5.0.tar.gz"
version = "rtimes_0.5.0.tar.gz"
download.file(url = rtimes, destfile = version)
install.packages(pkgs=version, type="source", repos=NULL)
library(rtimes)
article_key = "GuP8OS7aQcyGzPTqgQAKQtUG8C5aA3YE"
article_search_climate = as_search(q="climate change",begin_date="20170101",end_date='20200101', key=article_key)
article_search_climate$meta
article_search_climate$data

library(twitteR)
consumer_key = "LTixZsExiNaisxttPEToQxf3j"
consumer_secret ="qU0PE7Q6qcUkLdpOQB20IJ8d275MzC5hZ3H8rFy2WvUCIoAkkl"
#bearer_token = "AAAAAAAAAAAAAAAAAAAAAGXfJQEAAAAAY3dgzVTMYvuAlyOyUH1So%2BaTpMk%3DQ8gAiQeKCOfiRHMXZFmJVrC9RmsyzDcChaogVixCe7LwCXXwHy"
access_token = "1324424216918269952-dI0AQH4VZpjwDTlXZOgXAk8Kl3Mhyb"
access_secret = "PXA6KHXEgUDxM4IhsnS18Kk32SpKzx57mP0z73g7J334W"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
earthhour = searchTwitter('#earthhour', n=10, since = '2020-01-01')
df.earthhour=twListToDF(earthhour)
