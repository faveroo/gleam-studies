import exercises/user_id

pub fn valid_user_id_test() {
  assert user_id.validate_user_id("42") == Ok(42)
}

pub fn invalid_integer_test() {
  assert user_id.validate_user_id("abc") == Error(user_id.InvalidInteger)
}

pub fn zero_user_id_test() {
  assert user_id.validate_user_id("0") == Error(user_id.NonPositiveId)
}

pub fn negative_user_id_test() {
  assert user_id.validate_user_id("-5") == Error(user_id.NonPositiveId)
}

pub fn empty_user_id_test() {
  assert user_id.validate_user_id("") == Error(user_id.InvalidInteger)
}
