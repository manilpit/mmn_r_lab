### zzz.R

#' @importFrom dotenv load_dot_env
#' @importFrom futile.logger flog.info
#' @importFrom futile.logger flog.warn
.onLoad <- function(libname, pkgname) {
  futile.logger::flog.info("Starting .onLoad function")
  
  # Set up logging when the package loads
  futile.logger::flog.info("Setting up logging")
  tryCatch({
    configure_logging()
  }, error = function(e) {
    futile.logger::flog.error("Error in configure_logging: ", e$message)
  })
  
  # Try to load environment variables from the .env file if it exists
  futile.logger::flog.info("Attempting to load .env file")
  if (file.exists(".env")) {
    tryCatch({
      dotenv::load_dot_env()
      futile.logger::flog.info("Loaded environment variables from .env")
    }, error = function(e) {
      futile.logger::flog.warn("Could not load .env file: ", e$message)
    })
  } else {
    futile.logger::flog.warn(".env file does not exist. Proceeding without loading environment variables.")
  }

  futile.logger::flog.info("Finished .onLoad function: insperaAssign package loaded successfully")
}