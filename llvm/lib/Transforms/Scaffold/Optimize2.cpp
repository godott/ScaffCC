#include <cstdlib>
#include <cstdio>

#include "llvm/ADT/ArrayRef.h"

#include "llvm/Constants.h"
#include "llvm/Function.h"
#include "llvm/Instructions.h"
#include "llvm/Intrinsics.h"
#include "llvm/LLVMContext.h"
#include "llvm/Pass.h"

#include "llvm/Support/CallSite.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/InstVisitor.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Transforms/Utils/BasicBlockUtils.h"

using namespace llvm;
using namespace std;

namespace{
    struct Optimize2 : public ModulePass{
        static char ID;
        Optimize2() : ModulePass(ID) {}

        struct GateVisitor : public InstVisitor<GateVisitor>{
            Module *M;
            GateVisitor(Module *module) : M(module) {}

            void visitAllocaInst(AllocaInst &AI){
                Type *allocatedType = AI.getAllocatedType();
                if(ArrayType *arrayType = dyn_cast<ArrayType>(allocatedType)){
                    Type *elementType = arrayType->getElementType();
                    if(elementType -> isIntegerTy(16)){
                        errs()<<"Found new Qbit Allocation\n"; 
                    }
                    if(elementType -> isIntegerTy(8)){
                        errs()<<"Found new abit Allocation\n"; 
                    }
                }
                if(allocatedType->isIntegerTy(16))
                    errs() << "Found New Qbit Allocation\n";
                if(allocatedType->isIntegerTy(8))
                    errs() << "Found New abit Allocation\n";
            }
            void visitCallInst(CallInst &I){
                errs()<<I.getOperand(0)<<"\n"; 
            }
        };//struct GateVisitor

        virtual bool runOnModule(Module &M){
            GateVisitor Gate(&M);

            Gate.visit(M);
            return true;
        }//runOnModule()
    };//struct Optimize2

}

char Optimize2::ID=0;
static RegisterPass<Optimize2> X("Optimize2", "Optimize", false, false);
