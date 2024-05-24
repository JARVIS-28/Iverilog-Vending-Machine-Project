//TESTBENCH
module vending_machine_tb;

    reg clk;
    reg [1:0] in;
    reg rst;

    wire out;
    wire [1:0] change;


    vending_machine_18105070 uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("vending_machine_18105070.vcd");
    $dumpvars(0, vending_machine_tb);

    rst = 1;
    clk = 0;
    #6 rst = 0;

    #10;
    in = 2; 
    #10 in = 1; 

    #100;

    in = 2; 
    #10 in = 2; 

    #100;

    $finish;
end

always @(posedge clk) begin
    $display("Time %0t: in = %b, out = %b, change = %b", $time, in, out, change);
end

endmodule
