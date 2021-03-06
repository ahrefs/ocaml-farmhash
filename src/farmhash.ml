
external hash : string -> int = "ml_farmhash_hash"
external hash32 : string -> int32 = "ml_farmhash_hash32"
external hash64 : string -> int64 = "ml_farmhash_hash64"

external hash_with_seed : string -> seed:int -> int = "ml_farmhash_hash_with_seed"
external hash32_with_seed : string -> seed:int -> int32 = "ml_farmhash_hash32_with_seed"
external hash64_with_seed : string -> seed:int -> int64 = "ml_farmhash_hash64_with_seed"

external hash_with_seeds : string -> seed0:int -> seed1:int -> int = "ml_farmhash_hash_with_seeds"
external hash64_with_seeds : string -> seed0:int -> seed1:int -> int64 = "ml_farmhash_hash64_with_seeds"

external hash128 : string -> (int64 * int64) = "ml_farmhash_hash128"
external hash128_with_seed : string -> seed:(int64 * int64) -> (int64 * int64) = "ml_farmhash_hash128_with_seed"

external fingerprint : string -> int = "ml_farmhash_fingerprint"
external fingerprint32 : string -> int32 = "ml_farmhash_fingerprint32"
external fingerprint64 : string -> int64 = "ml_farmhash_fingerprint64"
external fingerprint128 : string -> (int64 * int64) = "ml_farmhash_fingerprint128"
