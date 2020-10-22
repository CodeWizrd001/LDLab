module RAM(e,DIn,clk,addr,w,r,DOut);

output reg [31:0] DOut;
input [15:0] DIn;
input [1:0]addr;
input r, w, clk,e;

reg [15:0] mem[1:0];
reg [31:0] mem_;

always @(posedge clk) 
begin
	if(w) 
		mem[addr] = DIn;
	if(r)
	begin
		if(addr>1)
			DOut = mem_;
		else
			DOut = {{32-16{1'b0}}, mem[addr]};
	end
end

reg[31:0] product;
reg [15:0] multiplicand, multiplier;
integer i;
always @(mem[0] or mem[1])
begin
	assign multiplicand = mem[0];
	assign multiplier = mem[1];
	product = 0;
	for ( i = 0; i < 16; i= i+1)
	begin
		if ( multiplier[i])
			product =  product + (multiplicand<< i);
	end
	mem_ = product;
end
endmodule
