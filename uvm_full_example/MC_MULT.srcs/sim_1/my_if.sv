`ifndef MY_IF
`define MY_IF


interface my_if (input bit clk);
    logic                         rst;
    logic [`BW_A - 1:0]           a_in;
    logic [`BW_B - 1:0]           b_in;
    logic                         start;
    logic [`BW_A + `BW_B - 1:0]   mult_out;
    logic                         valid;
    
    clocking cb @ (posedge clk); endclocking
    
endinterface

`endif
