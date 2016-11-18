#' Get the observations
#'
#' Get and process, if needed, the observations
#' @param method method for processing observations, so far only "processedNVE"
#' @param path Directory where to get the files
#' @param filename Filename (path included) of the file to be read
#' @keywords Q
#' @export
#' @examples
#' \dontrun{
#' getQ()
#' }
getQ <- function(method=NULL,path=NULL,filename=NULL) {

    Q <- switch(method,
                   "processedNVE"        = getQ.processedNVE(path=path,filename=filename)
                   (message=paste0("Invalid method:", method,".")))

    return(Q)
}


getQ.processedNVE <- function(path,filename){
  env <- environment()
  path <- normalizePath(file.path(path,filename),mustWork = FALSE)
  tmp <- utils::read.table(path,sep="\t")
  assign("Q",tmp[,25],envir=env)
  rm(tmp)
  return(get("Q",envir=env))
}
