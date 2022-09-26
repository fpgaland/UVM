`ifndef MY_ITEM_BASE
`define MY_ITEM_BASE


class my_item_base extends uvm_sequence_item;

    rand bit                        rst;
    rand bit [`BW_A - 1:0]          a_in;
    rand bit [`BW_A - 1:0]          b_in;
    logic    [`BW_A + `BW_B - 1:0]  mult_out;                   

    `uvm_object_utils_begin(my_item_base)
        `uvm_field_int(rst, UVM_DEFAULT)
        `uvm_field_int(a_in, UVM_DEFAULT)
        `uvm_field_int(b_in, UVM_DEFAULT)
        `uvm_field_int(mult_out, UVM_DEFAULT)
    `uvm_object_utils_end

    function new(string name = "my_item_base");
        super.new(name);
    endfunction

endclass

`endif
