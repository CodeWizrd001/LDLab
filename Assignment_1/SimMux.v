module SimMux ;

wire c ;
reg a,b,s ;

Mux M_1(a,b,s,c) ;

initial 
begin 
#100 s = 1'b0 ; a = 1'b0 ; b = 1'b0 ;
#100 s = 1'b0 ; a = 1'b0 ; b = 1'b1 ;
#100 s = 1'b0 ; a = 1'b1 ; b = 1'b0 ;
#100 s = 1'b0 ; a = 1'b1 ; b = 1'b1 ;
#100 s = 1'b1 ; a = 1'b0 ; b = 1'b0 ;
#100 s = 1'b1 ; a = 1'b0 ; b = 1'b1 ;
#100 s = 1'b1 ; a = 1'b1 ; b = 1'b0 ;
#100 s = 1'b1 ; a = 1'b1 ; b = 1'b1 ;
#100 ;
end

endmodule