module SimAnd ;

wire c ;
reg a,b ;

AndGate AG_Out(a,b,c) ;

initial 
begin 
#100 a = 1'b0 ; b = 1'b0 ;
#100 a = 1'b1 ; b = 1'b0 ;
#100 a = 1'b0 ; b = 1'b1 ;
#100 a = 1'b1 ; b = 1'b1 ; 
#100 ;
end

endmodule 
