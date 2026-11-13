import exercises/classification

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
  assert classification.classify_all([10, -5, 0]) == [classification.Positive, classification.Negative, classification.Zero]
}
