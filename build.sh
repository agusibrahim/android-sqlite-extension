CCARM=/opt/ndk/std-toolchains/android-9-arm/bin/gcc
CCX86=/opt/ndk/std-toolchains/android-9-x86/bin/gcc
CCARM64=/opt/ndk/std-toolchains/android-21-arm64/bin/gcc
CCX86_64=/opt/ndk/std-toolchains/android-21-x86_64/bin/gcc
CCMIPS=/opt/ndk/std-toolchains/android-9-mips/bin/gcc
CCMIPS64=/opt/ndk/std-toolchains/android-21-mips64/bin/gcc
DBU=$(pwd)/build

for i in "damerau_levenshtein" "levenshtein" "soundex" "compress" "spellfix" "fuzzer" "nextchar" "percentile" "amatch" "sha1" "fileio" "closure" "scrub" "regexp" "csv" "json1" "shathree" "vtshim" "wholenumber" "rot13" "carray" "series" "remember" "liblevenshtein" "metaphone"
do
  $CCX86 -shared -fPIC -Wall -I/agus/sqlite-amalgamation-3180000/SQLiteFuzzySearch $i.c -o $DBU/$i"_x86.so"
  $CCARM -shared -fPIC -Wall -I/agus/sqlite-amalgamation-3180000/SQLiteFuzzySearch $i.c -o $DBU/$i"_arm.so"

  $CCARM64 -shared -fPIC -Wall -I/agus/sqlite-amalgamation-3180000/SQLiteFuzzySearch $i.c -o $DBU/$i"_arm64.so"
  $CCX86_64 -shared -fPIC -Wall -I/agus/sqlite-amalgamation-3180000/SQLiteFuzzySearch $i.c -o $DBU/$i"_x86-64.so"

  $CCMIPS -shared -fPIC -Wall -I/agus/sqlite-amalgamation-3180000/SQLiteFuzzySearch $i.c -o $DBU/$i"_mips.so"
  $CCMIPS64 -shared -fPIC -Wall -I/agus/sqlite-amalgamation-3180000/SQLiteFuzzySearch $i.c -o $DBU/$i"_mips64.so"

  echo  $i.so
done;
