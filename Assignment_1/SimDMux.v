module SimDMux ;

wire a,b ;
reg s,c ;

DMux DM(c,s,a,b) ;

initial 
begin 
#100 s = 1'b0 ; c = 1'b0 ;
#100 s = 1'b0 ; c = 1'b1 ;
#100 s = 1'b1 ; c = 1'b0 ;
#100 s = 1'b1 ; c = 1'b1 ;
#100 ;
end 

endmodule 