import exercises/classification

// import gleam/io

pub fn main() {
  let classified = classification.classify_all([10, -5, 0, 7])

  echo classified
}
