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