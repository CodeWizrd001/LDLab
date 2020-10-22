module AndGate(a,b,c) ;  // 2 

output c ;
input a,b ;
wire x ;

nand(x,a,b);
nand(c,x,x) ;

endmodule 

module AndGate16(a,b,c) ;  // 8

output [0:15] c ;
input [0:15] a,b ;

AndGate AG_1[0:15](a,b,c) ;

endmodule 
