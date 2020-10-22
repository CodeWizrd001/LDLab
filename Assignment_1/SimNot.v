module SimNot ;

wire b ;
reg a ;

NotGate NG(a,b) ;

initial 
begin
#100 a = 1'b0 ;
#100 a = 1'b1 ;
#100 ;
end 

endmodule  