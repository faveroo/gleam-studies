import exercises/user_lookup.{ConnectionFailed, User, find_user, find_user_name}
import gleam/option.{None, Some}

pub fn find_existing_user_test() {
  assert find_user(1, True) == Ok(Some(User(1, "Alice")))
}

pub fn find_missing_user_test() {
  assert find_user(999, True) == Ok(None)
}

pub fn missing_user_with_unavailable_database_test() {
  assert find_user(999, False) == Error(ConnectionFailed)
}

pub fn database_unavailable_test() {
  assert find_user(1, False) == Error(ConnectionFailed)
}

pub fn find_user_name_existing_test() {
  assert find_user_name(1, True) == Ok(Some("Alice"))
}

pub fn find_user_name_missing_test() {
  assert find_user_name(999, True) == Ok(None)
}

pub fn find_user_name_database_error_test() {
  assert find_user_name(1, False) == Error(ConnectionFailed)
}
