library(ggplot2)
library(ggConvexHull)

context("Testing geom exists and doesn't output errors")

n <- 10
test_df <- data.frame(
  a = runif(n),
  b = runif(n)
)

test_that("Stat exists", {
  expect_silent(
    ggplot(test_df,aes(x = a,y = b)) +
      geom_point() +
      stat_convexhull(alpha = 0.3, fill = "blue")

  )
})

test_that("Geom exists", {
  expect_silent(
    ggplot(test_df, aes(x = a,y = b)) +
      geom_point() +
      geom_convexhull(alpha = 0.7, fill = "red")
  )
})