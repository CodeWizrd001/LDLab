module StimSamabavam ;

wire [31:0] DOut;
reg [15:0] DIn ;
reg [1:0] addr,op;
reg r, w,clk,e;


RAM_ALU R(e,op,DIn,clk,addr,w,r,DOut);

initial 
begin 
	e = 1'b1 ;
	clk = 1'b0 ;
end

always
begin
	clk = ~clk; #1 ;
end

initial 
begin
	r = 1;
	op = 0 ;  // (X+Y)*(X-Y)
	addr = 0; DIn = 4; w = 1; #10;
	addr = 1; DIn = 5; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 445; w = 1; #10;
	addr = 1; DIn = 100; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 65535; w = 1; #10;
	addr = 1; DIn = 65535; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	op = 1 ;  // X%Y
	addr = 0; DIn = 4; w = 1; #10;
	addr = 1; DIn = 5; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 445; w = 1; #10;
	addr = 1; DIn = 100; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 65535; w = 1; #10;
	addr = 1; DIn = 65535; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	op = 2 ;	// X/Y
	addr = 0; DIn = 4; w = 1; #10;
	addr = 1; DIn = 5; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 445; w = 1; #10;
	addr = 1; DIn = 100; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 65535; w = 1; #10;
	addr = 1; DIn = 65535; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	op = 3 ;	// X%(X-Y)
	addr = 0; DIn = 4; w = 1; #10;
	addr = 1; DIn = 5; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 445; w = 1; #10;
	addr = 1; DIn = 100; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;

	addr = 0; DIn = 65535; w = 1; #10;
	addr = 1; DIn = 65535; w = 1; #10;
	addr = 2; w = 0;  r = 1; #10;
end
endmodule
