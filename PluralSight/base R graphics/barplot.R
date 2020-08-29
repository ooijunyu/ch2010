B <- c(22,27,26,24,23)

barplot(B)
# barchart with added parameters
barplot(B,
        main = "Company B Stock Prices",
        xlab = "Week End 9/26",
        ylab = "Prce",
        ylim = c(0,30),
        names.arg = c("Mon","Tue","Wed","Thu","Fri"),
        col = colours()[12],
        horiz = FALSE)

# Create data
# need to have a matrix for stacked bar chart
set.seed(112)
Z = matrix(
  c(15,13,18,55,60,35,35,38,41), # the data elements
  nrow = 3,
  ncol = 3,
  byrow = TRUE)
dimnames(Z) <- list(
  c("Sell","Hold","Buy"),
  c("A","B","C"))
Z

# Get the stacked barplot
barplot(Z)
barplot(Z,
        col = colours()[c(35,77,89)],
        border = "White",
        space = 0.04,
        font.axis = 2,
        xlab = "group")
