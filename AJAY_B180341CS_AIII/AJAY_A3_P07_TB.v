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
for(i=0;i<32;i=i+1)
begin
	DIn = i ; addr = 32*i ; w =1'b1 ; r = 1'b0 ; #10 ;
end
DIn = 100 ;
for(i=0;i<32;i=i+1)
begin
	addr = 32*i ; w =1'b0 ; r = 1'b1 ; #10 ;
end

end

endmodule