
external hash : string -> int = "ml_hash"
external hash32 : string -> int32 = "ml_hash32"
external hash64 : string -> int64 = "ml_hash64"

external hash_with_seed : string -> seed:int -> int = "ml_hash_with_seed"
external hash32_with_seed : string -> seed:int -> int32 = "ml_hash32_with_seed"
external hash64_with_seed : string -> seed:int -> int64 = "ml_hash64_with_seed"

external hash_with_seeds : string -> seed0:int -> seed1:int -> int = "ml_hash_with_seeds"
external hash64_with_seeds : string -> seed0:int -> seed1:int -> int64 = "ml_hash64_with_seeds"

external hash128 : string -> (int64 * int64) = "ml_hash128"
