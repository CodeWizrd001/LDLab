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