module OrGate(a,b,c) ;  // 3 

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module OrGate16(a,b,c) ;  // 9

output [0:15] c ;
input [0:15] a,b ;

OrGate OG_1[0:15](a,b,c) ;

endmodule 
