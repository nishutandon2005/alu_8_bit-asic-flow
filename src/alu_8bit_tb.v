`timescale 1ns/1ps

module alu_8bit_tb;
    reg [7:0] a, b;
    reg [3:0] alu_op;
    wire [7:0] result;
    wire zero_flag, carry_flag, overflow_flag;
    
    alu_8bit uut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .result(result),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag)
    );
    
    initial begin
        $dumpfile("alu_8bit_tb.vcd");
        $dumpvars(0, alu_8bit_tb);
        
        // Test ADD
        a = 8'd15; b = 8'd10; alu_op = 4'b0000; #10;
        $display("ADD: %d + %d = %d, Carry=%b", a, b, result, carry_flag);
        
        // Test SUB
        a = 8'd25; b = 8'd10; alu_op = 4'b0001; #10;
        $display("SUB: %d - %d = %d", a, b, result);
        
        // Test AND
        a = 8'b11110000; b = 8'b10101010; alu_op = 4'b0010; #10;
        $display("AND: %b & %b = %b", a, b, result);
        
        // Test OR
        a = 8'b11110000; b = 8'b10101010; alu_op = 4'b0011; #10;
        $display("OR: %b | %b = %b", a, b, result);
        
        // Test XOR
        a = 8'b11110000; b = 8'b10101010; alu_op = 4'b0100; #10;
        $display("XOR: %b ^ %b = %b", a, b, result);
        
        // Test NOT
        a = 8'b11110000; alu_op = 4'b0101; #10;
        $display("NOT: ~%b = %b", a, result);
        
        // Test SLL
        a = 8'd4; b = 8'd2; alu_op = 4'b0110; #10;
        $display("SLL: %d << %d = %d", a, b[2:0], result);
        
        // Test SRL
        a = 8'd16; b = 8'd2; alu_op = 4'b0111; #10;
        $display("SRL: %d >> %d = %d", a, b[2:0], result);
        
        // Test overflow (ADD)
        a = 8'd127; b = 8'd1; alu_op = 4'b0000; #10;
        $display("ADD Overflow: %d + %d = %d, Overflow=%b", a, b, result, overflow_flag);
        
        // Test carry (ADD)
        a = 8'd255; b = 8'd1; alu_op = 4'b0000; #10;
        $display("ADD Carry: %d + %d = %d, Carry=%b", a, b, result, carry_flag);
        
        // Test zero flag
        a = 8'd5; b = 8'd5; alu_op = 4'b0001; #10;
        $display("SUB Zero: %d - %d = %d, Zero=%b", a, b, result, zero_flag);
        
        // Test EQ
        a = 8'd42; b = 8'd42; alu_op = 4'b1001; #10;
        $display("EQ: %d == %d = %d", a, b, result);
        
        // Test LT
        a = 8'd10; b = 8'd20; alu_op = 4'b1010; #10;
        $display("LT: %d < %d = %d", a, b, result);
        
        // Test GT
        a = 8'd30; b = 8'd20; alu_op = 4'b1011; #10;
        $display("GT: %d > %d = %d", a, b, result);
        
        #10 $finish;
    end
endmodule
