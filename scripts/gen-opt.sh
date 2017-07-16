#!/bin/bash

DIR=$(dirname $0)
ROOT=$DIR/..
BIN=$ROOT/build/Release+Asserts/bin
LIB=$ROOT/build/Release+Asserts/lib
SCAF=$LIB/Scaffold.so
OPT=$BIN/opt
CLANG=$BIN/clang
LLVM_LINK=$BIN/llvm-link
LLI=$BIN/lli
I_FLAGS="-I/usr/include -I/usr/include/x86_64-linux-gnu -I/usr/lib/gcc/x86_64-linux-gnu/4.8/include"

# Module flattening thresholds: must be picked from the set in scripts/flattening_thresh.py
THRESHOLDS=(25M)

# Create directory to put all byproduct and output files in
for f in $*; do
  b=$(basename $f .scaffold)  
  echo "[gen-opt.sh] $b: Creating output directory ..."
  mkdir -p "$b"
  #mv ./*${b}* ${b} 2>/dev/null
done

# Generate .ll file if not done already
for f in $*; do
  b=$(basename $f .scaffold)
  echo "[gen-opt.sh] $b: Compiling ..."
  if [ ! -e ${b}/${b}.ll ]; then
    # Generate compiled files
    $ROOT/scaffold.sh -r $f
    mv ${b}11.ll ${b}11.ll.keep_me
    # clean intermediary compilation files (comment out for speed)
    #$ROOT/scaffold.sh -c $f
    # Keep the final output for the compilation
    mv ${b}11.ll.keep_me ${b}/${b}.ll
  fi
done

# Module flattening pass with different thresholds
for f in $*; do
  b=$(basename $f .scaffold)
  echo "[gen-opt.sh] $b: Computing module gate counts ..."  
  $OPT -S -load $SCAF -ResourceCount2 ${b}/${b}.ll > /dev/null 2> ${b}.out  
  python $DIR/flattening_thresh.py ${b}  
  for th in ${THRESHOLDS[@]}; do      
    if [ ! -e ${b}/${b}.flat${th}.ll ]; then
      echo "[gen-opt.sh] $b_flat${th}: Flattening ..."      
      mv ${b}.flat${th}.txt flat_info.txt
      $OPT -S -load $SCAF -FlattenModule -dce -internalize -globaldce ${b}/${b}.ll -o ${b}/${b}.flat${th}.ll
    fi
  done
  rm -f *flat*.txt ${b}.out     
done

for f in $*; do
  b=$(basename $f .scaffold)
  echo "[gen-opt.sh] $b: Toffoli Replace..."  
  $OPT -S -load $SCAF -ToffoliReplace  ${b}/${b}.flat25M.ll -o ${b}/${b}.flat25M_Tof.ll
  echo "[gen-opt.sh] $b: Optimizing..."  
  $OPT -S -load $SCAF -Optimize ${b}/${b}.flat25M_Tof.ll > ${b}/${b}.flat25M_Tof_Optimized.ll > /dev/null 2> haha_${b}.txt
#  echo "[gen-opt.sh] $b: Gen-qasm..."  
#  $OPT -S -load $SCAF -gen-qasm  ${b}/${b}.flat25M_Tof.ll 2> ${b}/${b}.qasmh  > /dev/null
#  echo "[gen-opt.sh] $b: converting back to C++"  
#  python flatten-qasm.py ${b}/${b}.qasmh 
#  echo "[gen-opt.sh] $b: generating _qasm"  
#  $CLANG ${b}/${b}_qasm.scaffold -o ${b}/${b}_qasm
#  echo "[gen-opt.sh] $b: generating qasmf"  
#  ./${b}/${b}_qasm > ${b}/${b}.tmp
#  cat fdecl.out ${b}/${b}.tmp > ${b}/${b}.qasmf
done
