#A little helper txt 

####some data structures to keep track of:
* __struct FnCall__ {
      Function* func;
      Value	* instPtr;
      std:: vector<qGateArg\> qArgs;
   }
   
* __mapFunction__:
   Type: vector<FnCall\>
   
* __qbitsInitInFunc__:
   how to print it: line 866, (or before Optimize func.)
   
####new global data structures:
* __struct OpGate__{
	char gateTy;
	int target;
	int control1;
	int control2;
   }
  
declaration: line 62.
   
##### Encoding for gateTy: 
|  c |   CNOT   |
|:--:|:--------:|
|  h |     H    |
|  t |     T    |
|  s |     S    |
|  T |   Tdag   |
|  x |     X    |
|  y |     Y    |
|  z |     Z    |
| o  |    Tof   |
| X  | measureX |
| Z | measureZ |
| S |   Sdag   |
| n |   PrepX  |
| m |   PrepZ  |
| r |    Rz    |

* __gateList__: type vector<OpGate\>, declaration: line 85
* __map<int, int\> bitMap__: map the name of qubits to its number
 declaration: line 86

