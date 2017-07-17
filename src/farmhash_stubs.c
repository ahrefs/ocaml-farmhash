#include "upstream/farmhash.h"

#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/unixsupport.h>
#include <caml/custom.h>

typedef util::uint128_t uint128_t; /* std::pair<uint64_t, uint64_t> */

namespace {

inline value create_tpl128(const uint128_t& hash128)
{
    CAMLparam0();
    CAMLlocal1(result);
    result = caml_alloc_tuple(2);
    Store_field(result, 0, caml_copy_int64(hash128.first));
    Store_field(result, 1, caml_copy_int64(hash128.second));
    CAMLreturn(result);
}

}

extern "C" {

CAMLprim value ml_farmhash_hash(value data)
{
    CAMLparam1(data);
    uint64_t result = util::Hash64(String_val(data), caml_string_length(data));
    CAMLreturn(Val_int(result));
}

CAMLprim value ml_farmhash_hash32(value data)
{
    CAMLparam1(data);
    uint32_t result = util::Hash32(String_val(data), caml_string_length(data));
    CAMLreturn(caml_copy_int32(result));
}

CAMLprim value ml_farmhash_hash64(value data)
{
    CAMLparam1(data);
    uint64_t result = util::Hash64(String_val(data), caml_string_length(data));
    CAMLreturn(caml_copy_int64(result));
}

CAMLprim value ml_farmhash_hash_with_seed(value data, value seed)
{
    CAMLparam2(data, seed);
    uint64_t result = util::Hash64WithSeed(String_val(data), caml_string_length(data), Int_val(seed));
    CAMLreturn(Val_int(result));
}

CAMLprim value ml_farmhash_hash32_with_seed(value data, value seed)
{
    CAMLparam2(data, seed);
    uint32_t result = util::Hash32WithSeed(String_val(data), caml_string_length(data), Int_val(seed));
    CAMLreturn(caml_copy_int32(result));
}

CAMLprim value ml_farmhash_hash64_with_seed(value data, value seed)
{
    CAMLparam2(data, seed);
    uint64_t result = util::Hash64WithSeed(String_val(data), caml_string_length(data), Int_val(seed));
    CAMLreturn(caml_copy_int64(result));
}

CAMLprim value ml_farmhash_hash_with_seeds(value data, value seed0, value seed1)
{
    CAMLparam3(data, seed0, seed1);
    uint64_t result = util::Hash64WithSeeds(
        String_val(data), caml_string_length(data), Int_val(seed0), Int_val(seed1));
    CAMLreturn(Val_int(result));
}

CAMLprim value ml_farmhash_hash64_with_seeds(value data, value seed0, value seed1)
{
    CAMLparam3(data, seed0, seed1);
    uint64_t result = util::Hash64WithSeeds(
        String_val(data), caml_string_length(data), Int_val(seed0), Int_val(seed1));
    CAMLreturn(caml_copy_int64(result));
}

CAMLprim value ml_farmhash_hash128(value data)
{
    CAMLparam1(data);
    const uint128_t& hash128 = util::Hash128(String_val(data), caml_string_length(data));
    CAMLreturn(create_tpl128(hash128));
}

CAMLprim value ml_farmhash_hash128_with_seed(value data, value seed_tpl)
{
    CAMLparam1(data);
    const uint128_t& seed = util::Uint128(Int64_val(Field(seed_tpl, 0)), Int64_val(Field(seed_tpl, 1)));
    const uint128_t& hash128 = util::Hash128WithSeed(String_val(data), caml_string_length(data), seed);
    CAMLreturn(create_tpl128(hash128));
}

CAMLprim value ml_farmhash_fingerprint(value data)
{
    CAMLparam1(data);
    uint64_t result = util::Fingerprint64(String_val(data), caml_string_length(data));
    CAMLreturn(Val_int(result));
}

CAMLprim value ml_farmhash_fingerprint32(value data)
{
    CAMLparam1(data);
    uint32_t result = util::Fingerprint32(String_val(data), caml_string_length(data));
    CAMLreturn(caml_copy_int32(result));
}

CAMLprim value ml_farmhash_fingerprint64(value data)
{
    CAMLparam1(data);
    uint64_t result = util::Fingerprint64(String_val(data), caml_string_length(data));
    CAMLreturn(caml_copy_int64(result));
}

CAMLprim value ml_farmhash_fingerprint128(value data)
{
    CAMLparam1(data);
    const uint128_t& hash128 = util::Fingerprint128(String_val(data), caml_string_length(data));
    CAMLreturn(create_tpl128(hash128));
}

}
