module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);

   input [4:0] RA, RB, RW;
   input Clk, RegWr; 
   input [63:0] BusW;
   output [63:0] BusA, BusB;
   reg [63:0] registers [31:0];
   
   assign BusA = (RA == 5'b11111)? 0: registers[RA]; //BusA takes RA data if Register is not 31 //#2
   assign BusB = (RB == 5'b11111)? 0: registers[RB]; //BusB takes RB data if Register is not 31 //#2
     
     
     
     
    always@(negedge Clk)
      begin
        if(RegWr == 1 && RW != 5'b11111)
          begin
            registers[RW] <= #3 BusW; //Make Sure to write to register rw //#3
          end
      
      end 
   
       
       
endmodule

