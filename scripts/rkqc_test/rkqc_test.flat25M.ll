; ModuleID = 'rkqc_test/rkqc_test.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %ancilla_zero_zero.i8.i.i = alloca [1 x i8], align 8
  %ancilla_zero_garbage.i9.i.i = alloca [1 x i8], align 8
  %ancilla_one_one.i6.i.i = alloca [1 x i8], align 8
  %ancilla_zero_garbage.i7.i.i = alloca [1 x i8], align 8
  %ancilla_zg.i5.i.i = alloca [1 x i8], align 8
  %ancilla_zg.i3.i.i = alloca [1 x i8], align 8
  %ancilla_zz.i4.i.i = alloca [1 x i8], align 8
  %ancilla_zero_zero.i.i.i = alloca [1 x i8], align 8
  %ancilla_zero_garbage.i2.i.i = alloca [1 x i8], align 8
  %ancilla_one_one.i.i.i = alloca [1 x i8], align 8
  %ancilla_zero_garbage.i.i.i = alloca [1 x i8], align 8
  %ancilla_zg.i1.i.i = alloca [1 x i8], align 8
  %ancilla_zg.i.i.i = alloca [1 x i8], align 8
  %ancilla_zz.i.i.i = alloca [1 x i8], align 8
  %h0.i = alloca [32 x i16], align 16
  %arraydecay.i = getelementptr inbounds [32 x i16]* %h0.i, i64 0, i64 0
  %0 = load i16* %arraydecay.i, align 2
  %1 = getelementptr inbounds [1 x i8]* %ancilla_zero_zero.i8.i.i, i32 0, i32 0
  %2 = load i8* %1
  %3 = getelementptr inbounds [1 x i8]* %ancilla_zero_garbage.i9.i.i, i32 0, i32 0
  %4 = load i8* %3
  call void @llvm.CNOT.i16.i8(i16 %0, i8 %4) nounwind
  call void @llvm.CNOT.i8.i16(i8 %4, i16 %0) nounwind
  call void @llvm.CNOT.i8.i16(i8 %2, i16 %0) nounwind
  %5 = load i16* %arraydecay.i, align 2
  %6 = getelementptr inbounds [1 x i8]* %ancilla_one_one.i6.i.i, i32 0, i32 0
  %7 = load i8* %6
  %8 = getelementptr inbounds [1 x i8]* %ancilla_zero_garbage.i7.i.i, i32 0, i32 0
  %9 = load i8* %8
  call void @llvm.CNOT.i16.i8(i16 %5, i8 %9) nounwind
  call void @llvm.CNOT.i8.i16(i8 %9, i16 %5) nounwind
  call void @llvm.CNOT.i8.i16(i8 %7, i16 %5) nounwind
  %10 = load i16* %arraydecay.i, align 2
  %arrayidx5.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %11 = load i16* %arrayidx5.i.i, align 2
  %12 = getelementptr inbounds [1 x i8]* %ancilla_zg.i5.i.i, i32 0, i32 0
  %13 = load i8* %12
  call void @llvm.CNOT.i16.i8(i16 %10, i8 %13) nounwind
  call void @llvm.CNOT.i8.i16(i8 %13, i16 %10) nounwind
  call void @llvm.CNOT.i16.i16(i16 %11, i16 %10) nounwind
  %arrayidx8.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %14 = load i16* %arrayidx8.i.i, align 2
  %15 = load i16* %arraydecay.i, align 2
  call void @llvm.CNOT.i16.i16(i16 %14, i16 %15) nounwind
  call void @llvm.CNOT.i16.i16(i16 %15, i16 %14) nounwind
  call void @llvm.CNOT.i16.i16(i16 %14, i16 %15) nounwind
  %arrayidx13.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %16 = load i16* %arrayidx13.i.i, align 2
  %17 = load i16* %arraydecay.i, align 2
  %18 = getelementptr inbounds [1 x i8]* %ancilla_zg.i3.i.i, i32 0, i32 0
  %19 = load i8* %18
  %20 = getelementptr inbounds [1 x i8]* %ancilla_zz.i4.i.i, i32 0, i32 0
  %21 = load i8* %20
  call void @llvm.CNOT.i16.i8(i16 %16, i8 %19) nounwind
  call void @llvm.CNOT.i16.i8(i16 %17, i8 %21) nounwind
  call void @llvm.CNOT.i16.i16(i16 %16, i16 %17) nounwind
  call void @llvm.H.i16(i16 %17) nounwind
  call void @llvm.Tdag.i8(i8 %19) nounwind
  call void @llvm.T.i16(i16 %16) nounwind
  call void @llvm.T.i16(i16 %17) nounwind
  call void @llvm.CNOT.i16.i8(i16 %16, i8 %19) nounwind
  call void @llvm.CNOT.i8.i16(i8 %19, i16 %17) nounwind
  call void @llvm.Tdag.i8(i8 %19) nounwind
  call void @llvm.CNOT.i16.i16(i16 %17, i16 %16) nounwind
  call void @llvm.CNOT.i8.i16(i8 %19, i16 %16) nounwind
  call void @llvm.Tdag.i8(i8 %19) nounwind
  call void @llvm.Tdag.i16(i16 %16) nounwind
  call void @llvm.T.i16(i16 %17) nounwind
  call void @llvm.CNOT.i8.i16(i8 %19, i16 %17) nounwind
  call void @llvm.S.i8(i8 %19) nounwind
  call void @llvm.CNOT.i16.i16(i16 %17, i16 %16) nounwind
  call void @llvm.CNOT.i16.i8(i16 %16, i8 %19) nounwind
  call void @llvm.H.i16(i16 %17) nounwind
  call void @llvm.CNOT.i8.i8(i8 %21, i8 %19) nounwind
  call void @llvm.CNOT.i8.i16(i8 %21, i16 %17) nounwind
  call void @llvm.CNOT.i8.i16(i8 %21, i16 %17) nounwind
  call void @llvm.CNOT.i16.i8(i16 %17, i8 %21) nounwind
  call void @llvm.CNOT.i8.i16(i8 %21, i16 %17) nounwind
  call void @llvm.CNOT.i8.i16(i8 %19, i16 %16) nounwind
  call void @llvm.CNOT.i16.i8(i16 %16, i8 %19) nounwind
  call void @llvm.CNOT.i8.i16(i8 %19, i16 %16) nounwind
  %22 = load i16* %arraydecay.i, align 2
  %23 = getelementptr inbounds [1 x i8]* %ancilla_zero_zero.i.i.i, i32 0, i32 0
  %24 = load i8* %23
  %25 = getelementptr inbounds [1 x i8]* %ancilla_zero_garbage.i2.i.i, i32 0, i32 0
  %26 = load i8* %25
  call void @llvm.CNOT.i16.i8(i16 %22, i8 %26) nounwind
  call void @llvm.CNOT.i8.i16(i8 %26, i16 %22) nounwind
  call void @llvm.CNOT.i8.i16(i8 %24, i16 %22) nounwind
  %arrayidx1.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %27 = load i16* %arrayidx1.1.i.i, align 2
  %28 = getelementptr inbounds [1 x i8]* %ancilla_one_one.i.i.i, i32 0, i32 0
  %29 = load i8* %28
  %30 = getelementptr inbounds [1 x i8]* %ancilla_zero_garbage.i.i.i, i32 0, i32 0
  %31 = load i8* %30
  call void @llvm.CNOT.i16.i8(i16 %27, i8 %31) nounwind
  call void @llvm.CNOT.i8.i16(i8 %31, i16 %27) nounwind
  call void @llvm.CNOT.i8.i16(i8 %29, i16 %27) nounwind
  %arrayidx3.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %32 = load i16* %arrayidx3.1.i.i, align 2
  %arrayidx5.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 2
  %33 = load i16* %arrayidx5.1.i.i, align 2
  %34 = getelementptr inbounds [1 x i8]* %ancilla_zg.i1.i.i, i32 0, i32 0
  %35 = load i8* %34
  call void @llvm.CNOT.i16.i8(i16 %32, i8 %35) nounwind
  call void @llvm.CNOT.i8.i16(i8 %35, i16 %32) nounwind
  call void @llvm.CNOT.i16.i16(i16 %33, i16 %32) nounwind
  %arrayidx8.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 2
  %36 = load i16* %arrayidx8.1.i.i, align 2
  %arrayidx10.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %37 = load i16* %arrayidx10.1.i.i, align 2
  call void @llvm.CNOT.i16.i16(i16 %36, i16 %37) nounwind
  call void @llvm.CNOT.i16.i16(i16 %37, i16 %36) nounwind
  call void @llvm.CNOT.i16.i16(i16 %36, i16 %37) nounwind
  %arrayidx13.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 2
  %38 = load i16* %arrayidx13.1.i.i, align 2
  %arrayidx15.1.i.i = getelementptr inbounds i16* %arraydecay.i, i64 1
  %39 = load i16* %arrayidx15.1.i.i, align 2
  %40 = getelementptr inbounds [1 x i8]* %ancilla_zg.i.i.i, i32 0, i32 0
  %41 = load i8* %40
  %42 = getelementptr inbounds [1 x i8]* %ancilla_zz.i.i.i, i32 0, i32 0
  %43 = load i8* %42
  call void @llvm.CNOT.i16.i8(i16 %38, i8 %41) nounwind
  call void @llvm.CNOT.i16.i8(i16 %39, i8 %43) nounwind
  call void @llvm.CNOT.i16.i16(i16 %38, i16 %39) nounwind
  call void @llvm.H.i16(i16 %39) nounwind
  call void @llvm.Tdag.i8(i8 %41) nounwind
  call void @llvm.T.i16(i16 %38) nounwind
  call void @llvm.T.i16(i16 %39) nounwind
  call void @llvm.CNOT.i16.i8(i16 %38, i8 %41) nounwind
  call void @llvm.CNOT.i8.i16(i8 %41, i16 %39) nounwind
  call void @llvm.Tdag.i8(i8 %41) nounwind
  call void @llvm.CNOT.i16.i16(i16 %39, i16 %38) nounwind
  call void @llvm.CNOT.i8.i16(i8 %41, i16 %38) nounwind
  call void @llvm.Tdag.i8(i8 %41) nounwind
  call void @llvm.Tdag.i16(i16 %38) nounwind
  call void @llvm.T.i16(i16 %39) nounwind
  call void @llvm.CNOT.i8.i16(i8 %41, i16 %39) nounwind
  call void @llvm.S.i8(i8 %41) nounwind
  call void @llvm.CNOT.i16.i16(i16 %39, i16 %38) nounwind
  call void @llvm.CNOT.i16.i8(i16 %38, i8 %41) nounwind
  call void @llvm.H.i16(i16 %39) nounwind
  call void @llvm.CNOT.i8.i8(i8 %43, i8 %41) nounwind
  call void @llvm.CNOT.i8.i16(i8 %43, i16 %39) nounwind
  call void @llvm.CNOT.i8.i16(i8 %43, i16 %39) nounwind
  call void @llvm.CNOT.i16.i8(i16 %39, i8 %43) nounwind
  call void @llvm.CNOT.i8.i16(i8 %43, i16 %39) nounwind
  call void @llvm.CNOT.i8.i16(i8 %41, i16 %38) nounwind
  call void @llvm.CNOT.i16.i8(i16 %38, i8 %41) nounwind
  call void @llvm.CNOT.i8.i16(i8 %41, i16 %38) nounwind
  ret i32 0
}

declare void @llvm.CNOT.i16.i8(i16, i8) nounwind

declare void @llvm.CNOT.i8.i16(i8, i16) nounwind

declare void @llvm.CNOT.i16.i16(i16, i16) nounwind

declare void @llvm.CNOT.i8.i8(i8, i8) nounwind

declare void @llvm.H.i16(i16) nounwind

declare void @llvm.Tdag.i8(i8) nounwind

declare void @llvm.T.i16(i16) nounwind

declare void @llvm.Tdag.i16(i16) nounwind

declare void @llvm.S.i8(i8) nounwind
