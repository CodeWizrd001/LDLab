module OrGate(a,b,c) ;  // 3 

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule

module OrGate8In(i1,i2,i3,i4,i5,i6,i7,i8,o) ;  // 11

output o ;
input i1,i2,i3,i4,i5,i6,i7,i8;
wire a,b,w,x,y,z ;

OrGate O1(i2,i1,w) ;
OrGate O2(i4,i3,x) ;
OrGate O3(i5,i6,y) ;
OrGate O4(i7,i8,z) ;
OrGate O5(w,x,a) ;
OrGate O6(y,z,b) ;
OrGate O7(a,b,o) ;

endmodule
