module alu_8bit (
    input [7:0] a,
    input [7:0] b,
    input [3:0] alu_op,
    output reg [7:0] result,
    output reg zero_flag,
    output reg carry_flag,
    output reg overflow_flag
);

    parameter ADD  = 4'b0000;
    parameter SUB  = 4'b0001;
    parameter AND  = 4'b0010;
    parameter OR   = 4'b0011;
    parameter XOR  = 4'b0100;
    parameter NOT  = 4'b0101;
    parameter SLL  = 4'b0110;
    parameter SRL  = 4'b0111;
    parameter SRA  = 4'b1000;
    parameter EQ   = 4'b1001;
    parameter LT   = 4'b1010;
    parameter GT   = 4'b1011;

    reg [8:0] temp;

    always @(*) begin
        carry_flag = 0;
        overflow_flag = 0;
        
        case(alu_op)
            ADD: begin
                temp = a + b;
                result = temp[7:0];
                carry_flag = temp[8];
                overflow_flag = (a[7] == b[7]) && (result[7] != a[7]);
            end
            
            SUB: begin
                temp = a - b;
                result = temp[7:0];
                carry_flag = temp[8];
                overflow_flag = (a[7] != b[7]) && (result[7] != a[7]);
            end
            
            AND: result = a & b;
            OR:  result = a | b;
            XOR: result = a ^ b;
            NOT: result = ~a;
            SLL: result = a << b[2:0];
            SRL: result = a >> b[2:0];
            SRA: result = $signed(a) >>> b[2:0];
            EQ:  result = (a == b) ? 8'b1 : 8'b0;
            LT:  result = (a < b) ? 8'b1 : 8'b0;
            GT:  result = (a > b) ? 8'b1 : 8'b0;
            
            default: result = 8'b0;
        endcase
        
        zero_flag = (result == 8'b0);
    end

endmodule
