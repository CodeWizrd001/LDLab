module RAM(e,DIn,clk,addr,w,r,DOut);

output reg [31:0] DOut;
input [15:0] DIn;
input [1:0]addr;
input r, w, clk,e;

reg [15:0] ram[1:0];
reg [31:0] ram_;

always @(posedge clk) 
begin
	if(w) 
		ram[addr] = DIn;
	if(r)
	begin
		if(addr>1)
			DOut = ram_;
		else
			DOut = {{32-16{1'b0}}, ram[addr]};
	end
end

reg[31:0] product;
reg [15:0] multiplicand, multiplier;
integer i;
always @(ram[0] or ram[1])
begin
	assign multiplicand = ram[0];
	assign multiplier = ram[1];
	product = 0;
	for ( i = 0; i < 16; i= i+1)
	begin
		if ( multiplier[i])
			product =  product + (multiplicand<< i);
	end
	ram_ = product;
end
endmodule
