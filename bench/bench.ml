open Benchmark

module H = Farmhash

let ($) f g = fun x -> f (g x)

let sample_string = "Do not go gentle into that good night"
let seed = 42
let seed0, seed1 = (seed, seed * seed - 1)

let run_bench tests = throughputN ~repeat:3 3 tests |> tabulate

let () =
  let tests = [
    "hash", ignore $ H.hash, sample_string;
    "hash32", ignore $ H.hash32, sample_string;
    "hash64", ignore $ H.hash64, sample_string;
    "hash_with_seed", ignore $ H.hash_with_seed ~seed, sample_string;
    "hash32_with_seed", ignore $ H.hash32_with_seed ~seed, sample_string;
    "hash64_with_seed", ignore $ H.hash64_with_seed ~seed, sample_string;
    "hash_with_seeds", ignore $ H.hash_with_seeds ~seed0 ~seed1, sample_string;
    "hash64_with_seeds", ignore $ H.hash64_with_seeds ~seed0 ~seed1, sample_string;
    "hash128", ignore $ H.hash128, sample_string;
    "hash128_with_seed", ignore $ H.hash128_with_seed ~seed:(42L, 24L), sample_string;
    "fingerprint", ignore $ H.fingerprint, sample_string;
    "fingerprint32", ignore $ H.fingerprint, sample_string;
    "fingerprint64", ignore $ H.fingerprint, sample_string;
    "fingerprint128", ignore $ H.fingerprint, sample_string;
  ]
  in
  let args = Sys.argv |> Array.to_list |> List.tl in (* Sys.argv.(0) is a binary name *)
  match args with
  | [] ->
    "Usage:" ::
      "\tbench\t\t\t# to get this message" ::
      "\tbench all\t\t# to run all tests" ::
      "\tbench test1,test2,...\t# to run selected tests" ::
    "Tests:" :: []
    |> List.iter print_endline;
    tests |> List.iter (fun (name, _, _) -> print_endline @@ "\t" ^ name)
  | ["all"] -> run_bench tests
  | names ->
    tests |> List.filter (fun (n, _, _) -> List.exists ((=) n) names) |> run_bench
