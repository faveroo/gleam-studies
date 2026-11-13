import gleam/list

// import gleam/list

pub type Classification {
  Positive
  Negative
  Zero
}

pub fn classify(number: Int) -> Classification {
  case number {
    value if value > 0 -> Positive
    value if value < 0 -> Negative
    _ -> Zero
  }
}


pub fn classify_all(numbers: List(Int), start: List(Classification)) -> List(Classification) {
      case numbers {
        [first, ..rest] -> {
          let classification = classify(first)
          classify_all(rest, [classification, ..start])
        }
        [] -> list.reverse(start)
  }
}
