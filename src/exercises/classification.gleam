import gleam/int
import gleam/list
import gleam/option
import gleam/result

pub type ClassificationCount {
  ClassificationCount(positive: Int, negative: Int, zero: Int)
}

pub type Classification {
  Positive
  Negative
  Zero
}

pub type ParseError {
  InvalidNumber(input: String)
}

pub fn parse_and_classify(input: String) -> Result(Classification, ParseError) {
  int.parse(input)
  |> result.map_error(fn(_) { InvalidNumber(input) })
  |> result.map(classify)
}

pub fn classify(number: Int) -> Classification {
  case number {
    value if value > 0 -> Positive
    value if value < 0 -> Negative
    _ -> Zero
  }
}

pub fn classify_all(numbers: List(Int)) -> List(Classification) {
  classify_all_loop(numbers, [])
}

pub fn classify_all_map(numbers: List(Int)) -> List(Classification) {
  list.map(numbers, classify)
}

pub fn classify_optional(
  number: option.Option(Int),
) -> option.Option(Classification) {
  case number {
    option.None -> option.None
    option.Some(number) -> option.Some(classify(number))
  }
}

pub fn count_classifications(numbers: List(Int)) -> ClassificationCount {
  let initial = ClassificationCount(positive: 0, negative: 0, zero: 0)

  list.fold(numbers, initial, fn(acc, num) {
    case classify(num) {
      Positive -> ClassificationCount(..acc, positive: acc.positive + 1)
      Negative -> ClassificationCount(..acc, negative: acc.negative + 1)
      Zero -> ClassificationCount(..acc, zero: acc.zero + 1)
    }
  })
}

pub fn total_count(counts: ClassificationCount) -> Int {
  let ClassificationCount(positive:, negative:, zero:) = counts

  positive + negative + zero
}

fn classify_all_loop(
  numbers: List(Int),
  start: List(Classification),
) -> List(Classification) {
  case numbers {
    [first, ..rest] -> {
      let classification = classify(first)
      classify_all_loop(rest, [classification, ..start])
    }
    [] -> list.reverse(start)
  }
}
