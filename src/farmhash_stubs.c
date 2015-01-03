#include "upstream/farmhash.h"

#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/unixsupport.h>
#include <caml/custom.h>

extern "C" {

CAMLprim value ml_hash(value data)
{
    CAMLparam1(data);
    uint64_t result = util::Hash64(String_val(data), caml_string_length(data));
    CAMLreturn(Val_int(result));
}

CAMLprim value ml_hash32(value data)
{
    CAMLparam1(data);
    uint32_t result = util::Hash32(String_val(data), caml_string_length(data));
    CAMLreturn(caml_copy_int32(result));
}

CAMLprim value ml_hash64(value data)
{
    CAMLparam1(data);
    uint64_t result = util::Hash64(String_val(data), caml_string_length(data));
    CAMLreturn(caml_copy_int64(result));
}

}
