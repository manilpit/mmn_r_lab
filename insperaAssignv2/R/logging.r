### logging.R

#' Configure logging for the package
#'
#' Sets up the logging configuration to log messages to both the console and a log file.
#' @export
#' @importFrom futile.logger flog.appender appender.tee flog.threshold flog.layout layout.simple
configure_logging <- function() {
  # Set up a log file named 'insperaAssign.log'
  log_file <- "insperaAssign.log"
  
  # Configure the logger to write to both the console and the log file
  futile.logger::flog.appender(futile.logger::appender.tee(log_file))
  
  # Set the logging threshold to 'INFO'
  futile.logger::flog.threshold("INFO")
  
  # Use a simple layout for log messages
  futile.logger::flog.layout(futile.logger::layout.simple())
}