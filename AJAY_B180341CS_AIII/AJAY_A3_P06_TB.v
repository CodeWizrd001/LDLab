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
for(i=0;i<64;i=i+1)
begin
	DIn = i ; addr = 2*i ; w =1'b1 ; r = 1'b0 ; #10 ;
end
DIn = 100 ;
for(i=0;i<64;i=i+1)
begin
	addr = 2*i ; w =1'b0 ; r = 1'b1 ; #10 ;
end

end

endmodule