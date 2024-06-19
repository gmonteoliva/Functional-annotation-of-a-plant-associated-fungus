# Reading the file

dat <- read.delim("go.obo", header=F)

# Getting a data frame format from non-repeated terms

head(
do.call(rbind, 
  apply(cbind(grep("\\[Term]", dat$V1) + 1, 
              grep("\\[Term]", dat$V1) - 1 + 
                diff(c(grep("\\[Term]", dat$V1), nrow(dat)))), 1, \(x){
    res <- data.table::tstrsplit(dat[x[1]:x[2],], ": ")
    id <- grep("^id|name|namespace|def|is_obso", res[[1]])
    `length<-`(as.list(res[[2]][id]), 5)})) |> 
  data.frame() |> 
  setNames(c("id", "name", "namespace", "definition", "is_obsolete")))