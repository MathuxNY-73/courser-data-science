readData <- function(path)
{
  Lines <- readLines(path)
  markers <- grepl("1/2/2007", Lines)
  want <- rle(markers)$lengths[1:2]
  want <- seq.int(want[1] + 1, sum(want), by = 1)
  markers <- grepl("2/2/2007", Lines)
  want2 <- rle(markers)$lengths[1:2]
  want2 <- seq.int(want2[1] + 1, sum(want2), by = 1)
  want3 <- c(want2, want)
  dat <- read.table(textConnection(Lines[want3]), sep = ";", header = FALSE)
  dat <- transform(dat, V1 = strptime(V1, format = "%d/%m/%Y"))
  header <- read.table(path, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
  colnames(dat) <- unlist(header)
  dat
}