module StimALU ;

wire [15:0] o ;
wire ng,zr ;
reg [15:0] x,y ;
reg zx,nx,zy,ny,f,no ;

ALU A(x,y,zx,nx,zy,ny,f,no,zr,ng,o) ;

initial 
begin 
	x = 16 ; y = 15 ; 
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // x+y 
	zx = 0 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // x-y 
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y-x 
	zx = 1 ; nx = 0 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // 0
	zx = 1 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // 1
	zx = 1 ; nx = 1 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // -1
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 0 ; #10 ; // x
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // y
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // -x
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // -y 
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // !x 
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 1 ; #10 ; // !y 
	zx = 0 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // x+1
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y+1
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 0 ; #10 ; // x-1 
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // y-1
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // x&y 
	zx = 0 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // x|y 
	x = 1826 ; y = 1475 ; 
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // x+y 
	zx = 0 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // x-y 
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y-x 
	zx = 1 ; nx = 0 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // 0
	zx = 1 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // 1
	zx = 1 ; nx = 1 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // -1
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 0 ; #10 ; // x
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // y
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // -x
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; #10 ; // -y 
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // !x 
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 1 ; #10 ; // !y 
	zx = 0 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // x+1
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; #10 ; // y+1
	zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 0 ; #10 ; // x-1 
	zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; #10 ; // y-1
	zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; #10 ; // x&y 
	zx = 0 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 0 ; no = 1 ; #10 ; // x|y 
end

endmodule
	
