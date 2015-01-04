open Ocamlbuild_plugin
;;

flag ["c"; "compile"] @@ S [
  A "-ccopt";
  match Sys.big_endian with
  | true -> A "-DFARMHASH_BIG_ENDIAN"
  | false -> A "-DFARMHASH_LITTLE_ENDIAN"]
;;
