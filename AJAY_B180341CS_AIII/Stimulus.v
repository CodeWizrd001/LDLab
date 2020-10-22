module StimDFlipFlopRE ;

wire q,q_ ;
reg d,c ;

DFlipFlop D(d,c,q,q_) ;

initial 
begin 
	c = 1'b1 ;
end

always 
begin 
	c = ~c ; #3 ;
end 

initial
begin
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #10 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #10 ;
end

endmodule

module StimDFlipFlopSReset ;

wire q,q_ ;
reg d,c,re ;

DFlipFlopSReset D(d,c,q,q_,re) ;

initial 
begin 
	c = 1'b1 ;
end

always 
begin 
	c = ~c ; #3 ;
end 

initial
begin
	d = 1'b0 ; re = 1'b0 ; #10 ; 
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ; re = 1'b0 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ;
end

endmodule

module StimDFlipFlopAResetLow ;

wire q,q_ ;
reg d,c,re ;

DFlipFlopAResetLow D(d,c,q,q_,re) ;

initial 
begin 
	c = 1'b1 ;
end

always 
begin 
	c = ~c ; #3 ;
end 

initial
begin
	d = 1'b0 ; re = 1'b0 ; #10 ; 
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ; re = 1'b0 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ;
end

endmodule

module StimDFlipFlopAResetHigh ;

wire q,q_ ;
reg d,c,re ;

DFlipFlopAResetHigh D(d,c,q,q_,re) ;

initial 
begin 
	c = 1'b1 ;
end

always 
begin 
	c = ~c ; #3 ;
end 

initial
begin
	d = 1'b0 ; re = 1'b0 ; #10 ; 
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ; re = 1'b0 ;
	d = 1'b0 ; #10 ;
	d = 1'b1 ; #5 ; re = 1'b1 ; #5 ;
end

endmodule

module StimBinaryCell ;

wire DOut ;
reg DIn,clk,cs,w,r ;

BinaryCell B(DIn,clk,cs,w,r,DOut) ;

initial 
begin 
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end 

initial
begin
	DIn = 1'b0 ; cs = 1'b0 ; w = 1'b0 ; r = 1'b0 ; #5 ; 
	DIn = 1'b1 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 1'b1 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 1'b1 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 1'b0 ; cs = 1'b1 ; w = 1'b0 ; r = 1'b1 ; #5 ;
	DIn = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 1'b1 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 1'b1 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
end

endmodule

module StimReg ;

wire [15:0] DOut ;
reg [15:0] DIn ;
reg clk,cs,w,r ;

Reg16Bit B(DIn,clk,cs,w,r,DOut) ;

initial 
begin 
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end 

initial
begin
	DIn = 1465 ; cs = 1'b0 ; w = 1'b0 ; r = 1'b0 ; #5 ; 
	DIn = 325 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 4362 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 724 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 345 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 45 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 64 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 3264 ; cs = 1'b1 ; w = 1'b0 ; r = 1'b1 ; #5 ;
	DIn = 263 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	DIn = 643 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
	DIn = 42 ; cs = 1'b0 ; w = 1'b1 ; r = 1'b0 ; #5 ;
end

endmodule

module StimRAM8 ;

wire [15:0] DOut ;
reg [15:0] DIn ;
reg e,clk,w,r ;
reg [2:0] addr ;

RAM8 R(e,DIn,clk,addr,w,r,DOut) ;

initial 
begin 
	e = 1'b1 ;
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end

initial 
begin
	DIn = 1 ; addr = 0 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 2 ; addr = 1 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 3 ; addr = 2 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 4 ; addr = 3 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 5 ; addr = 4 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 6 ; addr = 5 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 7 ; addr = 6 ; w = 1'b1 ; r = 1'b0 ; #10 ;
	DIn = 8 ; addr = 7 ; w = 1'b1 ; r = 1'b0 ; #10 ;

	DIn = 0 ; addr = 0 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 1 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 2 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 3 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 4 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 5 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 6 ; w = 1'b0 ; r = 1'b1 ; #10 ;
	DIn = 0 ; addr = 7 ; w = 1'b0 ; r = 1'b1 ; #10 ;

end

endmodule	

module StimRAM64 ;

wire [15:0] DOut ;
reg [15:0] DIn ;
reg e,clk,w,r ;
reg [5:0] addr ;
integer i ;

RAM64 R(e,DIn,clk,addr,w,r,DOut) ;

initial 
begin 
	e = 1'b1 ;
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end

initial 
begin
for(i=0;i<64;i=i+1)
begin
	DIn = i ; addr = i ; w =1'b1 ; r = 1'b0 ; #10 ;
end
DIn = 100 ;
for(i=0;i<64;i=i+1)
begin
	addr = i ; w =1'b0 ; r = 1'b1 ; #10 ;
end

end

endmodule

module StimRAM512 ;

wire [15:0] DOut ;
reg [15:0] DIn ;
reg e,clk,w,r ;
reg [8:0] addr ;
integer i ;

RAM512 R(e,DIn,clk,addr,w,r,DOut) ;

initial 
begin 
	e = 1'b1 ;
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end

initial 
begin
for(i=0;i<128;i=i+1)
begin
	DIn = i ; addr = i ; w =1'b1 ; r = 1'b0 ; #10 ;
end
DIn = 100 ;
for(i=0;i<128;i=i+1)
begin
	addr = i ; w =1'b0 ; r = 1'b1 ; #10 ;
end

end

endmodule

module StimRAM4K ;

wire [15:0] DOut ;
reg [15:0] DIn ;
reg e,clk,w,r ;
reg [11:0] addr ;
integer i ;

RAM4K R(e,DIn,clk,addr,w,r,DOut) ;

initial 
begin 
	e = 1'b1 ;
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end

initial 
begin
for(i=0;i<128;i=i+1)
begin
	DIn = i ; addr = 4*i ; w =1'b1 ; r = 1'b0 ; #10 ;
end
DIn = 100 ;
for(i=0;i<128;i=i+1)
begin
	addr = 4*i ; w =1'b0 ; r = 1'b1 ; #10 ;
end

end

endmodule

module StimRAM16K ;

wire [15:0] DOut ;
reg [15:0] DIn ;
reg e,clk,w,r ;
reg [13:0] addr ;
integer i ;

RAM16K R(e,DIn,clk,addr,w,r,DOut) ;

initial 
begin 
	e = 1'b1 ;
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end

initial 
begin
for(i=0;i<12;i=i+1)
begin
	DIn = i ; addr = 10*i ; w =1'b1 ; r = 1'b0 ; #10 ;
end
DIn = 100 ;
for(i=0;i<12;i=i+1)
begin
	addr = 10*i ; w =1'b0 ; r = 1'b1 ; #10 ;
end

end

endmodule

module StimPC ;

reg re,inc,l,clk,cs,w,r ;
reg [15:0] load ;
wire [15:0] DOut ;

PC P(re,inc,load,l,clk,cs,w,r,DOut) ;

initial 
begin 
	clk = 1'b1 ;
end

always 
begin 
	clk = ~clk ; #3 ;
end

initial 
begin
	re = 1'b1 ;inc = 1'b0 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 0 ; l = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 1000 ; l = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b1 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;

end

endmodule 