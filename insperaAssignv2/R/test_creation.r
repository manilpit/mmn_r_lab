### test_creation.R

#' Create a new test from a template
#'
#' @param external_test_id External Test ID
#' @param title Title of the test
#' @param start_time Start time of the test in ISO 8601 format
#' @param end_time End time of the test in ISO 8601 format
#' @param duration Duration of the test in minutes
#' @param source_template_id Source template ID to use for test creation
#' @param token Access token for authentication
#' @return Response from API call as a list
#' @export
#' @importFrom httr2 request req_headers req_body_json req_method req_perform resp_status resp_body_json
#' @importFrom jsonlite toJSON
#' @importFrom magrittr %>%
create_new_test_from_template <- function(external_test_id, title, start_time, end_time, duration, source_template_id, token) {
  body <- list(
    externalTestId = external_test_id,
    title = title,
    startTime = start_time,
    endTime = end_time,
    duration = duration,
    sourceTemplateId = source_template_id
  )
  
  url <- "https://nokut.inspera.no/api/v1/test?isExternal=true"
  
  req <- httr2::request(url) %>%
    httr2::req_headers(Authorization = paste("Bearer", token)) %>%
    httr2::req_body_json(body) %>%
    httr2::req_method("POST")
  
  tryCatch({
    resp <- httr2::req_perform(req)
    if (httr2::resp_status(resp) %in% c(200, 201)) {
      httr2::resp_body_json(resp)
    } else {
      stop("Failed to create test. Status code: ", httr2::resp_status(resp))
    }
  }, error = function(e) {
    stop("Error in creating test: ", e$message)
  })
}