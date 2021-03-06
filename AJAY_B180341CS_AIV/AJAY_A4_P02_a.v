module RAM(e,op,DIn,clk,addr,w,r,DOut);

output reg [31:0] DOut;
input [15:0] DIn;
input [1:0]addr,op;
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
reg [15:0] multiplicand, multiplier,x,y;
integer i;

case(op)
 2'b00 :begin
	always @(mem[0] or mem[1])
	begin
		assign multiplicand = mem[0]+mem[1];
		assign multiplier = mem[0]+mem[1];
		product = 0;
		for ( i = 0; i < 16; i= i+1)
		begin
			if ( multiplier[i])
				product =  product + (multiplicand<< i);
		end
		mem_ = product:
	end
	end
 2'b01 :begin
	x = mem[0] ;
	y = mem[1] ;
	product = x ;
	while(x>y)
	begin
		x = x - y ;
		product = x ;
	end
	mem_ = product
 2'b10 :begin
	
 2'b11 :begin
	x = mem[0] ;
	y = mem[0]-mem[1] ;
	product = x ;
	while(x>y)
	begin
		x = x - y ;
		product = x ;
	end
	mem_ = product
endcase
endmodule