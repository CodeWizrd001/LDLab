module StimPC ;

reg re,inc,l,clk,cs,w,r ;
reg [15:0] load ;
wire [15:0] DOut ;

PC P(re,inc,load,l,clk,cs,w,r,DOut) ;

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
	re = 1'b1 ;inc = 1'b0 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 0 ; l = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b0 ; load = 1000 ; l = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b0 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;
	re = 1'b1 ; inc = 1'b1 ; load = 0 ; l = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #5 ;

end

endmodule 