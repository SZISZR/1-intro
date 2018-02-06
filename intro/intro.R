head(mtcars)

t_mtcars <- as.tibble(mtcars)

summary(t_mtcars)

# saját stat summary fv
mystats <- function(x, na.omit=FALSE){
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return(c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

t_myvars <- t_mtcars%>%select(mpg,hp,wt)

# összes változóra
sapply(t_myvars, mystats)
sapply(t_myvars, mystats, na.omit=T)

# csoportokra
t_mtcars %>%
  group_by(am) %>%
  summarise_all(funs(mean))

View(t_mtcars %>%
  group_by(am) %>%
  summarise_all(funs(min,max,mean)))
