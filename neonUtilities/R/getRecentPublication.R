##############################################################################################
#' @title Returns the most recent files for those that do not need stacking

#' @author
#' Nathan Mietkiewicz \email{mietkiewicz@battelleecology.org}

#' @description
#' Given a list of files, this will order and return the file with the most recent publication date.

#' @param inList The list of files.

#' @references
#' License: GNU AFFERO GENERAL PUBLIC LICENSE Version 3, 19 November 2007

# Changelog and author contributions / copyrights
#   2019-10-08 (Nathan Mietkiewicz): Original creation

##############################################################################################
getRecentPublication <- function(inList) {
  path_dates <-  lapply(inList, function(x) {
    var_recent <- x %>%
      gsub(pattern = "\\.csv$|\\.txt$", "", .) %>%
      stringr::str_split(., '\\.|\\/') %>%
      unlist(.) %>%
      .[grep("[0-9]{8}T[0-9]{6}Z", .)]
  })
  outList <- inList[grep(max(unlist(path_dates)), inList)][1]
  return(list(outList, max(unlist(path_dates))))
}