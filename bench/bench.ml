open Benchmark

module H = Farmhash

let ($) f g = fun x -> f (g x)

let sample_string = "Do not go gentle into that good night"
let seed = 42

let () =
  let thr l = throughputN ~repeat:2 1 l |> tabulate in
  thr [
    "hash", ignore $ H.hash, sample_string;
    "hash32", ignore $ H.hash32, sample_string;
    "hash64", ignore $ H.hash64, sample_string;
  ];

  thr [
    "hash_with_seed", ignore $ H.hash_with_seed ~seed, sample_string;
    "hash32_with_seed", ignore $ H.hash32_with_seed ~seed, sample_string;
    "hash64_with_seed", ignore $ H.hash32_with_seed ~seed, sample_string;
  ]
