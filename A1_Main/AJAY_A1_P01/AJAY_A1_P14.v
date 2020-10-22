module NotGate(a,b) ;   // 1

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module AndGate(a,b,c) ;  // 2 

output c ;
input a,b ;
wire x ;

nand(x,a,b);
nand(c,x,x) ;

endmodule 

module OrGate(a,b,c) ;  // 3 

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module Mux2x1(a,b,s,c) ;  // 12

output c ;
input a,b,s ;
wire x,y,z ;

NotGate NG_1(s,z );
AndGate AG_1(a,z,x) ;
AndGate AG_2(b,s,y) ;
OrGate OG_1(x,y,c) ;

endmodule 

module Mux2x1_16(a,b,s,o) ;  // 14

output [15:0] o ;
input [15:0] a,b ;
input s ;

Mux2x1 M[15:0](a,b,s,o) ;

endmodule
