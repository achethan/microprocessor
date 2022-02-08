module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
       input [63:0] CurrentPC, SignExtImm64;
       input Branch, ALUZero, Uncondbranch;
       output reg  [63:0] NextPC;
       /* write your code here */ 
       always @(*)
         begin
           if(Uncondbranch || (Branch && ALUZero))//Use the PC + SignExtend
             begin
               NextPC <= CurrentPC + (SignExtImm64); //#3
             end
           else //Do Normal Addition + 4
             begin
               NextPC <= CurrentPC + 4; //#2
             end
         
         end
       
endmodule

