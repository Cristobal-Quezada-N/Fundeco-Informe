convert_date <- function(date_str) {
  # Convert month abbreviation to month number
  month_abbr <- substring(date_str, 1, 3)
  month_number <- match(month_abbr, month.abb)
  
  # Extract the year
  year <- paste0("20", substring(date_str, 5, 6))
  
  # Construct the date string
  date_result <- paste0("01/", sprintf("%02d", month_number), "/", year)
  # date_result <- as.Date(date_string, format="%d/%m/%Y")
  
  return(date_result)
}
