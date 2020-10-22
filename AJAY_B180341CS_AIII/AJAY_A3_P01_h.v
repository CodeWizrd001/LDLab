module NotGate(a,b) ;

output b ;
input a ;

nand(b,a,a) ;

endmodule 

module AndGate(a,b,c) ;

output c ;
input a,b ;
wire x ;

nand(x,a,b) ;
nand(c,x,x) ; 

endmodule 

module OrGate(a,b,c) ;

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module Mux2x1(a,b,s,c) ;

output c ;
input a,b,s ;
wire x,y,z ;

NotGate NG_1(s,z );
AndGate AG_1(a,z,x) ;
AndGate AG_2(b,s,y) ;
OrGate OG_1(x,y,c) ;

endmodule 

module Nand3(a,b,c,o) ;

output o ;
input a,b,c ;
wire x,y ;

AndGate A(a,b,x) ;
AndGate B(x,c,y) ;
NotGate C(y,o) ;

endmodule 

module DLatchWR(d,c,q,q_,re) ;

output q,q_,re ;
input d,c ;
wire c_,s,r,x,y,re_ ;

AndGate S(d,d,s) ;
NotGate R(d,r) ;

nand(x,c,s) ;
nand(y,c,r) ;
Nand3 N1(q_,x,1'b1,q) ;
Nand3 N2(q,y,re,q_) ;

endmodule 

module DFlipFlopFEAResetLow(d,c,q,q_,re) ;

output q,q_ ;
input d,c,re ;
wire Q,Q_,c_ ;

nand(c_,c,c) ;

DLatchWR D1(d,c,Q,Q_,re) ;
DLatchWR D2(Q,c_,q,q_,re) ;

endmodule 
