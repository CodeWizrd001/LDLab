module NotGate(a,b) ;

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module Neg16(a,b) ;

output [15:0] b ;
input [15:0] a ;

NotGate N[15:0](a,b) ;

endmodule 