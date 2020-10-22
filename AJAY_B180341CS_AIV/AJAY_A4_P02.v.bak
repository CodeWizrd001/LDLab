module RAM_ALU(e,op,DIn,clk,addr,w,r,DOut);

output reg [31:0] DOut;
input [15:0] DIn;
input [1:0]addr,op;
input r, w, clk,e;

reg [15:0] ram[1:0];
reg [31:0] ram_;

reg [31:0] product;
reg [15:0] multiplicand, multiplier,x,y;
integer i;

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

always @(op)
begin
if(op==0) begin
		multiplicand = ram[0]+ram[1];
		multiplier = ram[0]-ram[1];
		product = 0;
		for ( i = 0; i < 16; i= i+1)
		begin
			if ( multiplier[i])
				product =  product + (multiplicand<< i);
		end
		ram_ = product ;
end
if(op==1) begin
		x = ram[0] ;
		y = ram[1] ;
		product = x ;
		while(x>y)
		begin
			x = x - y ;
			product = x ;
		end
		ram_ = product ;
end
if(op==2) begin
		product = 0 ;
		x = ram[0] ;
		y = ram[1] ;
		for( i = x ; i > 0 ; i = i-y)
			product = product + 1 ;
end
if(op==3) begin
	x = ram[0] ;
	y = ram[0]-ram[1] ;
	product = x ;
	while(x>y)
	begin
		x = x - y ;
		product = x ;
	end
	ram_ = product ;
end
end

endmodule