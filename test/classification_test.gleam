import exercises/classification
import gleam/list

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
