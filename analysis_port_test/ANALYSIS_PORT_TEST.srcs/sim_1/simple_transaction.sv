`ifndef SIMPLE_TRANSACTION 
`define SIMPLE_TRANSACTION

class simple_transaction extends uvm_sequence_item;
rand bit[7:0] data_e;
rand bit[7:0] data_o;

constraint CE { data_e[0] == 1'b0; }    // Even number
constraint CO { data_o[0] == 1'b1; }    // Odd number

`uvm_object_utils_begin(simple_transaction)
    `uvm_field_int(data_e, UVM_DEFAULT)
    `uvm_field_int(data_o, UVM_DEFAULT)
`uvm_component_utils_end

function new (string name = "simple_transaction");
    super.new(name);
endfunction

endclass

`endif
