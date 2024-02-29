test_that("get_choices works as expected", {
  mock_data <- tibble::tribble(
    ~col1, ~col2,
    "A", "A1",
    "A", "A2",
    "A", "A2",
    "B", "B1",
    "D", "D1",
    "C", "C1",
    "C", "C1"
  )

  expect_identical(
    get_choices(mock_data, "col1"),
    c("A", "B", "C", "D")
  )

  expect_identical(
    get_choices(mock_data, "col2"),
    c("A1", "A2", "B1", "C1", "D1")
  )

})
