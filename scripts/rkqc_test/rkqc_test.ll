; ModuleID = 'rkqc_test11.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define internal void @reverseBits32(i16* %a) nounwind uwtable {
entry:
  %0 = load i16* %a, align 2
  call void @assign_value_of_0_to_a.i16.i32_impl(i16 %0, i32 1)
  %1 = load i16* %a, align 2
  call void @assign_value_of_1_to_a.i16.i32_impl(i16 %1, i32 1)
  %2 = load i16* %a, align 2
  %arrayidx5 = getelementptr inbounds i16* %a, i64 1
  %3 = load i16* %arrayidx5, align 2
  call void @assign_value_of_b_to_a.i16.i16.i32_impl(i16 %2, i16 %3)
  %arrayidx8 = getelementptr inbounds i16* %a, i64 1
  %4 = load i16* %arrayidx8, align 2
  %5 = load i16* %a, align 2
  call void @a_swap_b.i16.i16.i32_impl(i16 %4, i16 %5)
  %arrayidx13 = getelementptr inbounds i16* %a, i64 1
  %6 = load i16* %arrayidx13, align 2
  %7 = load i16* %a, align 2
  call void @a_eq_a_plus_b.i16.i16.i32_impl(i16 %6, i16 %7, i32 1)
  %8 = load i16* %a, align 2
  call void @assign_value_of_0_to_a.i16.i32_impl(i16 %8, i32 1)
  %arrayidx1.1 = getelementptr inbounds i16* %a, i64 1
  %9 = load i16* %arrayidx1.1, align 2
  call void @assign_value_of_1_to_a.i16.i32_impl(i16 %9, i32 1)
  %arrayidx3.1 = getelementptr inbounds i16* %a, i64 1
  %10 = load i16* %arrayidx3.1, align 2
  %arrayidx5.1 = getelementptr inbounds i16* %a, i64 2
  %11 = load i16* %arrayidx5.1, align 2
  call void @assign_value_of_b_to_a.i16.i16.i32_impl(i16 %10, i16 %11)
  %arrayidx8.1 = getelementptr inbounds i16* %a, i64 2
  %12 = load i16* %arrayidx8.1, align 2
  %arrayidx10.1 = getelementptr inbounds i16* %a, i64 1
  %13 = load i16* %arrayidx10.1, align 2
  call void @a_swap_b.i16.i16.i32_impl(i16 %12, i16 %13)
  %arrayidx13.1 = getelementptr inbounds i16* %a, i64 2
  %14 = load i16* %arrayidx13.1, align 2
  %arrayidx15.1 = getelementptr inbounds i16* %a, i64 1
  %15 = load i16* %arrayidx15.1, align 2
  call void @a_eq_a_plus_b.i16.i16.i32_impl(i16 %14, i16 %15, i32 1)
  ret void
}

declare void @llvm.rkqc.assign_value_of_0_to_a.i16.i32(i16, i32) nounwind

declare void @llvm.rkqc.assign_value_of_1_to_a.i16.i32(i16, i32) nounwind

declare void @llvm.rkqc.assign_value_of_b_to_a.i16.i16.i32(i16, i16, i32) nounwind

declare void @llvm.rkqc.a_swap_b.i16.i16.i32(i16, i16, i32) nounwind

declare void @llvm.rkqc.a_eq_a_plus_b.i16.i16.i32(i16, i16, i32) nounwind

define internal void @encrypt() nounwind uwtable {
entry:
  %h0 = alloca [32 x i16], align 16
  %arraydecay = getelementptr inbounds [32 x i16]* %h0, i64 0, i64 0
  call void @reverseBits32(i16* %arraydecay)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @encrypt()
  ret i32 0
}

define void @assign_value_of_0_to_a.i16.i32_impl(i16 %target, i32) alwaysinline {
  %ancilla_zero_zero = alloca [1 x i8], align 8
  %2 = getelementptr inbounds [1 x i8]* %ancilla_zero_zero, i32 0, i32 0
  %3 = load i8* %2
  %ancilla_zero_garbage = alloca [1 x i8], align 8
  %4 = getelementptr inbounds [1 x i8]* %ancilla_zero_garbage, i32 0, i32 0
  %5 = load i8* %4
  tail call void @llvm.CNOT.i16.i8(i16 %target, i8 %5)
  tail call void @llvm.CNOT.i8.i16(i8 %5, i16 %target)
  tail call void @llvm.CNOT.i8.i16(i8 %3, i16 %target)
  ret void
}

