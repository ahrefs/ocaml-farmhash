open Benchmark

module H = Farmhash

let ($) f g = fun x -> f (g x)

let sample_string = "Do not go gentle into that good night"
let seed = 42

let () =
  let bench l = print_endline ""; throughputN ~repeat:3 3 l in
  let seed0, seed1 = (seed, seed * seed - 1) in
  let args = Array.to_list Sys.argv |> List.tl in (* strip argv.(0) *)
  let selector = match args with
    | [] -> fun _ -> true
    | args -> fun (name, _, _) -> List.exists ((=) name) args
  in
  let () = [
    "hash", ignore $ H.hash, sample_string;
    "hash32", ignore $ H.hash32, sample_string;
    "hash64", ignore $ H.hash64, sample_string;
    "hash_with_seed", ignore $ H.hash_with_seed ~seed, sample_string;
    "hash32_with_seed", ignore $ H.hash32_with_seed ~seed, sample_string;
    "hash64_with_seed", ignore $ H.hash64_with_seed ~seed, sample_string;
    "hash_with_seeds", ignore $ H.hash_with_seeds ~seed0 ~seed1, sample_string;
    "hash64_with_seeds", ignore $ H.hash64_with_seeds ~seed0 ~seed1, sample_string;
    "hash128", ignore $ H.hash128, sample_string;
  ]
  |> List.filter selector
  |> bench
  |> tabulate
  in
  ()
