## code to prepare `sales_data` dataset goes here
sales_data <- readr::read_csv("data-raw/sales_data_sample.csv") |>
  dplyr::filter(COUNTRY == "USA") |>
  dplyr::select(
    ORDERNUMBER,
    QUANTITYORDERED,
    SALES,
    ORDERDATE,
    STATUS,
    PRODUCTLINE,
    PRODUCTCODE,
    CUSTOMERNAME,
    CITY,
    STATE
  ) |>
  dplyr::mutate(
    ORDERDATE = ORDERDATE |>
      stringr::str_sub(start = 1, end = -6) |>
      lubridate::mdy()
  )

usethis::use_data(sales_data, overwrite = TRUE)
