CCARM=/opt/ndk/std-toolchains/android-9-arm/bin/gcc
CCX86=/opt/ndk/std-toolchains/android-9-x86/bin/gcc
CCARM64=/opt/ndk/std-toolchains/android-21-arm64/bin/gcc
CCX86_64=/opt/ndk/std-toolchains/android-21-x86_64/bin/gcc
CCMIPS=/opt/ndk/std-toolchains/android-9-mips/bin/gcc
CCMIPS64=/opt/ndk/std-toolchains/android-21-mips64/bin/gcc
DBU=$(pwd)/build
DIRARM=$DBU/arm
DIRARM64=$DBU/arm64
DIRX86=$DBU/x86
DIRX86_64=$DBU/x86_64
DIRMIPS=$DBU/mips
DIRMIPS64=$DBU/mips64
rm -rf $DBU
mkdir $DBU
mkdir $DIRARM $DIRX86 $DIRARM64 $DIRX86_64 $DIRMIPS $DIRMIPS64

for i in "damerau_levenshtein" "levenshtein" "soundex" "compress" "spellfix" "fuzzer" "nextchar" "percentile" "amatch" "sha1" "fileio" "closure" "scrub" "regexp" "csv" "json1" "shathree" "vtshim" "wholenumber" "rot13" "carray" "series" "remember" "liblevenshtein" "metaphone"
do
  $CCX86 -shared -fPIC -Wall -I$(pwd) $i.c -o $DIRX86/$i".so"
  $CCARM -shared -fPIC -Wall -I$(pwd) $i.c -o $DIRARM/$i".so"

  $CCARM64 -shared -fPIC -Wall -I$(pwd) $i.c -o $DIRARM64/$i".so"
  $CCX86_64 -shared -fPIC -Wall -I$(pwd) $i.c -o $DIRX86_64/$i".so"

  $CCMIPS -shared -fPIC -Wall -I$(pwd) $i.c -o $DIRMIPS/$i".so"
  $CCMIPS64 -shared -fPIC -Wall -I$(pwd) $i.c -o $DIRMIPS64/$i".so"

  echo  $i.so
done;
