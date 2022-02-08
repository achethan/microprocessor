module SignExtender(BusImm, Imm26, Ctrl);
   output [63:0] BusImm;
   input [25:0] Imm26;
   input [2:0] Ctrl;
   
   
   reg [63:0] oReg;
   
   //reg exitBit;
   always @(*)
   
      begin
         if(Ctrl == 0)//Sign Extend D-Type
           begin
            //exitBit <= Imm26[20];
            oReg = {{55{Imm26[20]}}, Imm26[20:12]};
           end
         if(Ctrl == 1) //CBZ Type
           begin
            //exitBit <= Imm26[23];
            oReg = {{43{Imm26[23]}}, Imm26[23:5], 2'b0};
           end
         if(Ctrl == 2) //B Type
           begin
            //exitBit <= Imm26[25];
            oReg = {{36{Imm26[25]}}, Imm26[25:0], 2'b0};
           end
         if(Ctrl == 3) //I-Type
           begin
            //exitBit <= 1'b0;
            oReg = {52'b0, Imm26[21:10]};
           end
         if(Ctrl == 4) //MOVZ
           begin
            //exitBit <= 1'b0;
            oReg = {48'b0, Imm26[20:5]};
           end
      end
   
   assign BusImm = oReg;
endmodule
