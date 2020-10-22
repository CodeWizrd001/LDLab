module NotGate(a,b) ;   // 1

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module NotGate16(a,b) ; // 7 

output [0:15] b ;
input [0:15] a ;

NotGate N_1[0:15](a,b);

endmodule 