declare void @llvm.CNOT.i16.i8(i16, i8) nounwind

declare void @llvm.CNOT.i8.i16(i8, i16) nounwind

define void @assign_value_of_1_to_a.i16.i32_impl(i16 %target, i32) alwaysinline {
  %ancilla_one_one = alloca [1 x i8], align 8
  %2 = getelementptr inbounds [1 x i8]* %ancilla_one_one, i32 0, i32 0
  %3 = load i8* %2
  %ancilla_zero_garbage = alloca [1 x i8], align 8
  %4 = getelementptr inbounds [1 x i8]* %ancilla_zero_garbage, i32 0, i32 0
  %5 = load i8* %4
  tail call void @llvm.CNOT.i16.i8(i16 %target, i8 %5)
  tail call void @llvm.CNOT.i8.i16(i8 %5, i16 %target)
  tail call void @llvm.CNOT.i8.i16(i8 %3, i16 %target)
  ret void
}

define void @assign_value_of_b_to_a.i16.i16.i32_impl(i16 %target, i16 %control) alwaysinline {
  %ancilla_zg = alloca [1 x i8], align 8
  %1 = getelementptr inbounds [1 x i8]* %ancilla_zg, i32 0, i32 0
  %2 = load i8* %1
  tail call void @llvm.CNOT.i16.i8(i16 %target, i8 %2)
  tail call void @llvm.CNOT.i8.i16(i8 %2, i16 %target)
  tail call void @llvm.CNOT.i16.i16(i16 %control, i16 %target)
  ret void
}

declare void @llvm.CNOT.i16.i16(i16, i16) nounwind

define void @a_swap_b.i16.i16.i32_impl(i16 %target0, i16 %target1) alwaysinline {
  tail call void @llvm.CNOT.i16.i16(i16 %target0, i16 %target1)
  tail call void @llvm.CNOT.i16.i16(i16 %target1, i16 %target0)
  tail call void @llvm.CNOT.i16.i16(i16 %target0, i16 %target1)
  ret void
}

define void @a_eq_a_plus_b.i16.i16.i32_impl(i16 %target, i16 %control, i32) alwaysinline {
  %ancilla_zg = alloca [1 x i8], align 8
  %2 = getelementptr inbounds [1 x i8]* %ancilla_zg, i32 0, i32 0
  %3 = load i8* %2
  %ancilla_zz = alloca [1 x i8], align 8
  %4 = getelementptr inbounds [1 x i8]* %ancilla_zz, i32 0, i32 0
  %5 = load i8* %4
  tail call void @llvm.CNOT.i16.i8(i16 %target, i8 %3)
  tail call void @llvm.CNOT.i16.i8(i16 %control, i8 %5)
  tail call void @llvm.CNOT.i16.i16(i16 %target, i16 %control)
  call void @ToffoliImpl_Q_A_Q(i16 %control, i8 %3, i16 %target)
  tail call void @llvm.CNOT.i8.i8(i8 %5, i8 %3)
  tail call void @llvm.CNOT.i8.i16(i8 %5, i16 %control)
  tail call void @llvm.CNOT.i8.i16(i8 %5, i16 %control)
  tail call void @llvm.CNOT.i16.i8(i16 %control, i8 %5)
  tail call void @llvm.CNOT.i8.i16(i8 %5, i16 %control)
  tail call void @llvm.CNOT.i8.i16(i8 %3, i16 %target)
  tail call void @llvm.CNOT.i16.i8(i16 %target, i8 %3)
  tail call void @llvm.CNOT.i8.i16(i8 %3, i16 %target)
  ret void
}

declare void @llvm.CNOT.i8.i8(i8, i8) nounwind

declare void @llvm.Toffoli.i16.i8.i16(i16, i8, i16) nounwind

