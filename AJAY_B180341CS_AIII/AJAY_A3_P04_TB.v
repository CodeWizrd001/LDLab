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