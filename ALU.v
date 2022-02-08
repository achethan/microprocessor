`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0110
`define PassB 4'b0111
`define LSL 4'b1111


module ALU(BusW, BusA, BusB, ALUCtrl, Zero);
    
    parameter n = 64;

    output  [n-1:0] BusW;
    input   [n-1:0] BusA, BusB;
    input   [3:0] ALUCtrl;
    output  Zero;
    
    reg     [n-1:0] BusW;
    //Original had non-blocking
    
    always @(ALUCtrl or BusA or BusB) begin
        case(ALUCtrl)
            `AND: begin//AND CASE
                BusW <= BusA & BusB; //#20
            end
            
            `OR: begin//OR Case
                BusW <= BusA | BusB; //#20                
                //$display("Wri%h",Address, WriteData);
                
            end
            
            `ADD: begin//ADD Case
                BusW <= BusA + BusB; //#20
            end
            
            `SUB: begin //SUB CASE
                BusW <= BusA - BusB; //#20
            end
            
            `PassB: begin //PASSB
                BusW <= BusB; //#20
            end
            
            `LSL: begin //LSL
                BusW <= BusB<<(BusA*16); //#20
            end
              
        endcase
       // $display("%d: BUSA %h BUSB %h BUSW %h",ALUCtrl, BusA, BusB, BusW);
    end

    assign  Zero = (BusW == 0); //#1
endmodule
