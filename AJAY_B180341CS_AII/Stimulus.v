module StimHalfAdder ;

wire s,c ;
reg a,b ;

HalfAdder HOut(a,b,s,c) ;

initial 
begin
	a = 0 ; b = 0 ; #10 ; 
	a = 0 ; b = 1 ; #10 ;
	a = 1 ; b = 0 ; #10 ;
	a = 1 ; b = 1 ; #10 ;
end

endmodule 

module StimFullAdder ;

wire s,c ;
reg a,b,c0 ;

FullAdder FOut(a,b,c0,s,c) ;

initial 
begin
	c0 = 0 ; a = 0 ; b = 0 ; #10 ; 
	c0 = 0 ; a = 0 ; b = 1 ; #10 ;
	c0 = 0 ; a = 1 ; b = 0 ; #10 ;
	c0 = 0 ; a = 1 ; b = 1 ; #10 ;
	c0 = 1 ; a = 0 ; b = 0 ; #10 ; 
	c0 = 1 ; a = 0 ; b = 1 ; #10 ;
	c0 = 1 ; a = 1 ; b = 0 ; #10 ;
	c0 = 1 ; a = 1 ; b = 1 ; #10 ;
end

endmodule 

module StimInc4Bit ;

wire [3:0] o ;
reg [3:0] a ;
integer i ;

Inc4Bit IOut(a,o) ;

initial 
begin 
	for(i=0;i<16;i=i+1)
	begin 
		a = i ; #10 ;
	end
end

endmodule 

module StimAdd4Bit ;

wire [3:0] o ;
reg [3:0] a,b ;

Add4Bit A(a,b,o) ;

initial 
begin 
	a = 15 ; b = 15 ; #10 ;
	a = 15 ; b = 0 ; #10 ;
	a = 0 ; b = 15 ; #10 ;
	a = 0 ; b = 0 ; #10 ;
	a = 9 ; b = 6 ; #10 ;
	a = 9 ; b = 7 ; #10 ;
	a = 5 ; b = 7 ; #10 ;
	a = 6 ; b = 7 ; #10 ;
end

endmodule

module StimInc16Bit ;

wire [15:0] o ;
reg [15:0] a ;
integer i ;

Inc16Bit IOut(a,o) ;

initial 
begin 
	for(i=0;i<65535;i=i+1051)
	begin 
		a = i ; #10 ;
	end
end

endmodule 

module StimAdd16Bit ;

wire [15:0] o ;
reg [15:0] a,b ;

Add16Bit A(a,b,o) ;

initial 
begin 
	a = 15 ; b = 15 ; #10 ;
	a = 15 ; b = 0 ; #10 ;
	a = 0 ; b = 15 ; #10 ;
	a = 0 ; b = 0 ; #10 ;
	a = 962 ; b = 626 ; #10 ;
	a = 936 ; b = 772 ; #10 ;
	a = 485 ; b = 727 ; #10 ;
	a = 836 ; b = 753 ; #10 ;
end

endmodule

module StimNeg16 ;

wire [15:0] o ;
reg [15:0] a ;

Neg16 N(a,o) ;

initial
begin 
	a = 151 ; #10 ;
	a = 1251 ; #10 ;
	a = 38563 ; #10 ;
	a = 47251 ; #10 ;
	a = 12845 ; #10 ;
	a = 8221 ; #10 ;
	a = 3732 ; #10 ;
	a = 1754 ; #10 ;
end

endmodule 

module StimALU ;

wire [15:0] o ;
wire ng,zr ;
reg [15:0] x,y ;
reg zx,nx,zy,ny,f,no ;

ALU A(x,y,zx,nx,zy,ny,f,no,zr,ng,o) ;

initial 
begin 
	x = 16 ; y = 15 ; 
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // x+y 
	zx = 0 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // x-y 
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y-x 
	zx = 1 ; nx = 0 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // 0
	zx = 1 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // 1
	zx = 1 ; nx = 1 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // -1
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 0 ; #10 ; // x
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // y
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // -x
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // -y 
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // !x 
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 1 ; #10 ; // !y 
	zx = 0 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // x+1
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y+1
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 0 ; #10 ; // x-1 
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // y-1
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // x&y 
	zx = 0 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // x|y 
end

endmodule
	