open Benchmark

module H = Farmhash

let ($) f g = fun x -> f (g x)

let sample_string = "Do not go gentle into that good night"

let () =
  throughputN ~repeat:3 3 [
    "hash", ignore $ H.hash, sample_string;
    "hash32", ignore $ H.hash32, sample_string;
    "hash64", ignore $ H.hash64, sample_string;
  ]
  |> tabulate
