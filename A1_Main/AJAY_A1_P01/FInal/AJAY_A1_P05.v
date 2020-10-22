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

module XorGate(a,b,c) ;  // 5

output c ;
input a,b ;
wire x,y,x1,y1;

NotGate NG_1(a,x) ;
NotGate NG_2(b,y) ;
AndGate AG_1(a,y,x1) ;
AndGate AG_2(b,x,y1) ;
OrGate OG_1(x1,y1,c) ;

endmodule