define void @ToffoliImpl_Q_A_Q(i16 %target, i8 %control1, i16 %control2) alwaysinline {
  tail call void @llvm.H.i16(i16 %target)
  tail call void @llvm.Tdag.i8(i8 %control1)
  tail call void @llvm.T.i16(i16 %control2)
  tail call void @llvm.T.i16(i16 %target)
  tail call void @llvm.CNOT.i16.i8(i16 %control2, i8 %control1)
  tail call void @llvm.CNOT.i8.i16(i8 %control1, i16 %target)
  tail call void @llvm.Tdag.i8(i8 %control1)
  tail call void @llvm.CNOT.i16.i16(i16 %target, i16 %control2)
  tail call void @llvm.CNOT.i8.i16(i8 %control1, i16 %control2)
  tail call void @llvm.Tdag.i8(i8 %control1)
  tail call void @llvm.Tdag.i16(i16 %control2)
  tail call void @llvm.T.i16(i16 %target)
  tail call void @llvm.CNOT.i8.i16(i8 %control1, i16 %target)
  tail call void @llvm.S.i8(i8 %control1)
  tail call void @llvm.CNOT.i16.i16(i16 %target, i16 %control2)
  tail call void @llvm.CNOT.i16.i8(i16 %control2, i8 %control1)
  tail call void @llvm.H.i16(i16 %target)
  ret void
}

declare void @llvm.H.i16(i16) nounwind

declare void @llvm.Tdag.i8(i8) nounwind

declare void @llvm.T.i16(i16) nounwind

declare void @llvm.Tdag.i16(i16) nounwind

declare void @llvm.S.i8(i8) nounwind

declare void @llvm.H.i8(i8) nounwind

declare i1 @llvm.MeasX.i8(i8) nounwind

declare i1 @llvm.MeasZ.i8(i8) nounwind

declare void @llvm.PrepX.i8(i8, i32) nounwind

declare void @llvm.PrepZ.i8(i8, i32) nounwind

declare void @llvm.Rx.i8(i8, double) nounwind

declare void @llvm.Ry.i8(i8, double) nounwind

declare void @llvm.Rz.i8(i8, double) nounwind

declare void @llvm.Sdag.i8(i8) nounwind

declare void @llvm.T.i8(i8) nounwind

declare void @llvm.X.i8(i8) nounwind

declare void @llvm.Y.i8(i8) nounwind

declare void @llvm.Z.i8(i8) nounwind

declare i1 @llvm.MeasX.i16(i16) nounwind

declare i1 @llvm.MeasZ.i16(i16) nounwind

declare void @llvm.PrepX.i16(i16, i32) nounwind

declare void @llvm.PrepZ.i16(i16, i32) nounwind

declare void @llvm.Rx.i16(i16, double) nounwind

declare void @llvm.Ry.i16(i16, double) nounwind

declare void @llvm.Rz.i16(i16, double) nounwind

declare void @llvm.S.i16(i16) nounwind

declare void @llvm.Sdag.i16(i16) nounwind

declare void @llvm.X.i16(i16) nounwind

declare void @llvm.Y.i16(i16) nounwind

declare void @llvm.Z.i16(i16) nounwind

declare void @llvm.Toffoli.i16.i16.i16(i16, i16, i16) nounwind

declare void @llvm.Fredkin.i16.i16.i16(i16, i16, i16) nounwind

declare void @llvm.Toffoli.i16.i16.i8(i16, i16, i8) nounwind

declare void @llvm.Fredkin.i16.i16.i8(i16, i16, i8) nounwind

declare void @llvm.Toffoli.i16.i8.i8(i16, i8, i8) nounwind

declare void @llvm.Fredkin.i16.i8.i8(i16, i8, i8) nounwind

declare void @llvm.Fredkin.i16.i8.i16(i16, i8, i16) nounwind

declare void @llvm.Toffoli.i8.i16.i16(i8, i16, i16) nounwind

declare void @llvm.Fredkin.i8.i16.i16(i8, i16, i16) nounwind

declare void @llvm.Toffoli.i8.i16.i8(i8, i16, i8) nounwind

declare void @llvm.Fredkin.i8.i16.i8(i8, i16, i8) nounwind

declare void @llvm.Toffoli.i8.i8.i8(i8, i8, i8) nounwind

declare void @llvm.Fredkin.i8.i8.i8(i8, i8, i8) nounwind

declare void @llvm.Toffoli.i8.i8.i16(i8, i8, i16) nounwind

declare void @llvm.Fredkin.i8.i8.i16(i8, i8, i16) nounwind
