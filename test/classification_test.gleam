import exercises/classification.{Negative, Positive, Zero}
import gleam/list
import gleam/option.{None, Some}

pub fn positive_test() {
  assert classification.classify(10) == classification.Positive
  assert classification.classify(1) == classification.Positive
  assert classification.classify(999) == classification.Positive
}

pub fn negative_test() {
  assert classification.classify(-10) == classification.Negative
  assert classification.classify(-1) == classification.Negative
  assert classification.classify(-999) == classification.Negative
}

pub fn zero_test() {
  assert classification.classify(0) == classification.Zero
}

pub fn classify_list_test() {
  assert classification.classify_all([10, -5, 0])
    == [classification.Positive, classification.Negative, classification.Zero]
}

pub fn classify_list_map_test() {
  assert classification.classify_all_map([10, -5, 0])
    == [classification.Positive, classification.Negative, classification.Zero]
}

pub fn count_classifications_test() {
  let counts = classification.count_classifications([10, -5, 0, 1])
  let classification.ClassificationCount(positive:, negative:, zero:) = counts

  assert positive == 2
  assert negative == 1
  assert zero == 1
}

pub fn total_count_test() {
  let counts = classification.count_classifications([10, -5, 0, 7])

  assert classification.total_count(counts) == 4
}

pub fn empty_total_count_test() {
  let counts = classification.count_classifications([])

  assert classification.total_count(counts) == 0
}

pub fn classification_count_matches_length_test() {
  let numbers = [10, -5, 0, 7, -3, 0]

  assert classification.total_count(classification.count_classifications(
      numbers,
    ))
    == list.length(numbers)
}

pub fn parse_positive_test() {
  assert classification.parse_and_classify("42") == Ok(Positive)
}

pub fn parse_negative_test() {
  assert classification.parse_and_classify("-10") == Ok(Negative)
}

pub fn parse_zero_test() {
  assert classification.parse_and_classify("0") == Ok(Zero)
}

pub fn parse_invalid_test() {
  assert classification.parse_and_classify("hello")
    == Error(classification.InvalidNumber("hello"))
}

pub fn parse_empty_test() {
  assert classification.parse_and_classify("")
    == Error(classification.InvalidNumber(""))
}

pub fn classify_optional_positive_test() {
  assert classification.classify_optional(Some(10))
    == Some(classification.Positive)
}

pub fn classify_optional_negative_test() {
  assert classification.classify_optional(Some(-5))
    == Some(classification.Negative)
}

pub fn classify_optional_zero_test() {
  assert classification.classify_optional(Some(0)) == Some(classification.Zero)
}

pub fn classify_optional_none_test() {
  assert classification.classify_optional(None) == None
}

pub fn classify_optional_map_test() {
  assert classification.classify_optional_map(option.Some(10))
    == option.Some(classification.Positive)

  assert classification.classify_optional_map(option.Some(-5))
    == option.Some(classification.Negative)

  assert classification.classify_optional_map(option.None) == option.None
}
