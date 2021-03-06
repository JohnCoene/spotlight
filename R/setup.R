#' Setup
#'
#' Setup options for session.
#'
#' @param language Language of text.
#' @param response Format of response.
#' @param retry Number of times \code{\link{spot_annotate}} should retry the API call if it fails.
#' @param sleep Pause between calls in seconds.
#' @param sleep_if_fail Pause call attempts in seconds.
#' @param quiet Whether to print useful information in console.
#' @param base_url URL to ping if you have self-deployed spotlight.
#'
#' @section Languages:
#' \itemize{
#'   \item{\code{en} English}
#'   \item{\code{de} German}
#'   \item{\code{nl} Dutch}
#'   \item{\code{fr} French}
#'   \item{\code{it} Italian}
#'   \item{\code{ru} Russian}
#'   \item{\code{es} Spanish}
#'   \item{\code{pt} Portuguese}
#'   \item{\code{hu} Hungarian}
#'   \item{\code{tr} Turkish}
#' }
#'
#' @section Response:
#' \itemize{
#'   \item{\code{list}}
#'   \item{\code{data.frame}}
#' }
#'
#' @section Functions:
#' \itemize{
#'   \item{\code{spot_set_opts} set options}
#'   \item{\code{spot_get_opts} get otpions}
#' }
#'
#' @examples
#' spot_set_opts(language = "fr")
#'
#' @rdname setup
#' @export
spot_set_opts <- function(language = "en", response = "list", retry = 25, sleep = .5, sleep_if_fail = 1, base_url = NULL, quiet = !interactive()){

  if(!is.null(language)){
    .check_language(language)
    options(SPOTLIGHT_LANGUAGE = language)
  }

  if(!is.null(response)){
    .check_results(response)
    options(SPOTLIGHT_RESPONSE = response)
  }

  if(!is.null(retry)){
    options(SPOTLIGHT_RETRY = retry)
  }

  if(!is.null(sleep)){
    options(SPOTLIGHT_SLEEP = sleep)
  }

  if(!is.null(quiet)){
    options(SPOTLIGHT_QUIET = quiet)
  }

  if(!is.null(sleep_if_fail)){
    options(SPOTLIGHT_SLEEP_IF_FAIL = sleep_if_fail)
  }

  if(!is.null(base_url))
    options(SPOTLIGHT_BASE_URL = base_url)
}

#' @rdname setup
#' @export
spot_get_opts <- function(){
  list(
    language = getOption("SPOTLIGHT_LANGUAGE"),
    response = getOption("SPOTLIGHT_RESPONSE"),
    retry = getOption("SPOTLIGHT_RETRY"),
    sleep = getOption("SPOTLIGHT_SLEEP"),
    quiet = getOption("SPOTLIGHT_QUIET")
  )
}
