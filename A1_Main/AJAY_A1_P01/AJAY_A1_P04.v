module NotGate(a,b) ;   // 1

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module OrGate(a,b,c) ;  // 3 

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module NorGate(a,b,c) ;  // 4

output c ;
input a,b ;
wire x ;
OrGate OG_1(a,b,x) ;
NotGate NG_1(x,c) ;

endmodule 