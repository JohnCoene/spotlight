.onLoad <- function(libname, pkgname) {
  options(
    SPOTLIGHT_BASE_URL = "http://api.dbpedia-spotlight.org/",
    SPOTLIGHT_LANGUAGE = "en",
    SPOTLIGHT_RESPONSE = "list",
    SPOTLIGHT_RETRY = 10,
    SPOTLIGHT_SLEEP = 1,
    SPOTLIGHT_SLEEP_IF_FAIL = 1,
    SPOTLIGHT_QUIET = !interactive()
  )
}
